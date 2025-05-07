vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = "application/json"
vim.g.vrc_output_buffer_name = "application/json"
vim.g.vrc_auto_format_response_patterns = {
  json = "jq",
}

return {
  {
    "diepm/vim-rest-console",
    keys = {
      {
        "<leader>xr",
        ":call VrcQuery()<CR>",
        desc = "Open Request Console",
      },
    },
  },
}
