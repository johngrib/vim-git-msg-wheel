if exists("g:loaded_autocomplete_recent_git_commit_message")
    finish
endif
let g:loaded_autocomplete_recent_git_commit_message = 1
let g:autocomplete_recent_git_commit_message_key = '<C-l>'
let g:autocomplete_recent_git_commit_message_length = 50
let g:autocomplete_recent_git_commit_message_show = 1

augroup vim_autocomplete_recent_git_commit_message
    autocmd FileType gitcommit call s:printRecentGitLog()
    execute "autocmd FileType gitcommit inoremap " . g:autocomplete_recent_git_commit_message_key . " <C-r>=LastCommitMsg()<CR>"
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
    silent execute 'r! git log --pretty=oneline | head -' . g:autocomplete_recent_git_commit_message_length . ' | sed "s/^/\#\# /"'
    normal! gg
    let s:commitMessages = getline(s:startLine, '$')

    let l:i = 0
    for l:msg in s:commitMessages
        let s:commitMessages[l:i] = substitute(l:msg, '^## \S*\s', '', '')
        let l:i += 1
    endfor

    let s:executed = 1
endfunction

function! LastCommitMsg()
    call complete(col('.'), s:commitMessages)
    return ''
endfunc

