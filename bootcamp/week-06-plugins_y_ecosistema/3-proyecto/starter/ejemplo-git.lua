-- ============================================================
-- Ejemplo: lua/plugins/git.lua
-- Gitsigns y Fugitive
-- ============================================================
return {
  -- Git en gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
      },
      current_line_blame = true,
    },
    keys = {
      { "]h", desc = "Siguiente hunk" },
      { "[h", desc = "Hunk anterior" },
      {
        "<leader>gb",
        function() require("gitsigns").blame_line({ full = true }) end,
        desc = "Blame línea",
      },
      {
        "<leader>gp",
        function() require("gitsigns").preview_hunk() end,
        desc = "Preview hunk",
      },
    },
  },

  -- Git completo
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gdiffsplit", "Gblame", "Glog" },
  },
}
