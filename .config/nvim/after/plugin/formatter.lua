-- Formatter
local formatter_prettier = {
	function()
		return {
			-- exe = "prettier",
			-- args = {
			--   "--stdin-filepath",
			--   vim.api.nvim_buf_get_name(0)
			-- },
			-- stdin = true,
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,
}

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = formatter_prettier,
		javascriptreact = formatter_prettier,
		typescript = formatter_prettier,
		typescriptreact = formatter_prettier,
		json = formatter_prettier,
		graphql = formatter_prettier,
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.astro,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql FormatWrite
augroup END
]],
	true
)

vim.api.nvim_command("autocmd BufWritePre *.ex,*.go lua vim.lsp.buf.formatting()")
