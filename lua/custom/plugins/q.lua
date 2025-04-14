return {
  {
    'katusk/vim-qkdb-syntax',
    event = 'BufReadPre',
    config = function()
      -- Filetype association
      vim.cmd [[
        autocmd BufRead,BufNewFile *.q set filetype=q
      ]]

      -- Keybinding setup (can go here!)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'q',
        callback = function()
          vim.keymap.set('n', '<leader>rr', function()
            local path = vim.fn.expand '%:p'
            local qcmd = '\\l ' .. path .. ''
            vim.fn.setreg('+', qcmd) -- copy to clipboard
            vim.notify('Copied to clipboard: ' .. qcmd)
          end, { buffer = true, desc = 'Copy Q load command to clipboard' })
        end,
      })
    end,
  },
}
