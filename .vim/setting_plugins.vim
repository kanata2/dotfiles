" {{{ 1 deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <expr><BS>
      \ deoplete#smart_close_popup()."\<C-h>"

" {{{ 2 go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }}} 2
" {{{ 2 rust
let g:deoplete#sources#rust#racer_binary = $HOME.'.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH
" }}} 2
" }}} 1

" lightline.vim {{{
let g:airline#extensions#ale#enabled = 1
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'fugitive', 'filename', 'ale', 'modified']
      \   ],
      \ },
      \ 'component_function': {
      \   'ale': 'LightlineALE',
      \   'filename': 'LightlineFilename',
      \   'fugitive': 'LightlineFugitive',
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly'
      \ }
      \ }

function! LightlineALE()
  if exists('g:loaded_ale')
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'ok' : printf(
          \  '%d×  %d△ ',
          \ all_non_errors,
          \ all_errors
          \)
  else
    return ''
  endif
endfunction

function! LightlineFilename()
  let filename = expand('%:t')
  if strlen(filename) > 20
    return filename[0:10].'...'.filename[-11:-1]
  endif
  return ('' != filename ? filename : '[No Name]')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightlineModified()
  if &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! LightlineReadonly()
  if &readonly
    return '⭤'
  else
    return ''
  endif
endfunction

" }}}

" emmet.vim {{{
" en -> ja
let g:user_emmet_settings = {
      \  'lang' : 'ja'
      \ }
" }}}

" ale {{{
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" }}}

" vim-go {{{
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

let g:go_gocode_unimported_packages = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" }}}

" vim-latex {{{
" FIXME: https://github.com/vim-latex/vim-latex/blob/master/plugin/imaps.vim#L540
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
" }}}

" vim-markdown
let g:vim_markdown_math = 1

" vim-quickrun {{{
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
let g:quickrun_config.haskell = {
      \ 'type': 'haskell/stack',
      \ 'command': 'stack',
      \ 'exec': '%c %o %s %a',
      \ 'cmdopt': 'runghc',
      \ }
nnoremap <silent> <C-q> :QuickRun<CR>
" }}}

" rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" vim-racer {{{
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>d <Plug>(rust-doc)

let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
" }}}

" ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|dist)|(\.(git|hg|svn))$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|dist)|(\.(git|hg|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" vaffle.vim
let g:vaffle_show_hidden_files = 1

" vim:set foldmethod=marker:
