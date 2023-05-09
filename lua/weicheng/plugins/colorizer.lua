-- import colorizer plugin safely
local setup, colorizer = pcall(require, "colorizer")
if not setup then
	return
end

-- configure/enable colorizer
colorizer.setup({
	"css",
	"javascript",
	html = {
		mode = "foreground",
	},
})
