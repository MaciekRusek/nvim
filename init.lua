require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.cmd [[hi @function.builtin.lua guifg=yellow]]

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

--local job_id = 0
vim.keymap.set("n", "<space>st", function()
  -- zanim utworzymy patrzymy czy mamy już jakiś taki terminal i bedziemy musieli tam zrobic

  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  --job_id = vim.bo.channel
end)

--vim.keymap.set("n", "<space>example", function()
--vim.fn.chansend(job_id, { "ls -lah\r\n" })
--end)

-- terminal esc quit
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Oil back
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- Co mozna zrobić: jakis skrót do wracania na poczatek funkcji/classy
