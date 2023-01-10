lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enable = true

-- lvim.colorscheme = "lunar"
lvim.colorscheme = "gruvbox" -- gruvbox/tokyonight-night/tokyonight-moon/tokyonight-storm

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
  -- continuously updated session files
  "tpope/vim-obsession",
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
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end,
  },
  -- EditorConfig plugin for Neovim. Global configured in ~/.editorconfig
  "gpanders/editorconfig.nvim",
  -- disables search highlighting when you are done searching and re-enables it when you search again
  "romainl/vim-cool",
  --================================================
  -- To be added in the future
  --================================================
  "hrsh7th/cmp-nvim-lua",
  "onsails/lspkind.nvim",

  --================================================
  -- Experiments
  --================================================
  "github/copilot.vim",
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


-- ==============================================================================
-- Python plugins
-- ==============================================================================
vim.g.python3_host_prog = "~/.pyenv/versions/3.10.8/bin/python3.10"

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
  { command = "shellharden" },
  { command = "shfmt" },
  -- { command = "beautysh" },
  { command = "gersemi" },
  { command = "cmake-format" },
  { command = "clang-format" },
})

-- Set a linter.
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  -- {command = "shellcheck"},
  { command = "cpplint", },
  { command = "hadolint", }, -- dockerfile
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
  { command = "cmake-lint" },
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

-- ==============================================================================
-- C/C++ plugins
-- ==============================================================================
-- auto install treesitter parsers
lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }

-- Additional Plugins
table.insert(lvim.plugins, {
  "p00f/clangd_extensions.nvim",
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  "--background-index",
  "--fallback-style=Google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory", -- could also be disk
  "--folding-ranges",
  "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--limit-references=1000",
  -- "--limit-resutls=1000",
  -- "--malloc-trim",
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
  require("lvim.lsp").common_on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
  vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
  vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
  vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
  require("lvim.lsp").common_on_init(client, bufnr)
  require("clangd_extensions.config").setup {}
  require("clangd_extensions.ast").init()
  vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
  cmd = { provider, unpack(clangd_flags) },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" },
          function(input)
            path = input
          end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end
