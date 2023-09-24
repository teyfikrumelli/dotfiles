local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine tokyonight theme
local tokyonight = require("lualine.themes.tokyonight")

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = tokyonight,
	},
})
