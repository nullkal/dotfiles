local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

if not uv.fs_stat(lazypath) then
  vim.notify("lazy.nvim bootstrap failed: " .. lazypath, vim.log.levels.ERROR)
  return
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = true, notify = false },
  lockfile = vim.g.dotfiles_runtimepath .. "/lazy-lock.json",
})
