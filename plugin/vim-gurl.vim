" Gurl :: Git URL
noremap <leader>t :call Gurl()<CR>
function! Gurl()

  let lineNum = line('.')
  let firstLine = line("'<")
  let lastLine = line("'>")

  if firstLine == 0 && lastLine == 0
    let lineRange = lineNum
  else
    let lineRange = firstLine . "-" . lastLine
  endif

  let sed_cmd = "sed 's\/git@\/https:\\/\\/\/g; s\/.git$\/\\/blob\/g; s\/\.com:\/.com\\/\/g'"
  let origin = system("git config --get remote.origin.url | " . sed_cmd)
  let branch = system("git rev-parse --abbrev-ref HEAD")
  let gitRoot = system("git rev-parse --show-toplevel")
  let fullPath = expand("%:p")

  let origin = substitute(origin, '\n$', '', '')
  let branch = substitute(branch, '\n$', '', '')
  let gitRoot = substitute(gitRoot, '\n$', '', '')
  let fullPath = substitute(fullPath, '\n$', '', '')

  let relative = split(fullPath, gitRoot)[-1]

  " add blob
  let url = origin . '/' . branch . relative . '#L' . lineRange
  let test = system("echo '" . url . "' | pbcopy")
  echo url

endfunction
