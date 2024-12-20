-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- neovide-specific , set copy/paste commands, as those are commonly done by terminal emulator
if vim.g.neovide then
	keymap('n', '<D-s>', ':w<CR>')     -- Save
	keymap('v', '<D-c>', '"+y')        -- Copy
	keymap('n', '<D-v>', '"+P')        -- Paste normal mode
	keymap('v', '<D-v>', '"+P')        -- Paste visual mode
	keymap('c', '<D-v>', '<C-R>+')     -- Paste command mode
	keymap('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- ouverture d'un terminal en bas
keymap("n", "<leader>tt", ":split term://zsh<CR>", { desc = "Ouvrir un terminal en bas" })

-- ouverture de 2 terminaux en bas
keymap("n", "<leader>tv", ":split term://zsh<CR>:vsplit term://zsh<CR>", { desc = "Ouvrir 2 terminaux en bas" })


-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-i>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap(
	"x",
	"<S-i>",
	":move '<-2<CR>gv-gv",
	{ desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" }
)
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap(
	"x",
	"<S-k>",
	":move '>+1<CR>gv-gv",
	{ desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" }
)

-- Navigation entre les buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
keymap("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre droite" })
