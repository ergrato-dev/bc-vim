-- ============================================================
-- Ejemplo: lua/plugins/editing.lua
-- Comentarios, surround, autopairs
-- ============================================================
return {
  -- Comentar código
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Rodear texto
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Cerrar pares automáticamente
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
