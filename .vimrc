""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader> is \ by default, so those commands can be invoked by doing \v and \s
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------------------------------------------"

"NON-DEPENDENT SETTINGS
set tabstop=3 				" space numbers per tab
set shiftwidth=3
set noexpandtab
set smarttab

set tags+=~/.vim/systags 	" tags location (used by other plugins TagsInfo etc.)

syntax on 					" display syntactical elements by color based on filetype (extension)
set number 					" shows line numbers
set ruler 					" ruler - position
set wrap 					" wrap
set linebreak 				" line brake 
set nolist  				" list disables linebreak
set autoread  				" set to auto read when a file is changed from the outside

set backspace=eol,start,indent 	" backspace config
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
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running') 	" GUI version
	set t_Co=256 
	set guioptions-=T  	" no toolbar
	colorscheme elflord 	" color scheme
	set background=dark
else 							" NON-GUI version
  colorscheme evening 	" color scheme
  set background=dark
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

au Filetype java call SetSpecificToProgramming('java')
au Filetype c call SetSpecificToProgramming('c')
au Filetype cpp call SetSpecificToProgramming('cpp')
au Filetype h call SetSpecificToProgramming('h')
au Filetype xml call SetSpecificToProgramming('xml')
au Filetype html call SetSpecificToProgramming('html')
au Filetype sh call SetSpecificToProgramming('sh')
au Filetype properties call SetSpecificToProgramming('properties')


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" 		tags location (used by other plugins TagsInfo etc.)
try
    if MySys() == "windows"
      set tags+=C:\Windows\Temp\systags
    else
		set tags+=~/.vim/systags 	
	endif
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""


" 		MAPINGS 		http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"nmap - Display normal mode maps
"imap - Display insert mode maps
"vmap - Display visual and select mode maps
"smap - Display select mode maps
"xmap - Display visual mode maps
"cmap - Display command-line mode maps
"omap - Display operator pending mode maps

map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDTree
let NERDTreeShowHidden=1 " display hidden files by default
autocmd vimenter * if !argc() | NERDTree | endif " NERDTree automatically when vim starts up if no files were specified
let NERDTreeWinSize =20

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! SetSpecificToProgramming(language)

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " if the only window left open is a NERDTre close

	"JAVA specific things
	if(a:language=='java')
		"nerdtree plugin
		autocmd VimEnter * NERDTreeToggle
		autocmd BufEnter * NERDTreeMirror
		let NERDTreeWinSize=30
		let NERDTreeDirArrows=1

		"tagbar plugin
		autocmd VimEnter * nested : TagbarToggle
		autocmd VimResized * (g:tagbar_width = &columns /20)
		let g:tagbar_width = 20
		map <F8> :TagbarToggle<CR>	

		colorscheme morning
		autocmd GUIEnter * winpos 0 0
		set lines=42 columns=125
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
