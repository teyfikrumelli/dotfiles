local rust_tools_status, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status then
  return
end

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },

  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
})
