" vim-lsp {{{
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 100
let g:lsp_text_edit_enabled = 0

let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']
" }}}

" lightline.vim {{{
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'fugitive', 'filename', 'lsp', 'modified']
      \   ],
      \ },
      \ 'component_function': {
      \   'lsp': 'LightlineLsp',
      \   'filename': 'LightlineFilename',
      \   'fugitive': 'LightlineFugitive',
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly'
      \ }
      \ }

function! LightlineLsp()
  let l:counts = lsp#get_buffer_diagnostics_counts()
  let l:errors = l:counts.error
  let l:warnings = l:counts.warning

  return l:errors + l:warnings == 0 ? 'ok' : printf(
        \  'error:%d warn:%d',
        \ l:errors,
        \ l:warnings
        \)
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

" vim-test
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" vim:set foldmethod=marker:
