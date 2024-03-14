local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function create_mapping(mode, lhs, rhs, desc)
	local mapping_opts = vim.tbl_extend("force", opts, { desc = desc })
	keymap.set(mode, lhs, rhs, mapping_opts)
end

keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts) -- Déplace la ligne vers le bas en mode visuel
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts) -- Déplace la ligne vers le haut en mode visuel

--keymap.set("n", "J", "mzJ`z") -- Combine la ligne courante avec la suivante en préservant la position du curseur

keymap.set("x", "<leader>p", [["_dP]]) -- Copie la/les ligne(s) sélectionnée(s) et les colles à l'endroit du curseur en mode visuel
create_mapping({ "n", "v" }, "<leader>y", [["+y]], "Copy selected lines in system clipboard")
keymap.set("n", "<leader>Y", [["+Y]]) -- Copie la ligne actuelle dans le presse-papiers système
-- keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Supprime le texte sélectionné et le place dans le registre par défaut

create_mapping("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename buffer under cursor") -- Renomme un buffer dans tout le fichier
create_mapping("n", "<leader>x", "<cmd>!chmod +x %<CR>", "Give rights to current file")

keymap.set("n", "<C-z>", "u") -- Qui n'a pas besoin de faire Ctrl+z ?
keymap.set("n", "<S-z>", "<C-r>") -- Ctrl + shift + z
keymap.set("n", "<C-a>", "gg<S-v>G") -- Ctrl + a
keymap.set("n", "<C-s>", "<cmd>wa<CR>") -- Ctrl + s

create_mapping("n", "<leader>o", "<cmd>sil !open <cWORD><CR>", "Open link under cursor")

create_mapping({ "n", "v" }, "<leader>a", [[:s/$/]], "Add text to the end of the (selected) line(s)")
create_mapping({ "n", "v" }, "<leader>A", [[:s/^/]], "Add text to the start of the (selected) line(s)")
create_mapping({ "n", "v" }, "<leader>'", "<cmd>s/'/\"/g<CR>", "Change all ' into \"")
create_mapping({ "n", "v" }, '<leader>"', "<cmd>s/\"/'/g<CR>", "Change all \" into '")
create_mapping(
	{ "n", "v" },
	"<leader>,",
	"<cmd>s/,/,\\r/g<CR>=ap",
	"Put a space-separated list on multiple lines and indent them"
)

-- Réassignation des touches de déplacement (u,h,j,k)
keymap.set({ "n", "v" }, "u", "k", opts) -- haut
keymap.set({ "n", "v" }, "k", "l", opts) -- droite

keymap.set("n", "+", "<C-a>") -- Incrémente
keymap.set("n", "-", "<C-x>") -- Décrémente

keymap.set("n", "dw", 'vb"_d') -- Supprimer un mot en arrière

keymap.set("n", "o", "o<Esc>^Da", opts)
keymap.set("n", "O", "O<Esc>^Da", opts)

-- package-info keymaps
create_mapping("n", "<leader>cpd", "<cmd>lua require('package-info').delete()<CR>", "Delete package")
create_mapping("n", "<leader>cpu", "<cmd>lua require('package-info').update()<CR>", "Update package")
create_mapping("n", "<leader>cpi", "<cmd>lua require('package-info').install()<CR>", "Install package")
create_mapping("n", "<leader>cpc", "<cmd>lua require('package-info').change_version()<CR>", "Change package version")

-- Window / buffer
keymap.set("n", "<tab>", function()
	vim.cmd([[ wincmd w ]])
end, opts) -- Next window

--[[]
local curr_buffer = 1 -- 1 = buffer 1, 2 = buffer 2

keymap.set("n", "<C-Tab>", function()
	if curr_buffer == 1 then
		vim.cmd("bnext")
		curr_buffer = 2
	else
		vim.cmd("bprevious")
		curr_buffer = 1
	end
end, opts)
]]

--[[keymap.nnoremap({
	"<C-Tab>",
	function()
		if curr_buffer == 1 then
			vim.cmd("bnext")
			curr_buffer = 2
		else
			vim.cmd("bprevious")
			curr_buffer = 1
		end
	end,
	opts,
})]]
