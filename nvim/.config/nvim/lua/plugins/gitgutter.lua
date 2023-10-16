local status, gitgutter = pcall(require, "gitgutter")
if not status then
  return
end

gitgutter.setup()
