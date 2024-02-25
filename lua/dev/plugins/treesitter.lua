-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  ignore_install = { "comment" },
  highlight = {
    enable = true,
    disable = { "phpdoc" }
  },
  -- enable indentation
  indent = { 
    enable = false,
    disable = true
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "python",
    "c_sharp",
    "php",
    "phpdoc",
  },
  git = {
    enable = true,
    ignore = false,
  },
  -- auto install above language parsers
  auto_install = true,
})
