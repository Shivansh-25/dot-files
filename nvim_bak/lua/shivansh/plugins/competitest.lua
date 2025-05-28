return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      testcases_use_single_file = true,
    })
    vim.api.nvim_set_keymap("n", "<leader>tc", ":CompetiTest add_testcase<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>cr", ":CompetiTest run<CR>", {})
  end,
}
