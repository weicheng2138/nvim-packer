local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Color scheme is not found")
  return
end
