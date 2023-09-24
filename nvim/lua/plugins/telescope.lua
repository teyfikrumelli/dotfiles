local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			n = {
				["d"] = "delete_buffer",
			},
		},
	},
})

telescope.load_extension("fzf")
