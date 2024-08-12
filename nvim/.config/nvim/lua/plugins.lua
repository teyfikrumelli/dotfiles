-- install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

-- true if packer is installed
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and
-- installs/updates/removes plugins when file is savad
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- import packer
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

 use({ "folke/tokyonight.nvim", tag = "v3.0.1" }) -- colorscheme

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("nvim-lua/plenary.nvim")          -- lua functions that used by many plugins
  use("nvim-tree/nvim-web-devicons")    -- icons

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  })

  -- status line
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })        -- fuzzy finder

  -- managing & installing lsp servers, linters & formatters
  use({
    "ray-x/navigator.lua",
    requires = {
      { "ray-x/guihua.lua",               run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  -- auto completion
  use("hrsh7th/nvim-cmp")     -- completion plugin
  use("hrsh7th/cmp-buffer")   -- source for text in buffer
  use("hrsh7th/cmp-path")     -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp") -- lsp auto completion

  -- snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("saadparwaiz1/cmp_luasnip")     -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- git
  use({
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
  })
  use("airblade/vim-gitgutter")

  -- database
  use({
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    }
  })

  -- dev productivity tools
  use("theprimeagen/harpoon")
  use("folke/zen-mode.nvim")
  use("mbbill/undotree")

  -- rust
  use("simrat39/rust-tools.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
