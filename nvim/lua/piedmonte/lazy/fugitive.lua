return {
	"tpope/vim-fugitive",

	config = function()
		vim.keymap.set("n", "<leader>g", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gs", function() vim.cmd.Git("status") end, { desc = "Git status" })
        vim.keymap.set("n", "<leader>gc", function() vim.cmd.Git("commit") end, { desc = "Git commit" })
        vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git("push") end, { desc = "Git push" })
        vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git("pull") end, { desc = "Git pull" })
        vim.keymap.set("n", "<leader>ga", function() vim.cmd.Git("add %") end, { desc = "Git add current file" })
        vim.keymap.set("n", "<leader>gA", function() vim.cmd.Git("add .") end, { desc = "Git add all" })
	end
}
