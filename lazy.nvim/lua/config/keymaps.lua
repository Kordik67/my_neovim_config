local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts) -- Déplace la ligne vers le bas en mode visuel
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts) -- Déplace la ligne vers le haut en mode visuel

keymap.set("n", "J", "mzJ`z") -- Combine la ligne courante avec la suivante en préservant la position du curseur

keymap.set("x", "<leader>p", [["_dP]]) -- Copie la/les ligne(s) sélectionnée(s) et les colles à l'endroit du curseur en mode visuel
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Copie le texte sélectionné dans le presse-papiers système
keymap.set("n", "<leader>Y", [["+Y]]) -- Copie la ligne actuelle dans le presse-papiers système
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Supprime le texte sélectionné et le place dans le registre par défaut

keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Renomme un buffer dans tout le fichier
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

keymap.set("n", "<C-z>", "u") -- Qui n'a pas besoin de faire Ctrl+z ?
keymap.set("n", "<C-a>", "gg<S-v>G") -- Ctrl + a

keymap.set({ "n", "v" }, "<leader>a", [[:s/$/]]) -- Ajoute du texte à la fin de la ligne en mode normal et à la fins des lignes sélectionnées en mode visuel
keymap.set({ "n", "v" }, "<leader>A", [[:s/^/]]) -- Pareil mais ajoute au début
keymap.set({ "n", "v" }, "<leader>'", "<cmd>s/'/\"/g<CR>") -- Modifie les ' en "
keymap.set({ "n", "v" }, '<leader>"', "<cmd>s/\"/'/g<CR>") -- L'inverse
keymap.set({ "n", "v" }, "<leader>,", "<cmd>s/,/,\\r/g<CR>=ap") -- Met une liste séparée d'espace sur plugieurs lignes et les indentes

-- Réassignation des touches de déplacement (u,h,j,k)
keymap.set({ "n", "v" }, "u", "k", opts) -- haut
keymap.set({ "n", "v" }, "k", "l", opts) -- droite

keymap.set("n", "+", "<C-a>") -- Incrémente
keymap.set("n", "-", "<C-x>") -- Décrémente

keymap.set("n", "dw", 'vb"_d') -- Supprimer un mot en arrière

keymap.set("n", "o", "o<Esc>^Da", opts)
keymap.set("n", "O", "O<Esc>^Da", opts)

-- package-info keymaps
keymap.set(
	"n",
	"<leader>cpd",
	"<cmd>lua require('package-info').delete()<CR>",
	{ silent = true, noremap = true, desc = "Delete package" }
)
keymap.set(
	"n",
	"<leader>cpu",
	"<cmd>lua require('package-info').update()<CR>",
	{ silent = true, noremap = true, desc = "Update package" }
)
keymap.set(
	"n",
	"<leader>cpi",
	"<cmd>lua require('package-info').install()<CR>",
	{ silent = true, noremap = true, desc = "Install package" }
)
keymap.set(
	"n",
	"<leader>cpc",
	"<cmd>lua require('package-info').change_version()<CR>",
	{ silent = true, noremap = true, desc = "Change package version" }
)
