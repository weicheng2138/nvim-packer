-- import indent-line plugin safely
local setup, indent_line = pcall(require, "indent-line")
if not setup then
	return
end

-- configure/enable git
indent_line.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
})
