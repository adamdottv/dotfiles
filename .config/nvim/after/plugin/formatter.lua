-- Formatter
local formatter_prettier = {
	function()
		return {
			-- exe = "prettier",
			-- args = {
   --      "--plugin-search-dir=.",
			--   "--stdin-filepath",
			--   vim.api.nvim_buf_get_name(0)
			-- },
			-- stdin = true,
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0), '--plugin-search-dir=.' },
			stdin = true,
		}
	end,
}

local rustfmt = function()
  return {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  }
end

require("formatter").setup({
	logging = true,
  log_level = 0,
	filetype = {
		javascript = formatter_prettier,
		javascriptreact = formatter_prettier,
		typescript = formatter_prettier,
		typescriptreact = formatter_prettier,
		json = formatter_prettier,
		graphql = formatter_prettier,
		astro = formatter_prettier,
    rust = {rustfmt},
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.astro,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql,*.rs FormatWrite
augroup END
]],
	true
)

vim.api.nvim_command("autocmd BufWritePre *.ex,*.go lua vim.lsp.buf.formatting()")
