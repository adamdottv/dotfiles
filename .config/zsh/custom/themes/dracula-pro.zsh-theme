local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='%{$fg_bold[green]%}❯ %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✘ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
