vim.cmd 'command! -nargs=1 Gnb !git checkout -b <args>'
vim.cmd 'command! Gpu !git push origin HEAD'
vim.cmd 'command! Gpf !git push origin HEAD --force-with-lease'
vim.cmd 'command! Gpl !git pull origin main'
vim.cmd 'command! Gst !git status'

vim.cmd 'command! -nargs=? Du !sudo docker-compose up <q-args>'
vim.cmd 'command! -nargs=? Dr !sudo docker-compose restart <q-args>'

vim.api.nvim_set_keymap('n', '<Leader>y', [[:lua CopyRelativePathToClipboard()<CR>]], { noremap = true, silent = true })

function CopyRelativePathToClipboard()
  local current_file_path = vim.fn.expand '%'
  vim.fn.system('echo -n ' .. current_file_path .. ' | pbcopy')
  print('Copied to clipboard: ' .. current_file_path)
end

vim.api.nvim_set_keymap('n', '<Leader>fa', [[:lua LspFixAllProblems()<CR>]], { noremap = true, silent = true })

function LspFixAllProblems()
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.title == 'Fix all auto-fixable problems'
    end,
    apply = true,
  }
end
