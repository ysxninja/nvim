vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable wrap and spell for text like documents",
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Autocommand to set up folding for Neorg files
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "norg",
--     callback = function()
--         -- Set folding method to Treesitter
--         vim.opt_local.foldmethod = 'expr'
--         vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
--         vim.opt_local.foldenable = true
--         vim.opt_local.foldlevelstart = 99
--
--         -- Function to fold `@document.meta` section
--         local function fold_meta()
--             local bufnr = vim.fn.bufnr()
--             local meta_start = vim.fn.search('@document.meta', 'nw')
--             if meta_start > 0 then
--                 vim.fn.setpos('.', {bufnr, meta_start, 1, 0})
--                 -- Use pcall to catch errors and prevent them from propagating
--                 pcall(vim.cmd, 'normal! zc')
--                 -- vim.cmd('normal! zc')
--                 -- Move to the last cursor position
--                 vim.cmd('normal! g`"')
--             end
--         end
--
--         -- Call the fold_meta function on BufWinEnter event
--         vim.api.nvim_create_autocmd("BufWinEnter", {
--             buffer = 0, -- Apply to the current buffer
--             callback = fold_meta
--         })
--     end,
-- })
-- Autocommand to set up folding for Org files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
        -- Set folding method to Treesitter
        vim.opt_local.foldmethod = 'expr'
        vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.opt_local.foldenable = true
        vim.opt_local.foldlevelstart = 99

        -- Function to fold `@document.meta` section
        local function fold_meta()
            local bufnr = vim.fn.bufnr()
            local meta_start = vim.fn.search('* Document meta-information', 'nw')
            if meta_start > 0 then
                local current_pos = vim.fn.getcurpos()
                print("found:", current_pos)
                vim.fn.setpos('.', {bufnr, meta_start, 1, 0})
                -- Use pcall to catch errors and prevent them from propagating
                -- pcall(vim.cmd, 'normal! zc')
                vim.cmd('normal! zc')
                -- Move to the last cursor position
                -- vim.cmd('normal! g`"')
            end
        end

        -- Call the fold_meta function on BufWinEnter event
        vim.api.nvim_create_autocmd("BufWinEnter", {
            buffer = 0, -- Apply to the current buffer
            callback = function()
                vim.defer_fn(function()
                    fold_meta()
                end,  100)
            end,
        })
    end,
})
