--- 'quiet'|'unokai'|'solarized-osaka'|'retrobox'
vim.cmd.colorscheme 'retrobox'

--- Remove background of colorschemes
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",
  callback = function()
    local remove_background = {
      'unokai',
      'quiet',
      'retrobox'
    }

    local place_background = {
      'vim'
    }

    for _, colorscheme in pairs(remove_background) do
      if vim.g["colors_name"] == colorscheme then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "LspCodeLens", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "none" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatFooter", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingOk", { bg = "none" })
      end
    end

    for _, colorscheme in pairs(place_background) do
      if vim.g["colors_name"] == colorscheme then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#444444" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#444444" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#444444" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#444444" })
        vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#444444" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#444444" })
      end
    end
  end
})
