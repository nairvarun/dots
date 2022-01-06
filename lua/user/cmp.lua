-- require("cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify('cmp_status_ok: false [.../nvim/lua/user/cmp.lua]')
	return
end

-- require("luasnip")
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify('snip_status_ok: false [.../nvim/lua/user/cmp.lua]')
	return
end

require("luasnip/loaders/from_vscode").lazy_load()		-- idk what this does but it should make sure lausnip work

local kind_info = {
	Text 			= "{Text}",
	Method 			= "{Method}",
	Function 		= "{Function}",
	Constructor 	= "{Constructor}",
	Field 			= "{Field}",
	Variable 		= "{Variable}",
	Class 			= "{Class}",
	Interface 		= "{Interface}",
	Module 			= "{Module}",
	Property 		= "{Property}",
	Unit 			= "{Unit}",
	Value 			= "{Value}",
	Enum 			= "{Enum}",
	Keyword 		= "{Keyword}",
	Snippet 		= "{Snippet}",
	Color 			= "{Color}",
	File 			= "{File}",
	Reference 		= "{Reference}",
	Folder 			= "{Folder}",
	EnumMember		= "{EnumMember}",
	Constant		= "{Constant}",
	Struct			= "{Struct}",
	Event			= "{Event}",
	Operator		= "{Operator}",
	TypeParameter 	= "{TypeParameter}",
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
		["<C-f>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- workaround for as ctrl + enter
		["<C-x>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- for super tab:
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
  },
  formatting = {
	  fields = {"abbr", "kind", "menu"},
	  format = function(entry, vim_item)
		  vim_item.kind = string.format("%s", kind_info[vim_item.kind])
		  vim_item.menu = ({
			  luasnip = "[Snippet]",
			  nvim_lsp = "[LSP]",
			  buffer = "[Buffer]",
			  path = "[Path]",
		  })[entry.source.name]
		  return vim_item
	  end,
  },
  sources = {
	  {name = "nvim_lsp"},
	  {name = "luasnip"},
	  {name = "buffer"},
	  {name = "path"},
  },
  documentation = {
	  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
  },
  experimental = {
	  ghost_text = true,
	  native_menu = false,
  },
}

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
