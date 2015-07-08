
                                                     
                                                     
            ______   __    __   __ __     __         
           /_/\___\ /\_\  /_/\ /_/\__/\  /\_\        
           ) ) ___/( ( (  ) ) )) ) ) ) )( ( (        
          /_/ /  ___\ \ \/ / //_/ /_/_/  \ \_\       
          \ \ \_/\__\\ \  / / \ \ \ \ \  / / /__     
           )_)  \/ _/( (__) )  )_) ) \ \( (_____(    
           \_\____/   \/__\/   \_\/ \_\/ \/_____/    
                                                     
                                       vim-gurl v1.0 
                                                     

## Description:
vim-gurl allows you to link to git remotes such as github, gitlab, etc.

## Basic Usage:
  - Default mapping is set to: \<leader\> t

## Customization:
  - To customize mapping, place a mapping in your .vimrc after the plugin has been called, such as:

	```
	noremap <leader>gr :call Gurl()<CR>
	```

## Requirements:
  - git & pbcopy

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
