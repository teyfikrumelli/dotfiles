local status, dadbod = pcall(require, "dadbod")
if not status then
  return
end

dadbod.setup()
