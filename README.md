**Original**: [dhananjaylatkar/cscope_maps.nvim](https://github.com/dhananjaylatkar/cscope_maps.nvim)

Changes from original:
* Change keymap prefix form `<leader>c` to `<C-\>`
* Remove prompt before executing action.

# cscope_maps.nvim
For old school code navigation :).

Only supports [neovim](https://neovim.io/). Heavily inspired by emacs' [xcscope.el](https://github.com/dkogan/xcscope.el).

# Features
* Opens results in quickfix window.
* Loads only if folder contains `cscope.out` file.
* Has [which-key.nvim](https://github.com/folke/which-key.nvim) hints baked in. 

# Installaion
Install the plugin with your preferred package manager.

## [packer](https://github.com/wbthomason/packer.nvim)
``` lua
-- Lua
use 'dhananjaylatkar/cscope_maps.nvim' -- cscope keymaps
use 'folke/which-key.nvim' -- optional

require('cscope_maps') -- load cscope maps
```

### If you are lazy-loading which-key.nvim then, load cscope_maps.nvim after which-key.nvim
```lua
use({
    "dhananjaylatkar/cscope_maps.nvim",
    after = "which-key.nvim",
    config = function()
      require("cscope_maps")
    end,
})
```

## [vim-plug](https://github.com/junegunn/vim-plug)
```vim
" Vim Script
Plug 'dhananjaylatkar/cscope_maps.nvim' " cscope keymaps
Plug 'folke/which-key.nvim' " optional

lua << EOF
  require("cscope_maps")
EOF
```

# Keymaps

| Keymaps | Description |
|--- | --- |
|`<leader>cs`| find all references to the token under cursor |
|`<leader>cg`| find global definition(s) of the token under cursor |
|`<leader>cc`| find all calls to the function name under cursor |
|`<leader>ct`| find all instances of the text under cursor |
|`<leader>ce`| egrep search for the word under cursor |
|`<leader>cf`| open the filename under cursor |
|`<leader>ci`| find files that include the filename under cursor|
|`<leader>cd`| find functions that function under cursor calls |
|`<leader>ca`| find places where this symbol is assigned a value |

# Sreenshots
### Loads `cscope` DB if it's available.

![Load cscope](./pics/1-load-cscope.png "Load cscope")

### Asks for input when invoked. (Default takes word/file under cursor)

![Input](./pics/2-input-prompt.png "Input")

### Opens results in Quickfix window and selects first match.

![Quickfix](./pics/3-qf-window.png "Quickfix window")

### [which-key](https://github.com/folke/which-key.nvim) hints are baked in.

![which-key Hints](./pics/4-wk-hints.png "which-key pane")
