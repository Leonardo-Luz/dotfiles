local M = {}

M.setup = function()
	local group = vim.api.nvim_create_augroup('LatexCustomHighlight', { clear = true })

	vim.api.nvim_create_autocmd('FileType', {
		group = group,
		pattern = 'tex',
		callback = function()
			vim.print("ewfewfwffffwfewfwf")
			vim.cmd([[
			syntax region FixmeCmd start="\\fixme{" end="}" containedin=ALL
			highlight FixmeCmd guibg=Red guifg=White
		      ]])
		end,
	})
end

return M
