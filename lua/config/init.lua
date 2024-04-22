require("config.set")
require("config.remap")
require("config.lazy")

function Background(color)
    color = color or "oxocarbon"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
Background()
