lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

-- lvim.colorscheme = "lunar"
lvim.colorscheme = "gruvbox"  -- gruvbox/tokyonight-night/tokyonight-moon/tokyonight-storm

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<s-tab>"] = ":bprevious<cr>"
vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<cr>', {})


lvim.keys.normal_mode["<C-g>"] = ":Git <CR>"
-- lvim.keys.normal_mode["<leader>gh"] = ":Git hist<CR>"
-- lvim.keys.normal_mode["<leader>go"] = ":Git checkout<space>"
-- lvim.keys.normal_mode["<leader>gc"] = ":Git commit<CR>"
-- lvim.keys.normal_mode["<leader>gca"] = ":Git commit --amend<CR>"
-- lvim.keys.normal_mode["<leader>gl"] = ":Git log<CR>"
-- lvim.keys.normal_mode["<leader>gr"] = ":Gread<CR>"
-- lvim.keys.normal_mode["<leader>gw"] = ":Gwrite<CR><CR>"
-- lvim.keys.normal_mode["<leader>gv"] = ":Gvdiffsplit<CR>"
-- lvim.keys.normal_mode["<leader>gvv"] = ":Gvdiffsplit!<CR>"
-- lvim.keys.normal_mode["<leader>gb"] = ":Git branch<Space>"
-- lvim.keys.normal_mode["<leader>gm"] = ":Git merge<Space>"
-- lvim.keys.normal_mode["<leader>gma"] = ":Git merge --abort<CR>"
-- lvim.keys.normal_mode["<leader>grb"] = ":Git rebase<Space>"
-- lvim.keys.normal_mode["<leader>grbc"] = ":Git rebase --continue<CR>"
-- lvim.keys.normal_mode["<leader>grba"] = ":Git rebase --abort<CR>"

lvim.keys.normal_mode["<leader>gp"] = ":!gitup<CR>"

lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"


local options = {
  -- backup = false, -- creates a backup file
  -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  -- cmdheight = 1, -- neovim command line for displaying messages
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0, -- so that `` is visible in markdown files
  -- fileencoding = "utf-8", -- the encoding written to a file
  -- hlsearch = true, -- highlight all matches on previous search pattern
  -- ignorecase = true, -- ignore case in search patterns
  -- mouse = "a", -- allow the mouse to be used in neovim
  -- pumheight = 10, -- pop up menu height
  -- showmode = false, -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2, -- always show tabs
  -- smartcase = true, -- smart case
  -- smartindent = true, -- make indenting smarter again
  -- splitbelow = true, -- force all horizontal splits to go below current window
  -- splitright = true, -- force all vertical splits to go to the right of current window
  -- swapfile = false, -- creates a swapfile
  -- termguicolors = true, -- set term gui colors (most terminals support this) (This affect the color very much!)
  -- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  -- undofile = true, -- enable persistent undo
  -- updatetime = 300, -- faster completion (4000ms default)
  -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- expandtab = true, -- convert tabs to spaces
  -- shiftwidth = 2, -- the number of spaces inserted for each indentation
  -- tabstop = 2, -- insert 2 spaces for a tab
  -- cursorline = true, -- highlight the current line
  -- number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  -- numberwidth = 4, -- set number column width to 2 {default 4}
  -- signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  -- wrap = false, -- display lines as one long line
  -- scrolloff = 0, -- is one of my fav
  -- sidescrolloff = 8,
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- Additional Plugins
lvim.plugins = {
  --================================================
  -- Customed working plugins
  --================================================
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
  --   After trying severla plugins, this is the only one can work under ssh condition
  --   plugins tried:
  --     - "alexghergh/nvim-tmux-navigation",
  --     - "aserowy/tmux.nvim",
  --     - "numToStr/Navigator.nvim",
  --     - "christoomey/vim-tmux-navigator"
  { "sunaku/tmux-navigate" },

  --================================================
  -- To be added in the future
  --================================================
  "hrsh7th/cmp-nvim-lua",
  "onsails/lspkind.nvim",
  -- "github/copilot.vim",
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- },

  --================================================
  -- Plugins not working. To be observed.
  --================================================
  --{
  --  "jayp0521/mason-null-ls.nvim",
  --  config = function()
  --    require("mason-null-ls").setup({
  --      ensure_installed = nil,
  --      automatic_installation = true,
  --      automatic_setup = false,
  --    })
  --  end
  --},

  --================================================
  -- Not used
  --================================================
  --"preservim/nerdcommenter", --> replaced with Comment.nvim
  --"octaltree/cmp-look",
  --"hrsh8th/cmp-calc",
  --"f3fora/cmp-spell",
  --"hrsh7th/cmp-emoji",
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


