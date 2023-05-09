# nvim
My personal neovim configuration.

## Standard Mode
- when you delete, you also yank

- `<CR>` as Enter, `<C-a>` as Ctrl + a 
- `<S + i>` and `<S + a>` for insert to the end and top.
- `<S + d>` delete from current position to the end.
- `<C + n>` to go down and `<C + p>` to go up the tab menu.
- `<C + w>` is the window mode, use `s` or `v` to create new window, and use `hjkl` to switch between windows and `o` to close all buffers.
- When you do the remap, it always give you some time (a little lagging time to do the combination of key) to execute the new mapping key and do the default movement. So do it with some special key like `<C> or <leader>`
- You can source the `.vimrc` file with `:so %` or remap it with `nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>`
- **Mark** use `m` + `A` to make the line where you are, and use `'` + `A` to go back from another file.
- Quick fix: when you use `:grep SOCK **/*.c` to search for all files, you can use `copen` to open the list of the search results, use `cnext` to jump to the next result and use `cprev` to jump back. And also remap it.

- **Search and Replace**: `/` to search, `N` to previous result, `n` to next result
	- `/<term><CR>` then use `n` to jump to the next, use `N` to the previous.
	- you can select with visual and search (`:s/...`) for certain region `'<,'>:s/target/new_term`.
	- `:s/target/replace_term` to when on the line of where you are
	- `:s/target/replace_term/g` to replace the whole term of the line
	- `:s/target/replace_term/gc` to let you replace one by one and determine the action that you are going to do.
	- `:%s/target/new_term/g` replace the whole file of what you find.

- **Macro**: `q` is the macro mode
	- Press `q` and pick a letter for the macro, then it starts to record it.
	- `<C + a>` will automatically increment the number
	- After all you have done, you can press `q` again to stop recording.
	- Use `@[the letter you macro]` to execute the macro.
	- Use `[times]@[the letter you macro]` to do it several times.

- **Register**: `"` is the key value recording what you have record
	1. Use `:reg` to take a look of what you have record
	2. Use `"[letter]p` to paste the recording command
	3. Then you can edit it. No need to recording the whole process again.
	4. Use `"[letter]y` to save it with a specific letter, no need to be the same one.
	5. And do it with `@[letter]`

- **Horizontal movement**:
	1. `C` delete the right-hand side of the line and go into insert mode.
	2. `S` delete the whole line, in respect to the indent and go into the insert mode.
- `f` to find the character behind the line and use `;` and `,`. You can also keep doing it to jump horizontally.
- `t` to find the character behind the line, land before the character and use `;` and `,`. You can also keep doing it to jump horizontally. You can use `dt)` to delete the content of the conditional close. You can also use `ct)`
- `s` delete one character and be in insert mode.
- `^` go to the beginning of the line and unlike `0`

- **Vertical Movement**:
	1. use `{}` to jump between paragraph
	2. You can go to `{}[]()` and use `%` to jump between the start and end.
	3. **Combo**: `V$%d` or `Vf}%d` to delete the whole paragraph.
	4. **Combo**: `di} or di] or di)` to delete the content inside the bracket.
	5. **Combo**: `di} or vi} or ci} or yi}` to compose with other movement within bracket.
	6. **Combo**: `da} or va} or ca} or ya}` to compose with other movement with bracket.
	7. **Combo**: `va}V` to highlight the whole function and bracket.
	8. **Combo**: `va}o` to switch between bracket and go `j or k` to select more and hit `o` to switch again.
	9. **Combo**: `diw or yiw or viw or ciw` to do things upon a word 
	10. **Combo**: `yiW` to copy the whole word except `space`


-   `u` to undo, `Ctrl + r` to redo
-   `yy` to copy whole line, `p` to paste, `P` to paste above
-   `dd` to cut down a line; `[i]dd` with multiple lines
-   `v` to get into visual mode, `d` to cut, `y` to copy, `V` to select whole line
-   `G` to the bottom of the file, `gg` to the top of it
-   `$` to the line tail, `0` to the head of the line

## Packer using notification
You have to quit out of vim to activate it.

-   `Ctrl + d` and `Ctrl + u` a good way to jump through file content
-   `Shift + v` select whole line, `Shift + G` to the bottom
-   use `y` to yank
-   use `; + f` to open fuzzy finder (telescope), `s + f` to open file browser => use `S + n` to insert file
-   use `g + r` to rename a variable for every
-   use `Ctrl + j` to get hint detail of error or warning
-   use `S + k` to get the hint of variable
-   use `s + v` to open a new panel?
-   use `Ctrl + w` then `q` to close split nvim panel
-   use `Esc` to close the highlight after search (with `noh`)

### Insert a new line
* `S` or `cc` to delete line and substitute text (same as cc)
* `o` insert new blank line

## Visual Mode
Can be called as selection mode. Use `v` to enter the mode.

- use `V` to select whole line.
- use `C+v` single selection mode
- use `d` to delete what you selected. Deleted content will be store and use `p` in standard mode to paste it.
- use `c` to delete and insert. Deleted content reserved.
- use `aw` to mark a word
- use `ab` to block with ()
- use `aB` to block with {}
- use `ib` to block with ()
- use `iB` to block with {}
- use `it` to block with <> (content first then tag then outer tag)
- use `v` , `iB` , `c`, `delete`, `enter` to delete whole content of {} and insert new content with nice format with delete {}.
- use `V` and `y` to copy a line and paste it under a new line
- use `C+v` and `j` to select single vertical line of code and use `g C+a` to replace with incremental content
- You can use `>` to indent your line as well.
- use `C+v` to create multiple cursors for multi-line editing.
- Code folding: `zf` to create folding, `za` to open or close the created folding.

## Settings
- Font
![demo figure](https://share.cleanshot.com/NqcPv5GW/download)


## Packer SOP
1. get the repo `name/package-name` and put it in `plugins-setup.lua`. After you save it, our script in lua will install the packer.
2. you may need to new a file for certain packer in plugins folder. Simply for further configurations.
3. require the new file in `init.lau` to make it works.
4. use `<leader><CR>` to source the file you modified.
5. folder structure is below.
![folder structure](https://share.cleanshot.com/8jX14f37/download)

## Comment
comment packer for nvim
- `gcc` to comment a line
- selection with `gc`

## Bufferline
-   use `t + e` to open a new tab, `S + t` to switch between them

## Telescope
-   use `; + f` to open fuzzy finder (telescope)
-   use `s + f` to open file browser
-   use `S + n` to insert file

## NvimTree
-   use `<leader>e` to toggle it (setting is in map.lua)
-   use `a` to create a new file
-   use `d` to delete it
-   use `r` to rename it
-   use `space` to switch between the window

## tpope/vim-surround
- `ys` + `w` + `"[{''}]"` to do the surround of a word
- `ds` + `"'[{}]'"` to delete what you surround

## christoomey/vim-tmux-navigator
- `<C-hjkl>` to move around the windows

## szw/vim-maximizer
- use `:MaximizerToggle` to make the window maximized
- do it again the restore the size
- keymap is `<leader>sm`

## hrsh7th/nvim-cmp
Auto-completion
- `cmp-path`: use ./ to give completion of current files

## Lspsaga
- `gd` to get the definition of the Function or Class
- `gf` to get the definition, implementation and reference
- `<C-i>` and `<C-o>` to jump between opened files
- Handle error message
	1.  go to the error position `]d`
	2. open code action `<leader>ca`
	3. press enter or number for actions
- `<leader>rn` to rename the variable and update all the file of variable names of whole project)
- `<leader>rf` to rename the file name
- `:wa` will save all the files
- `<leader>d` to tell the error detail

## Mason
- you can install things by pressing `i`
- `X` to uninstall it

## Treesitter
- `:TSEnable highlight` to turn on highlight for specific language

## Todo-comments
- `:Todo` to get the list or something else
- `TODO:`, `FIX:` to further comment todos
