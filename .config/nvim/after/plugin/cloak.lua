-- Setup nvim-cmp.
local status, cloak = pcall(require, "cloak")
if not status then
  return
end

cloak.setup({})
