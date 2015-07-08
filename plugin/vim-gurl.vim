" Gurl :: Git URL
noremap <leader>t :call Gurl()<CR>
function! Gurl()

  let copyMethod = "pbcopy" " Change copy method per system:

  let lineNum = line('.')
  let firstLine = line("'<")
  let lastLine = line("'>")

  if firstLine == 0 && lastLine == 0
    let lineRange = lineNum
  else
    let lineRange = firstLine . "-" . lastLine
  endif

  let blob = "/blob/"
  let sed_cmd = "sed 's\/git@\/https:\\/\\/\/g; s\/.git$\/\/g; s\/\.com:\/.com\\/\/g'"
  let fullPath = expand("%:p")
  let fileDir = expand("%:p:h")
  let cdDir = "cd " . fileDir . "; "
  let origin = system(cdDir . "git config --get remote.origin.url" . " | " . sed_cmd)
  let branch = system(cdDir . "git rev-parse --abbrev-ref HEAD")
  let gitRoot = system(cdDir . "git rev-parse --show-toplevel")

  let origin = StripNL(origin)
  let branch = StripNL(branch)
  let gitRoot = StripNL(gitRoot)
  let fullPath = StripNL(fullPath)

  let relative = split(fullPath, gitRoot)[-1]

  let url = origin . blob . branch . relative . '#L' . lineRange
  let test = system("echo '" . url ."'" . " | " . copyMethod)
  echo url

endfunction

function! StripNL(l)
  return substitute(a:l, '\n$', '', '')
endfunction
