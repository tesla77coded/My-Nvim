-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.laststatus = 0

--------------------------Colorscheme ---------------------------------------------------------------
-- Default options:

-- setup must be called before loading
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = { "bold" },
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    lualine = false,
    snacks = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

--neovide config --

vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true })
if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono Medium:h20"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.opt.linespace = 7
  vim.g.neovide_antialiasing = true
  vim.g.neovide_floating_blur = true
  vim.opt.cursorline = true
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_cursor_animate_command_line = true
end

-- Map Ctrl + Backspace to delete a whole word
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

require("mini.surround").setup()

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    -- Check if the current buffer is a file explorer (like NvimTree or net
    local filetype = vim.bo.filetype
    if filetype == "NvimTree" or filetype == "neo-tree" then
      -- Disable numberline for file explorer buffers
      vim.opt_local.statuscolumn = ""
      return
    end
    -- Apply numberline customization for regular buffers
    local separator = "  "
    vim.opt.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum."'
      .. separator
      .. '":""}'
      .. '%#LineNr3#%{(v:relnum == 3)?v:relnum."'
      .. separator
      .. '":""}'
      .. '%#LineNr2#%{(v:relnum == 2)?v:relnum."'
      .. separator
      .. '":""}'
      .. '%#LineNr1#%{(v:relnum == 1)?v:relnum."'
      .. separator
      .. '":""}'
      .. '%#LineNr0#%{(v:relnum == 0)?v:lnum." '
      .. separator
      .. '":""}'

    vim.cmd("highlight LineNr0 guifg=#bdbdbd gui=italic")
    vim.cmd("highlight LineNr1 guifg=#bdbdbd gui=italic")
    vim.cmd("highlight LineNr2 guifg=#9c9c9c gui=italic")
    vim.cmd("highlight LineNr3 guifg=#7b7b7b gui=italic")
    vim.cmd("highlight LineNr4 guifg=#5a5a5a gui=italic")
  end,
})

local helpers = require("incline.helpers")
local devicons = require("nvim-web-devicons")
require("incline").setup({
  window = {
    padding = 0,
    margin = { horizontal = 0 },
  },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    if filename == "" then
      filename = "[No Name]"
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)
    local modified = vim.bo[props.buf].modified
    return {
      ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
      " ",
      { filename, gui = modified and "bold,italic" or "bold" },
      " ",
      guibg = "#44406e",
    }
  end,
})
