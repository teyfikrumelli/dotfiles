local status, zenmode = pcall(require, "zen-mode")
if not status then
  return
end

zenmode.setup({
  window = {
    width = .95,
    height = 1,
  },
  plugins = {
    tmux = {
      enabled = true,
    },
  },
})
