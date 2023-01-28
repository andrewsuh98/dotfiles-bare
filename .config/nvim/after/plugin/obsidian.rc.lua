local status, obsidian = pcall(require, "obsidian")
if (not status) then return end

obsidian.setup({
	dir = "~/Dropbox/Obsidian",
	completion = {
		nvim_cmp = true,
	}
})
