local status, project = pcall(require, "project_nvim")
if not status then
	return
end
project.setup({

	-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },

	-- patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git", "Makefile", "package.json" },
})

local tele_status, telescope = pcall(require, "telescope")
if not tele_status then
	return
end

telescope.load_extension('projects')
