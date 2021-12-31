local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify('something broke in init.lua in the lsp directory')
	return
end

require("user.lsp.lsp-installer")
require("user/lsp/.handlers").setup()
