local opt = vim.opt

opt.mouse = 'a'              --Включит мышь
opt.encoding = 'utf-8'       --Кодировка
opt.showcmd = true           --Отображение команд
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false         --Не создаем свап файлы

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.number = true            --Номер строк сбоку
opt.wrap = true              --Длинные линии будет видно
opt.expandtab = true         --???
opt.tabstop = 4              --1 tab = 4 пробела
opt.smartindent = true
opt.shiftwidth = 4           --Смещаем на 4 пробела

-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]


opt.cursorline = true        -- Подсветка строки с курсором
opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных буквj

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)


-- Сворачивание кода
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
