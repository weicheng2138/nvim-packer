local setup, todo = pcall(require, "todo-comments")
if not setup then
	return
end

todo.setup()
