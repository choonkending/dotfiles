-- Remove trailing whitespace on save
--  Note: Remove this if you edit files which require trailing whitespace
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
