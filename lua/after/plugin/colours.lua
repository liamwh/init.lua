--require('rose-pine').setup({
--    disable_background = true
--})

require('ayu').setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
    options = {
	theme = 'ayu-dark'
    }
})
function ColourMyPencils(colour) 
	colour = colour or "ayu-dark"
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColourMyPencils()

require('lualine').setup({
  options = {
    theme = 'ayu_dark',
  },
})
