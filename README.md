
                                                     
            ______   __    __   __ __     __         
           /_/\___\ /\_\  /_/\ /_/\__/\  /\_\        
           ) ) ___/( ( (  ) ) )) ) ) ) )( ( (        
          /_/ /  ___\ \ \/ / //_/ /_/_/  \ \_\       
          \ \ \_/\__\\ \  / / \ \ \ \ \  / / /__     
           )_)  \/ _/( (__) )  )_) ) \ \( (_____(    
           \_\____/   \/__\/   \_\/ \_\/ \/_____/    
                                                     
                                       vim-gurl v1.0 
                                                     

## Description:
vim-gurl provides links to remote git repos based on single lines or selections.

## Example:
![vim-gurl](https://cloud.githubusercontent.com/assets/2328639/8764290/c564331a-2d83-11e5-9026-99aae1dee585.gif)

## Basic Usage:
  - Default mapping is set to: \<leader\> t

## Customization:
  - To customize mapping, place a mapping in your .vimrc after the plugin has been called, such as:

  ```
  noremap <leader>gr :call Gurl()<CR>
  ```

  - To use the vim clipboard instead of pbcopy, you can specify a clipboard register:

  ```
  let g:vimgurl_yank_register = '"'
  ```

## Requirements:
  - git
  - pbcopy (optional)

## Install:
  - Install with your favourite installation method:

  #### Pathogen:

  ```
  cd ~/.vim/bundle
  git clone git://github.com/vitapluvia/vim-gurl.git
  ```

  #### VimPlug:

  ```
  Plug 'vitapluvia/vim-gurl'
  ```

  #### Vundle:
  ```
  Plugin 'vitapluvia/vim-gurl'
  ```
  
  #### NeoBundle:
  
  ```
  NeoBundle 'vitapluvia/vim-gurl'
  ```
