# ZSH_THEME="eastwood"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#a4926e'

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="(%{$fg_bold[blue]%}✹%{$reset_color%})"

git_custom_status() {
  local branch staged unstaged untracked stashed dirty
  branch=$(git_current_branch)

  if [ -n "$branch" ]; then
    staged=$(git diff --cached --quiet 2>/dev/null || print -P "$ZSH_THEME_GIT_PROMPT_STAGED")
    unstaged=$(git diff --quiet 2>/dev/null || print -P "$ZSH_THEME_GIT_PROMPT_UNSTAGED")
    untracked=$(git ls-files --others --exclude-standard | grep -q . && print -P "$ZSH_THEME_GIT_PROMPT_UNTRACKED")
    stashed=$(git rev-parse --verify refs/stash &>/dev/null && print -P "$ZSH_THEME_GIT_PROMPT_STASHED")

    # Combine everything
    dirty="${staged}${unstaged}${untracked}${stashed}"

    print -P "${dirty}%{$fg[green]%}[${branch}]%{$reset_color%}"
  fi
}

# Properly compute relative path inside git repo
git_relative_path() {
  if git rev-parse --show-toplevel &>/dev/null; then
    local root relpath repo
    root="$(git rev-parse --show-toplevel)"
    repo="$(basename "$root")"
    relpath="${PWD#$root}"

    # remove leading slash if any
    [[ "$relpath" == /* ]] && relpath="${relpath#/}"

    if [[ -z "$relpath" ]]; then
      echo "$repo"
    else
      echo "$repo/$relpath"
    fi
  else
    # Outside git repo → normal abbreviated path
    print -P "%~"
  fi
}

# Main prompt
PROMPT='$(git_custom_status)%{$fg[cyan]%}[$(git_relative_path)]%{$reset_color%} '
