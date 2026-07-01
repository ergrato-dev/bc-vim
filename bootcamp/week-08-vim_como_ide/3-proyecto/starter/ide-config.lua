-- ============================================================
-- Ejemplo: configuración IDE completa (LSP + cmp + Treesitter + DAP)
-- Úsalo como punto de partida, no como copia literal: elige TU lenguaje
-- y ajusta los servers/parsers/adaptadores a lo que realmente necesites.
-- ============================================================

return {

  -- ── 1. LSP y Mason (RF-01) ──────────────────────────────────
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }, -- ajusta a tu lenguaje elegido
      })

      local lspconfig = require("lspconfig")

      local function on_attach(_, bufnr)
        local opts = { buffer = bufnr }
        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Ir a definición" }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Documentación" }))
        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Renombrar" }))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Error anterior" }))
        map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Error siguiente" }))
        map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Mostrar error" }))
      end

      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({ on_attach = on_attach })

      vim.diagnostic.config({ virtual_text = true, signs = true, severity_sort = true })
    end,
  },

  -- ── 2. Autocompletado con nvim-cmp (RF-02) ──────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- fuente LSP
          { name = "luasnip" },  -- fuente snippets
          { name = "buffer" },   -- fuente palabras del buffer
          { name = "path" },     -- fuente rutas de archivo
        }),
      })
    end,
  },

  -- ── 3. Treesitter (RF-03) ────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript" }, -- ajusta a tu lenguaje elegido
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer" },
            goto_previous_start = { ["[f"] = "@function.outer" },
          },
        },
      })
    end,
  },

  -- ── 4. Debugging con nvim-dap (RF-04) ────────────────────────
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")

      -- Ejemplo con debugpy (Python) — cambia por el adaptador de tu lenguaje
      dap.adapters.python = {
        type = "executable",
        command = "python3",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        { type = "python", request = "launch", name = "Launch file", program = "${file}" },
      }

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue / Start" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    end,
  },
}

-- ── 5. Terminal y snippets (RF-05) ─────────────────────────────
-- Estos van en tu lua/config/keymaps.lua y lua/snippets/{lenguaje}.lua,
-- no en el spec de plugins; se muestran aquí solo como referencia rápida:
--
-- vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<CR>", { desc = "Terminal abajo" })
-- vim.keymap.set("n", "<leader>tp", function()
--   vim.cmd("botright split | terminal python3 %")
-- end, { desc = "Ejecutar Python" })
--
-- -- lua/snippets/python.lua (cargado con LuaSnip)
-- local ls = require("luasnip")
-- return {
--   ls.snippet("ifmain", {
--     ls.text_node({ 'if __name__ == "__main__":', "\t" }),
--     ls.insert_node(1, "main()"),
--   }),
-- }
