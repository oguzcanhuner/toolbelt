-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set basic options
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.backspace = "indent,eol,start"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignore:append { "*/tmp/*", "*.so", "*.swp", "*.zip", "*/node_modules/*" }
vim.g.mapleader = ','
vim.opt.mouse = ""
vim.opt.scrolloff = 8

require("lazy").setup({
  -- Plugin Manager
  -- lazy.nvim manages itself
  { "folke/lazy.nvim" },

  -- Fuzzy Finder
  -- { "junegunn/fzf" },
  -- { "junegunn/fzf.vim" },
  { 
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/", "log" }, -- Add patterns to ignore
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter"
  },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              git = false,
              modified = false,
              diagnostics = false,
              bookmarks = false,
              folder_arrow = false,
            },
          },
        },
      })
    end,
  },

  -- LSP and Autocompletion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  { "saadparwaiz1/cmp_luasnip" },
  { "nvimdev/guard.nvim" },
  { "nvimdev/guard-collection" },
  { "pmizio/typescript-tools.nvim" },
  { "rafamadriz/friendly-snippets" },

  -- Ruby and Rails Development
  { "tpope/vim-rails" },
  { "vim-ruby/vim-ruby" },
  { "thoughtbot/vim-rspec" },
  { "tpope/vim-endwise" },

  -- Java development
  { "nvim-java/nvim-java" },

  -- Git Integration
  { "tpope/vim-fugitive" },

  -- Utilities
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "vim-test/vim-test" },
  { "preservim/vimux" },

  -- Treesitter for Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "Yggdroot/indentLine" },
  { "andymass/vim-matchup" },
  {
    "nelstrom/vim-textobj-rubyblock",
    dependencies = { "kana/vim-textobj-user" },
  },

  -- Colorschemes
  { "rose-pine/neovim", name = "rose-pine" },
  { "rebelot/kanagawa.nvim" },
  { "projekt0n/github-nvim-theme" },
})

-- Colorscheme
-- vim.cmd("colorscheme github_dark_tritanopia")
vim.cmd("colorscheme kanagawa")

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Remap ; to [ to repeat f/F/t/T in the same direction
map('n', 'm', ';', opts)
map('n', 'M', ',', opts)
-- Remap , to ] to repeat f/F/t/T in the opposite direction
-- map('n', ']', ',', opts)
-- Remap ; to : in normal mode to enter command-line mode
map('n', ';', ':', { noremap = true, silent = false })
-- Map space to clear search highlights
map('n', '<Space>', ':noh<CR>', opts)
-- Map ,, to go to the last open file (previous buffer)
map('n', ',,', ':b#<CR>', opts)

-- LSP Mappings
map('n', '<Leader>g', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>me', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.organizeImports' } },
    apply = true,
  })
end)

-- Navigation mapping
map('n', "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", opts)
map('n', "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", opts)
map('n', "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", opts)
map('n', "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", opts)
map('n', "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", opts)

-- File Navigation
map('n', '<leader>t', ':Telescope find_files<CR>', opts)
map('n', '<leader>r', ':Telescope live_grep<CR>', opts)
-- Key mapping to search for files using fzf
-- map('n', '<leader>t', ':Files<CR>', { noremap = true, silent = true })
-- -- Key mapping to search for text using fzf
-- map('n', '<leader>r', ':Rg<CR>', { noremap = true, silent = true })

vim.env.FZF_DEFAULT_COMMAND = 'fd --type f --exclude node_modules'

-- Git Integration
map('n', '<leader>b', ':Git blame<CR>', opts)

-- Toggle Nvim Tree
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>e', ':NvimTreeFindFile<CR>', opts)

-- See code actions

-- Configure tslime to use tmux for running tests
-- vim.g['tslime_always_current_session'] = 1  -- Always use the current tmux session
-- vim.g['tslime_always_current_window'] = 1   -- Always use the current tmux window
-- Configure vim-test for Ruby
vim.g["test#ruby#runner"] = "rspec"  -- Set the default test runner (RSpec)
vim.g['test#javascript#runner'] = 'jest'
vim.g['test#typescript#runner'] = 'jest'
-- Use Vimux as the test strategy
vim.g["test#strategy"] = "vimux"
-- Optional: Automatically focus the tmux pane after running tests
vim.g.vimux_focus_on_open = 1
-- vim.g["test#strategy"] = "tslime"   -- Set strategy to `neovim` for integrated testing
-- Test Runner
map('n', '<leader>.', ':TestFile<CR>', opts)
map('n', '<leader>s', ':TestNearest<CR>', opts)
map('n', '<leader>a', ':TestSuite<CR>', opts)
map('n', '<leader>z', ':VimuxZoomRunner<CR>', opts)
map('n', '<leader>v', ':VimuxInspectRunner<CR>', opts)

-- Mapping to allow copying into system clipboard
map('v', '<C-c>', '"+y', opts)
map('n', '<C-c>', '"+yy', opts)

-- Split Navigation
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Scrolling
map('n', '<C-Down>', '<C-e>', opts)
map('n', '<C-Up>', '<C-y>', opts)

local ft = require('guard.filetype')

ft('typescript'):fmt('prettierd')
ft('typescript'):lint('eslint_d')
ft('javascript'):fmt('prettierd')
ft('javascript'):lint('eslint_d')
ft('typescriptreact'):fmt('prettierd')
ft('typescriptreact'):lint('eslint_d')

vim.g.guard_config = {
    -- format on write to buffer
    fmt_on_save = true,
    -- use lsp if no formatter was defined for this filetype
    -- lsp_as_default_formatter = false,
    -- whether or not to save the buffer after formatting
    save_on_fmt = true,
}

require('java').setup()
require('typescript-tools').setup({})

-- -- LSP Configuration for Ruby (Solargraph)
local lspconfig = require('lspconfig')

require('lspconfig').jdtls.setup({})

lspconfig.solargraph.setup {
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      format = true,
    },
  },
  on_attach = function(_, bufnr)
    local buf_map = function(mode, lhs, rhs)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
    end
    buf_map('n', '<Leader>g', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map('n', '<leader>q', '<cmd>lua vim.lsp.buf.rename()<CR>')
  end
}

-- Treesitter Configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = { "ruby", "javascript", "json", "html", "css" },
  highlight = { enable = true },
}

-- Normal mode mapping for global search and replace
map('n', '<leader>f', ':%s/', opts)
--
-- -- Visual mode mapping for search and replace
map('x', '<leader>f', ':<C-u>\'<,\'>s/', opts)

-- Auto Commands
vim.cmd [[
augroup FiletypeGroup
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
]]

-- require'luasnip'.filetype_extend("ruby", {"rails"})
-- Setup nvim-cmp for autocompletion
local cmp = require('cmp')
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- luasnip.loaders.from_snipmate.load({ paths = { "~/.config/nvim/snippets" } })

cmp.setup({
  -- completion = {
  --   autocomplete = true, -- Disable automatic suggestion popup
  --   -- completeopt = 'menu,menuone,noinsert',
  -- },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  -- Key mappings for navigating and confirming completions
  -- mapping = {

  --   -- ... Your other mappings ...
  --   ['<CR>'] = cmp.mapping(function(fallback)
  --     -- if cmp.visible() then
  --     --   if luasnip.expandable() then
  --     --     luasnip.expand()
  --     --   else
  --     --     cmp.confirm({
  --       --       select = true,
  --       --     })
  --       --   end
  --       -- else
  --       --   fallback()
  --       -- end
  --       if cmp.visible() then
  --         if luasnip.expandable() then
  --           luasnip.expand() -- Expand the snippet
  --         else
  --           -- Confirm selection if something is selected, otherwise fallback
  --           if cmp.get_selected_entry() then
  --             cmp.confirm({ select = true })
  --           else
  --             fallback()
  --           end
  --         end
  --       elseif luasnip.expandable() then
  --         luasnip.expand() -- Expand snippet if possible
  --       else
  --         fallback() -- Default fallback (e.g., insert newline)
  --       end
  --     end),

  --   ["<Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     elseif luasnip.locally_jumpable(1) then
  --       luasnip.jump(1)
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),

  --   ["<S-Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     elseif luasnip.locally_jumpable(-1) then
  --       luasnip.jump(-1)
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),

  --   -- ... Your other mappings ...
  -- },
  -- Completion sources
  sources = {
    { name = 'luasnip' },    -- Snippet completion
    { name = 'nvim_lsp' },   -- LSP source
    { name = 'path' },       -- Path completion
    { name = 'buffer' },     -- Buffer completion
  },
})
