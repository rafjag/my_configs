
"""""""""""""""""""""""""""""""""
" Plugins support		"
"""""""""""""""""""""""""""""""""
call plug#begin()

	Plug 'https://github.com/majutsushi/tagbar.git'
	Plug 'https://github.com/vim-airline/vim-airline.git'
	Plug 'https://github.com/scrooloose/nerdtree.git'
	Plug 'https://github.com/tpope/vim-fugitive.git'

	Plug 'https://github.com/scrooloose/nerdcommenter.git'

	Plug 'https://github.com/vim-syntastic/syntastic.git'
	Plug 'https://github.com/Townk/vim-autoclose.git'
	Plug 'https://github.com/tomtom/tcomment_vim.git'
	Plug 'https://github.com/othree/html5.vim.git'
	
	Plug 'https://github.com/hdima/python-syntax.git'
	Plug 'https://github.com/chrisbra/csv.vim.git'
	Plug 'https://github.com/sukima/xmledit.git'

	Plug 'https://github.com/ap/vim-css-color.git'
	Plug 'https://github.com/flazz/vim-colorschemes.git'
	Plug 'https://github.com/acoustichero/goldenrod.vim.git'
	Plug 'https://github.com/vim-airline/vim-airline-themes.git'
	Plug 'https://github.com/altercation/vim-colors-solarized.git'
	Plug 'https://github.com/liuchengxu/space-vim-dark.git'
	Plug 'https://github.com/albertocg/contrastneed-theme.git'
	Plug 'https://github.com/justb3a/vim-smarties.git'
	Plug 'https://github.com/KeitaNakamura/neodark.vim.git'
	Plug 'https://github.com/jonathanfilip/vim-lucius.git'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 			GENERAL VIM SETTINGS 							 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=3 				" space numbers per tab
set shiftwidth=3
set noexpandtab
set smarttab

set tags+=~/.vim/systags 		" tags location (used by other plugins TagsInfo etc.)

syntax on 				" display syntactical elements by color based on filetype (extension)

set number 				" shows line numbers
set ruler 				" ruler - position
set wrap 				" wrap
set linebreak 			" line brake 
set nolist  			" list disables linebreak
set autoread  			" set to auto read when a file is changed from the outside

set backspace=eol,start,indent 		" backspace config
set whichwrap+=<,>,h,l

set ignorecase 			" ignore case when searching
set smartcase

set history=700 			" sets how many lines of history VIM has to remember

filetype plugin on 		" enable filetype plugin
filetype indent on

set hlsearch 				" highlight search things
set incsearch 				" make search act like search in modern browsers
set nolazyredraw 			" don't redraw while executing macros 
set magic 					" magic on, for regular expressions
set showmatch 				" show matching bracets when text indicator is over them
set mat=2 					" how many tenths of a second to blink
set autoread 				" set to auto read when a file is changed from the outside


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 					 DEPENDANT SETTINGS 						 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running') 	" GUI version
	set t_Co=256 
	set guioptions-=T  	" no toolbar
	au GUIEnter * simalt ~x
	set background=dark
	colorscheme solarized
  	let g:solarized_italic=0
	let g:solarized_visibility="high"
	let g:solarized_visibility="high"
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256

	let g:airline_theme='bubblegum'
else 							" NON-GUI version
  colorscheme evening 	" color scheme
  set background=dark
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac 	" Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY	MAPINGS 		http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

"nmap - Display normal mode maps
"imap - Display insert mode maps
"vmap - Display visual and select mode maps
"smap - Display select mode maps
"xmap - Display visual mode maps
"cmap - Display command-line mode maps
"omap - Display operator pending mode maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR> 	" NERDTree toggle  F2
map f :NERDTreeFind<CR> 											" NERDTree find on tree f
map <F8> :TagbarToggle<CR> 										" Tagbar toggle F8


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree
let NERDTreeShowHidden = 1 								" display hidden files by default
"autocmd vimenter * if !argc() | NERDTree | endif 	" NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * NERDTree

let NERDTreeWinSize =40
let NERDTreeShowBookmarks=1 




"hdima/python-syntax plugin
let python_highlight_all = 1




"
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci


au Filetype java call SetSpecificToProgramming('java')
au Filetype c call SetSpecificToProgramming('c')
au Filetype cpp call SetSpecificToProgramming('cpp')
au Filetype h call SetSpecificToProgramming('h')
au Filetype xml call SetSpecificToProgramming('xml')
au Filetype html call SetSpecificToProgramming('html')
au Filetype sh call SetSpecificToProgramming('sh')
au Filetype properties call SetSpecificToProgramming('properties')

autocmd VimEnter * wincmd w " at the end put the cursore on the editor


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! SetSpecificToProgramming(language)

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " if the only window left open is a NERDTre close
	
	let g:tagbar_width = 40
"	map <F8> :TagbarToggle<CR>	

	"JAVA specific things
	if(a:language=='java')
		"nerdtree plugin
		autocmd VimEnter * silent NERDTreeToggle
		autocmd BufEnter * silent NERDTreeMirror
		let NERDTreeWinSize=40
		let NERDTreeDirArrows=3
		"autocmd VimEnter * nested : TagbarToggle
		colorscheme maroloccio 
		
	" C/CPP/H specific 
	elseif(a:language=='cpp'||a:language=='h'||a:language=='c')
		colorscheme moria

	" shell specific 
	elseif(a:language=='sh')
		colorscheme moria

	elseif(a:language=='properties')
		colorscheme moria
	" XML specific 
	elseif(a:language=='xml')
		colorscheme moria
	" HTML specific
	elseif(a:language=='html')
		colorscheme moria
	endif
endfunc

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
