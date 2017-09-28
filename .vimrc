set colorcolumn=150
set cursorline
filetype plugin on
set nocompatible              "latest vim settings/option.
set background=" dark | light "  "Set background to dark
filetype plugin indent on     "enable filetype plugin

so ~/.vim/plugins.vim

syntax enable						"activating syntax highlighting.
let mapleader = ','					"default mapkey is backslash but comma is better.
let g:EclimCompletionMethod = 'omnifunc' 		"Set vim to use eclipse omnifunction
let g:airline#extensions#tabline#enabled = 1            "Enable airline tabline.
let g:airline_powerline_fonts = 1			"Enabling powerline font
let g:ycm_server_python_interpreter = '/usr/bin/python2' "Specify python interpreter to use YCM
set laststatus=2					"Make statusline appears as vim starts
let g:livepreview_previewer = 'evince'			"vim latext live viewer

"------------------------ HTML5 setting ------------------"
let g:html5_event_handler_attributes_complete = 0	"Disable handler
let g:html5_rdfa_attributes_complete = 0		"Disable RDF's
let g:html5_microdata_attributes_complete = 0		"Disable microdata
let g:html5_aria_attributes_complete = 0		"Disable WAI ARIA



set relativenumber					"activating line numbers.
"set number
set t_CO=16						"set terminal color to 256.
"set wrap                                                "this enables "visual" wrapping
"set textwidth=0 wrapmargin=0                            "this turns off physical line wrapping 


"----------------------- Visuals -------------------------"
colorscheme solarized					"set fruity as my colorscheme.



"----------------------- Mappings ------------------------"
set hlsearch
set incsearch



"----------------------- Mappings ------------------------"

"Make it easy to edit the .vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple hightlight removal.
nmap <Leader><space> :nohlsearch<cr>


"----------------------- Auto-Commands -------------------"

"Automatically source the .vimrc file on save.
augroup autosourcing

	autocmd!
	autocmd BufWritePost .vimrc source %

augroup END

"----------------------- Split management -------------------------"

set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-------------- Disabling the arrow key in normal mode ------------
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>


"-------------- Disabling the arrow key in insert mode -------------
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>


"-------------- Mapping ii as an exit from insert mode --------------
inoremap ii <ESC>

"-------------- Enabling Relative line numbers ----------------------
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set number
"  else
"    set relativenumber
"  endif
"endfunc


"nnoremap <C-n> :call NumberToggle()<cr>


"--------------------- comma comma switch between buffers ---------------
nnoremap <Leader><Leader> <c-^>

"--------------------- vv highlight the line ----------------------
nnoremap vv V



"----------------------- NERDTree Settings --------------------------
let NERDTreeHijackNetrw = 0				"disable - to open nerdtree
let NERDTreeQuitOnOpen = 1				"automatically close nerdtree after opening a file
let NERDTreeAutoDeleteBuffer = 1			"Automatically delete the buffer in nerdtree
let NERDTreeMinimalUI = 1				"Enable mini UI in Nerdtree
let NERDTreeDirArrows = 1				"Enable dir arrow in Nerdtree
nmap <Leader>p :NERDTreeToggle<cr>



"---------------------- Toggle color scheme ------------------------------------------
call togglebg#map("<F5>")


"---------------------- Vim Calendar settings --------------------------------

" vimwiki stuff "
" Run multiple wikis "
let g:vimwiki_list = [
                        \{'path': '~/Documents/VimWiki/personal.wiki'},
                        \{'path': '~/Documents/VimWiki/tech.wiki'}
                \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()
