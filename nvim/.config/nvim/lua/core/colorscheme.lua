local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
  return
end

tokyonight.setup({
  style = "night",
  sidebars = { "qf", "help", "terminal" },
  lualine_bold = true,

  on_colors = function(colors)
    colors.bg = ""
    colors.bg_sidebar = ""
  end,
})

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
  print("colorscheme not found!")
  return
end
