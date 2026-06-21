-- ============================================================
-- Ejemplo: lua/core/autocmds.lua
-- Autocmds con augroups
-- ============================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("General", { clear = true })

-- 1. Restaurar última posición
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Ir a última posición al abrir",
})

-- 2. Resaltar al copiar
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
  desc = "Resaltar texto copiado",
})

-- 3. Igualar ventanas al redimensionar
autocmd("VimResized", {
  group = general,
  callback = function()
    vim.cmd("wincmd =")
  end,
  desc = "Igualar ventanas",
})

-- 4. Configuración por tipo de archivo
local ft = augroup("FileTypeSettings", { clear = true })

autocmd("FileType", {
  group = ft,
  pattern = "markdown",
  callback = function(args)
    vim.wo[args.buf].wrap = true
    vim.wo[args.buf].spell = true
  end,
  desc = "Configuración Markdown",
})

-- 5. Recargar si cambió en disco
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  callback = function()
    if vim.bo.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
  desc = "Recargar si cambió en disco",
})
