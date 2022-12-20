lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

-- lvim.colorscheme = "lunar"
lvim.colorscheme = "gruvbox"  -- gruvbox/tokyonight-night/tokyonight-moon/tokyonight-storm

-- my keymappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<s-tab>"] = ":bprevious<cr>"
lvim.keys.normal_mode["<C-g>"] = ":Git <CR>"
lvim.keys.normal_mode["<leader>gp"] = ":!gitup<CR>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<cr>', {})

-- my options
vim.opt.relativenumber = true

-- Additional Plugins
lvim.plugins = {
  -- My preferred colorscheme
  "morhetz/gruvbox",
  -- Syntax aware text-objects, select, move, swap, and peek support.
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- Whenever cursor jumps some distance or moves between windows, it will flash so you can see where it is
  "DanilaMihailov/beacon.nvim",
  -- A Git wrapper so awesome, it should be illegal
  "tpope/vim-fugitive",
  {
    -- LSP signature hint as you type
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    -- Add/change/delete surrounding delimiter pairs with ease
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    -- 🦘 Interface that makes on-screen navigation quicker and more natural than ever
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({})
    end,
  },
  {
    -- TabNine completion engine for hrsh7th/nvim-cmp
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  -- Seamless tmux/vim navigation (over SSH too!)
  { "sunaku/tmux-navigate" },

  --================================================
  -- To be added in the future
  --================================================
  "hrsh7th/cmp-nvim-lua",
  "onsails/lspkind.nvim",
}

-- Setup Treesitter textobjects
-- ref: https://github.com/LunarVim/LunarVim/issues/2730
local ts = lvim.builtin.treesitter
ts.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = false,
    -- swap_next = textobj_swap_keymaps,
  },
}

vim.opt.background = "dark"
vim.g.gruvbox_contrast_dark = "medium" -- "hard/medium/soft"

-- vim.opt.background = "light"
-- vim.g.gruvbox_contrast_light = "hard" -- "hard/medium/soft"

vim.api.nvim_command([[ autocmd ColorScheme * highlight NormalFloat guibg=none ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight FloatBorder guibg=none ]])
--vim.api.nvim_command [[ autocmd ColorScheme * highlight LspSagaDiagnosticBorder guifg=#6699cc gui=bold ]]
--vim.api.nvim_command [[ autocmd ColorScheme * highlight LspSagaDiagnosticTruncateLine guifg=#6699cc ]]
vim.api.nvim_command([[ autocmd ColorScheme * highlight LspSagaDiagnosticHeader guifg=#ffffff gui=bold ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight LspSagaDiagnosticBorder guifg=#ffffff gui=bold ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight LspSagaDiagnosticTruncateLine guifg=#ffffff ]])


vim.api.nvim_command([[ autocmd ColorScheme * highlight clear SignColumn ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight GitsignsAdd ctermfg=142 guifg=#b8bb26 guibg=None gui=bold ]]) --Green
vim.api.nvim_command([[ autocmd ColorScheme * highlight GitsignsChange ctermfg=208 guifg=#fe8019 guibg=None gui=bold ]]) --Orange
vim.api.nvim_command([[ autocmd ColorScheme * highlight GitsignsDelete ctermfg=142 guifg=#fb4934 guibg=None gui=bold ]]) --Red
vim.api.nvim_command([[ autocmd ColorScheme * highlight GitsignsChangeDelete ctermfg=208 guifg=#fe8019 guibg=None gui=bold ]]) --Orange

vim.api.nvim_command([[ autocmd ColorScheme * highlight DiagnosticSignError guifg=#fb4934 guibg=None gui=bold ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight DiagnosticSignWarn guifg=#fabd2f guibg=None gui=bold ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight DiagnosticSignInfo guifg=#83a598 guibg=None gui=bold ]])
vim.api.nvim_command([[ autocmd ColorScheme * highlight DiagnosticSignHint guifg=#8ec07c guibg=None gui=bold ]])
