" ----------- Bindings ------------

" Leader and pair symbol leave just single symbol
inoremap <leader>' '
inoremap <leader>" "
inoremap <leader>( (
inoremap <leader>[ [
inoremap <leader>{ {

" Leader + B Creates new scope
inoremap <leader>b {<CR>}<ESC>O

" Symbol pairs
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" On backspace remove symbol pair if present
inoremap <expr> <backspace> ( CheckBrakets() ? "<esc>xxa" : "<backspace>" )

" Moving across long lines
nnoremap j gj
nnoremap k gk

" Quick save
nnoremap <C-s> :w<return>

" Moving across buffers
map gk :bn<return>
map gj :bp<return>
map gd :bd<return>
map gf :find<space>
map <C-k> :bn<return>
map <C-j> :bp<return>
map <C-h> <C-w><C-h>
map <C-l> <C-w><C-l>

" Quick C style comment
noremap <C-_> :call Comment()<return>

" Quick insert mode exit
inoremap <leader>. <ESC> 

" Wrap selection around pairs
vnoremap ( c()<esc>P
vnoremap [ c[]<esc>P
vnoremap <leader>" c""<esc>P
vnoremap ' c''<esc>P
vnoremap { c{}<esc>P
vnoremap } c{<cr>}<esc>P

function CBindings()
    imap <leader>r return;<ESC>i 
    imap <leader>f if<leader>()<space><leader>{<CR>}<ESC>k_f(a
    imap <leader>r for<leader>()<space><leader>{<CR>}<ESC>k_f(a
    imap <leader>l float ;<ESC>i
    imap <leader>n int ;<ESC>i
    imap <leader>h char ;<ESC>i
    imap <leader>v void ;<ESC>i
    imap <leader>u <ESC>ui
    imap <leader>c /**/<ESC>hi
endfunction

" Language speficic compilation mapping.
autocmd FileType c call CBindings()
autocmd FileType cpp call CBindings()
autocmd FileType h call CBindings()
autocmd FileType c map <F5> :!make<return>
autocmd FileType rmd map <F5> :!printf<space>"require(rmarkdown);\\nrender('<c-r>%');\\n"<space>\|<space>R<space>--vanilla<enter>
autocmd FileType java map <F5> :!javac %<return>
autocmd FileType java map <F6> :!java %:r<return>
autocmd FileType java map <F7> :!javac % && java %:r<return>
autocmd FileType tex map <leader>m i\begin{<esc>o\end{<esc>Vk<<Vj:'<,'>norm<space>f{a


nmap <leader>w :w<return>

imap <leader>; <esc>A;<esc>
nmap <leader>p viwpyiw

nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

noremap <leader>y yy']p
inoremap <leader>y <ESC>yy']pi
map <C-n> :NERDTreeToggle<CR>

map <C-p> [unite]p
map g<Tab> :call CurtineIncSw()<CR>

nmap gq :YcmCompleter GoToDefinition<return>
nmap gw :YcmCompleter GoToDeclaration<return>

map gi :call AppendInclude()<return>
map ge :call GenerateDefinition()<return>

nnoremap <M-t> :call TermToggle(12)<CR>
tnoremap <M-t> <C-\><C-n>:call TermToggle(12)<CR>
