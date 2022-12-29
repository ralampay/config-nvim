-- auto install packer if not installed
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

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- essential plugins
  use('scrooloose/nerdtree')
  use('vim-ruby/vim-ruby')
  use('mustache/vim-mustache-handlebars')
  use('tpope/vim-surround')
  use('tpope/vim-abolish')   
  use('pangloss/vim-javascript')
  use('leafgarland/typescript-vim')
  use('mxw/vim-jsx')
  use('OmniSharp/omnisharp-vim')
  use('junegunn/fzf')
  use('junegunn/fzf.vim')                                                      
  use {'neoclide/coc.nvim', branch = 'release'}

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
