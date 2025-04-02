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
  pickers = {
    find_files = {
      hidden = true
    },
    grep_string = {
      additional_args = {"--hidden"}
    },
    live_grep = {
      additional_args = {"--hidden"}
    },
  },
})

telescope.load_extension("fzf")
