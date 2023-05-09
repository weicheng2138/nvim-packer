local setup, tailwind = pcall(require, "tailwindcss-colors")
if not setup then
	return
end

tailwind.setup()
