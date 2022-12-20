lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true

-- lvim.colorscheme = "lunar"
lvim.colorscheme = "gruvbox"

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

vim.g.python3_host_prog = "~/.pyenv/versions/3.10.8/bin/python3.10"

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

-- All the treesitter parsers you want to install. If you want all of them, just
-- replace everything with "all".
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "black",
    extra_args = { "--fast", "--preview" },
    filetypes = { "python" },
  },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "flake8",
    filetypes = {
      "python",
    },
    extra_args = {
      "--max-line-length",
      "88",
    },
  },
})

-- TODO: debugpy installed by default
-- Setup dap for python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function()
  require("dap-python").test_runner = "pytest"
end)

-- Magma Setup

-- Image options. Other options:
-- 1. none:     Don't show images.
-- 2. ueberzug: use Ueberzug to display images.
-- 3. kitty:    use the Kitty protocol to display images.
-- vim.g.magma_image_provider = "kitty"
vim.g.magma_image_provider = "none"

-- If this is set to true, then whenever you have an active cell its output
-- window will be automatically shown.
vim.g.magma_automatically_open_output = true

-- If this is true, then text output in the output window will be wrapped.
vim.g.magma_wrap_output = false

-- If this is true, then the output window will have rounded borders.
vim.g.magma_output_window_borders = false

-- The highlight group to be used for highlighting cells.
vim.g.magma_cell_highlight_group = "CursorLine"

-- Where to save/load with :MagmaSave and :MagmaLoad.
-- The generated file is placed in this directory, with the filename itself
-- being the buffer's name, with % replaced by %% and / replaced by %, and
-- postfixed with the extension .json.
vim.g.magma_save_path = vim.fn.stdpath("data") .. "/magma"

-- Mappings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
lvim.builtin.which_key.vmappings["d"] = {
  name = "Debug",
  s = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

lvim.builtin.which_key.mappings["j"] = {
  name = "Jupyter",
  i = { "<Cmd>MagmaInit<CR>", "Init Magma" },
  d = { "<Cmd>MagmaDeinit<CR>", "Deinit Magma" },
  e = { "<Cmd>MagmaEvaluateLine<CR>", "Evaluate Line" },
  r = { "<Cmd>MagmaReevaluateCell<CR>", "Re evaluate cell" },
  D = { "<Cmd>MagmaDelete<CR>", "Delete cell" },
  s = { "<Cmd>MagmaShowOutput<CR>", "Show Output" },
  R = { "<Cmd>MagmaRestart!<CR>", "Restart Magma" },
  S = { "<Cmd>MagmaSave<CR>", "Save" },
}

lvim.builtin.which_key.vmappings["j"] = {
  name = "Jupyter",
  e = { "<esc><cmd>MagmaEvaluateVisual<cr>", "Evaluate Highlighted Line" },
}

lvim.builtin.which_key.mappings["P"] = {
  name = "Python",
  i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
  d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
}

-- Additional Plugins
lvim.plugins = {
  --================================================
  -- Customed working plugins
  --================================================
  -- My preferred colorscheme
  "morhetz/gruvbox",
  -- You can switch between vritual environmnts.
  "AckslD/swenv.nvim",
  -- Python extension for nvim-dap
  "mfussenegger/nvim-dap-python",
  -- Syntax aware text-objects, select, move, swap, and peek support.
  "nvim-treesitter/nvim-treesitter-textobjects",
  -- Whenever cursor jumps some distance or moves between windows, it will flash so you can see where it is
  "DanilaMihailov/beacon.nvim",
  {
    -- You can generate docstrings automatically.
    "danymat/neogen",
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "numpydoc",
            },
          },
        },
      })
    end,
  },
  -- You can run blocks of code like jupyter notebook.
  { "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" },
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