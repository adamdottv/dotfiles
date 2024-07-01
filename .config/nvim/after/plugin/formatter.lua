-- Formatter
local formatter_prettier = {
	function()
		return {
			-- exe = "prettier",
			-- args = {
   --      "--plugin-search-dir=.",
			--   "--stdin-filepath",
			--   "\"" .. vim.api.nvim_buf_get_name(0) .. "\""
			-- },
			-- stdin = true,
			exe = "prettierd",
			args = { "\"" .. vim.api.nvim_buf_get_name(0) .. "\"", '--plugin-search-dir=.' },
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
		svg = formatter_prettier,
		graphql = formatter_prettier,
		astro = formatter_prettier,
    svelte = formatter_prettier,
    html = formatter_prettier,
    css = formatter_prettier,
    rust = {require("formatter.filetypes.rust").rustfmt},
    go = {require("formatter.filetypes.go").golines}
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.astro,*.svelte,*.ts,*.tsx,*.mjs,*.js,*.jsx,*.json,*.graphql,*.html,*.css,*.svg,*.rs,*.go FormatWrite
augroup END
]],
	true
)

vim.api.nvim_command("autocmd BufWritePre *.ex lua vim.lsp.buf.format()")
