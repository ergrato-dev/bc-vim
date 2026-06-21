-- ============================================================
-- Ejemplo: lua/plugins/tools.lua
-- Telescope, which-key
-- ============================================================
return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Ayuda" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
      },
    },
  },

  -- Descubrir keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>f", group = "Find / Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>b", group = "Buffers" },
        { "<leader>e", group = "Explorador" },
      },
    },
  },
}
