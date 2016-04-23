"    Gurl :: Git URL    
"    ===============    

function! Gurl()

  if exists("g:vimgurl_yank_register")
	let copyMethod = 'clipboard'
  else
	let copyMethod = "pbcopy"
  endif

  " Get Line Number/s
  let lineNum = line('.')
  let firstLine = line("'<")
  let lastLine = line("'>")

  " Set Line Number/s
  if firstLine == 0 && lastLine == 0
    let lineRange = lineNum
  else
    let lineRange = firstLine . "-" . lastLine
  endif

  " String Setup
  let blob = "/blob/"
  let sed_cmd = "sed 's\/git@\/https:\\/\\/\/g; s\/.git$\/\/g; s\/\.com:\/.com\\/\/g'"

  " Get Directory & File Names
  let fullPath = expand("%:p")
  let fileDir = expand("%:p:h")
  let cdDir = "cd " . fileDir . "; "

  " Git Commands
  let origin = system(cdDir . "git config --get remote.origin.url" . " | " . sed_cmd)
  let branch = system(cdDir . "git rev-parse --abbrev-ref HEAD")
  let gitRoot = system(cdDir . "git rev-parse --show-toplevel")

  " Strip Newlines
  let origin = StripNL(origin)
  let branch = StripNL(branch)
  let gitRoot = StripNL(gitRoot)
  let fullPath = StripNL(fullPath)

  " Git Relative Path
  let relative = split(fullPath, gitRoot)[-1]

  " Form URL With Line Range
  let url = origin . blob . branch . relative . '#L' . lineRange

  " Default Copy Method (OSX)
  if copyMethod == "pbcopy"
    let test = system("echo '" . url ."'" . " | " . copyMethod )
    echo url
  else
    execute 'let @' . g:vimgurl_yank_register . ' = "' . url . '"'
  endif

endfunction

function! StripNL(l)
  return substitute(a:l, '\n$', '', '')
endfunction

if !hasmapto(':call Gurl()<CR>')
  noremap <leader>t :call Gurl()<CR>
endif

