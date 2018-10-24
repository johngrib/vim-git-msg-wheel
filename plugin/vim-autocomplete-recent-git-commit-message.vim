if exists("g:loaded_git_msg_wheel")
    finish
endif
let g:loaded_git_msg_wheel = 1
let g:git_msg_wheel_key = get(g:, 'git_msg_wheel_key', '<C-l>')
let g:git_msg_wheel_length = get(g:, 'git_msg_wheel_length', 50)
let g:git_msg_wheel_list_show = get(g:, 'git_msg_wheel_list_show', 1)

augroup vim_autocomplete_recent_git_commit_message
    autocmd FileType gitcommit call s:printRecentGitLog()
    execute "autocmd FileType gitcommit inoremap " . g:git_msg_wheel_key . " <C-r>=LastCommitMsg()<CR>"
augroup END

let s:executed = 0
let s:startLine = 0
let s:commitMessages = []

function! s:printRecentGitLog()
    if s:executed > 0
        return
    endif
    normal! Go
    let s:startLine = line('$')
    silent execute 'r! git log --pretty=oneline | head -' . g:git_msg_wheel_length . ' | sed "s/^/\#\# /"'
    normal! gg
    let s:commitMessages = getline(s:startLine, '$')

    let l:i = 0
    for l:msg in s:commitMessages
        let s:commitMessages[l:i] = substitute(l:msg, '^## \S*\s', '', '')
        let l:i += 1
    endfor

    if g:git_msg_wheel_list_show != 1
        normal! Gdip
    endif

    let s:executed = 1
endfunction

function! LastCommitMsg()
    call complete(col('.'), s:commitMessages)
    return ''
endfunc

