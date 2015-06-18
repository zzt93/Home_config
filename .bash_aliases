alias fs='find . | grep "\.c\|\.h\|\.S\|\.s" | xargs grep -n '

# why doesn't work??
#alias count='find . –name "*.[chsS]$" | xargs wc'
#alias count_nb='find . –name "*.[chsS]$" | xargs grep –v "^$" | wc'

# alias count='find . | grep "\.c\|\.h\|\.S\|\.s$" | xargs wc -l'
alias count='find . | grep "\.[chsS]$" | xargs wc -l'
# sed "/regexp/" : Match lines matching the regular expression regexp
# d      Delete pattern space.  Start next cycle.
# alias count_nb='find . | grep "\.c\|\.h\|\.S\|\.s$" | xargs sed "/^\s*$/d" | wc -l'
alias count_nb='find . | grep "\.[chsS]$" | xargs sed "/^\s*$/d" | wc -l'

alias python=python3

alias log='python login.py'

alias proxy='gsettings set org.gnome.system.proxy mode 'manual''
alias proxyN='gsettings set org.gnome.system.proxy mode 'none''

alias lock='gnome-screensaver-command -l'

alias reload='. ~/.bashrc'

alias net-re='service network-manager restart'

#alias repl='find . -type f -print0 | xargs -0 sed -i'
#alias repl='find . -type f -print0 | xargs -0 replace '

join () {
  local str=`echo "$@"`
  echo $str
}

repla () {
  local pa=`echo "$@"`
#  echo $pa
  find . -type f -print0 | xargs -0 replace $pa --
}  

