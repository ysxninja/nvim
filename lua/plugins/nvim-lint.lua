---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = "User AstroFile",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    linters_by_ft = {
      lua = { "selene" },
      puppet = { "puppet-lint" },
      rego = { "opa_check" },
      ansible = { "ansible_lint" },
      cfn = { "cfn_lint" },
      sql = { "sqlfluff" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
    linters = {
      cfn_lint = {
        ignore_exitcode = true,
      },
      selene = {
        condition = function(ctx)
          return #vim.fs.find("selene.toml", { path = ctx.filename, upward = true, type = "file" }) > 0
        end,
      },
      eslint_d = {
        cmd = "eslint_d",
      },
    },
  },
  config = function(_, opts)
    local lint = require "lint"
    local astrocore = require "astrocore"

    -- Directly set linters_by_ft from opts
    lint.linters_by_ft = opts.linters_by_ft or {}

    -- Ensure that individual linters are properly set
    for name, linter in pairs(opts.linters or {}) do
      lint.linters[name] = (type(linter) == "table" and type(lint.linters[name]) == "table")
          and vim.tbl_deep_extend("force", lint.linters[name], linter)
        or linter
    end

    -- Valid linters function remains the same
    local valid_linters = function(ctx, linters)
      if not linters then return {} end
      return vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        return linter
          and type(linter.cmd) == "string"
          and vim.fn.executable(linter.cmd) == 1
          and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
      end, linters)
    end

    -- Patch _resolve_linter_by_ft using astrocore (as you originally had)
    lint._resolve_linter_by_ft = astrocore.patch_func(lint._resolve_linter_by_ft, function(orig, ...)
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }
      ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")

      -- Resolve linters based on the file context
      local linters = valid_linters(ctx, orig(...))
      if not linters[1] then linters = valid_linters(ctx, lint.linters_by_ft["_"]) end -- fallback
      require("astrocore").list_insert_unique(linters, valid_linters(ctx, lint.linters_by_ft["*"])) -- global

      return linters
    end)

    -- Start linting immediately
    lint.try_lint()

    -- Timer logic for linting after events
    local timer = vim.loop.new_timer()
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
      group = vim.api.nvim_create_augroup("auto_lint", { clear = true }),
      desc = "Automatically try linting",
      callback = function()
        timer:start(100, 0, function()
          timer:stop()
          vim.schedule(lint.try_lint)
        end)
      end,
    })
  end,
}
