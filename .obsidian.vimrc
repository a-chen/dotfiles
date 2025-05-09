" Source your .vimrc
source ~/.vimrc

" Yank/Paste to/from system clipboard
set clipboard=unnamed
"" Cross-platform clipboard support
"if has('mac')
"    set clipboard=unnamed
"elseif has('unix')
"    set clipboard=unnamedplus
"endif

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nmap B ^
nmap E $
vmap B ^
vmap E $

" [g]oto definition / link 
exmap followLink :obcommand editor:follow-link
nmap gd :followLink

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

" [g]oto [o]pen file (= Quick Switcher)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:search-command_recent-search
nmap go :quickSwitcher
nmap gr :quickSwitcher

" jk is escape
imap jk <Esc>

