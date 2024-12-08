-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

function CompileAndRunCpp()
  local fileName = vim.fn.expand "%:t" -- Get just the filename with extension
  local fileNameWithoutExtension = vim.fn.expand "%:t:r" -- Get filename without extension

  -- Command to compile and run
  local cmd =
    string.format("clang++ -o %s %s && ./%s", fileNameWithoutExtension, vim.fn.expand "%", fileNameWithoutExtension)

  vim.cmd "w" -- Save the file

  -- Open ToggleTerm in a horizontal split with a specific size
  require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    size = 20,
  }
  require("toggleterm").toggle(2, 20, "horizontal")

  -- Send the command to the terminal
  vim.api.nvim_chan_send(vim.b.terminal_job_id, cmd .. "\n")
end

-- Key mapping to invoke the function
vim.api.nvim_set_keymap("n", "<leader>r", ":lua CompileAndRunCpp()<CR>", { noremap = true, silent = true })
