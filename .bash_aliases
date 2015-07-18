alias fs='find . -type f | grep "\.[sSch]$" | xargs grep -n '

# why doesn't work??
#alias count='find . –name "*.[chsS]$" | xargs wc'
#alias count_nb='find . –name "*.[chsS]$" | xargs grep –v "^$" | wc'

# or grep -E 
#alias countAll='find . -type f | egrep --null "\.([chsS]|java|py)$" | xargs -0 wc -l'
alias countAll='find . -type f | egrep "\.([chsS]|java|py)$" | xargs wc -l'

alias count='find . -type f | grep "\.[chsS]$" | xargs wc -l'
# sed "/regexp/" : Match lines matching the regular expression regexp
# d      Delete pattern space.  Start next cycle.
# alias count_nb='find . | grep "\.c\|\.h\|\.S\|\.s$" | xargs sed "/^\s*$/d" | wc -l'
alias count_nb='find . | grep "\.[chsS]$" | xargs sed "/^\s*$/d" | wc -l'

alias python=python3

alias log='python /home/zzt/login.py'

alias proxy='gsettings set org.gnome.system.proxy mode 'manual''
alias proxyN='gsettings set org.gnome.system.proxy mode 'none''

alias lock='gnome-screensaver-command -l'

alias reload='. ~/.bashrc'

alias net-re='service network-manager restart'

alias uz-c='unzip -O GB2312 '

alias pdf='libreoffice --headless --invisible --convert-to pdf *.ppt'

#alias repl='find . -type f -print0 | xargs -0 sed -i'
#alias repl='find . -type f -print0 | xargs -0 replace '

join () {
  local str=`echo "$@"`
  echo $str
}

repla () {
  local pa=`echo "$@"`
#  echo $pa
  # using `-print0` `-0` to make it can replace the file with space in file name
  find . -type f -print0 | xargs -0 replace $pa --
}  

