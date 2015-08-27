alias fs='find . -type f | grep "\.[sSch]$" | xargs egrep -n -w'

# why doesn't work??
#alias count='find . –name "*.[chsS]$" | xargs wc'
#alias count_nb='find . –name "*.[chsS]$" | xargs grep –v "^$" | wc'

# or grep -E
#alias countAll='find . -type f | egrep --null "\.([chsS]|java|py)$" | xargs -0 wc -l'
alias countAll='find . -type f | egrep "\.([chsSl]|java|py|sh)$" | xargs wc -l'

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
    # echo $pa
    # using `-print0` `-0` to make it can replace the file with space in file name
    find . -type f -print0 | xargs -0 replace $pa --
}

# $1 -- file
# $2 -- from
# $3 -- lines
read_line_from () {
    #echo "${3:-1}"
    #old=$IFS
    #IFS='' used by read
    tail -n+"$2" "$1" | head -n"${3:-1}"
    #IFS=$old
}

# assume function definition like 'name (...) {'
# works for c, c++, java, bash
define () {
    tabs -4
	# counter-example: 'handle_process() {' -- 'process' -w
	# Process get_process() {' -- 'Process'	
    local fun_info=$(fs "$1[^a-z]*\(.*\).*{")
    #echo "$fun_info"
	# Words of the form $'string' are treated specially. The word expands to string, with backslash-escaped characters replaced as specified by the ANSI C standard.
    IFS=$'\n:' read -d '' -ra array <<< "$fun_info"
    #local array=(${fun_info//:/ }) -- this is wrong for definition has space
    # which will split more than needed.
    local len=${#array[@]}
    #echo "$len ${array[2]}"
	#echo "..."
    #echo "${array[3]}"
	#echo "..."
    local k=1
    if [ $len -gt 3 ]
    then
        echo "$fun_info"
        read -p "Enter a number to choose one: " k
    elif [ $len -lt 3 ]
    then
		echo "Such function not found"
		return
    fi
    #echo ${array[0]} ${array[1]}
    local index=$((3 * (k - 1)))

    local line=`read_line_from ${array[$index]} ${array[$((index + 1))]}`
	echo "${array[$index]}:"
    printf "$line\n"
    declare -i count_left=1
    declare -i i=1
    while [ $count_left != 0 ]
    do
        line=`read_line_from ${array[index]} $((${array[$((index + 1))]} + i))`
        echo "$line"
        #printf "%s\n" "$line"
        if [[ $line == *"{"* ]]
        then
            ((count_left ++))
        fi
        if [[ $line == *"}"* ]]
        then
            ((count_left --))
        fi
        ((i++))
    done
}

gitday () {
	git add .
	git commit
	git push
}
	
init () {
	firefox &
	disown
	emacs &
	disown
	ss-qt5 &
	disown
}
