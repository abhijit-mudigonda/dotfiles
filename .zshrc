# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abhijitm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#PATH things

SRILM=/home/abhijitm/swarayi/srilm
MACHINE_TYPE=i686-m64
export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
export PATH=$SRILM/bin/:$PATH
export PATH=$SRILM/bin/$MACHINE_TYPE:$PATH
export MANPATH=$SRILM/man:$MANPATH
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

#gurobi install things

export GUROBI_HOME="/opt/gurobi900/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

#Other system variable things
export EDITOR="/usr/bin/vim"
#Start things
tmux
clear
#Antigen things

source ~/grease/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen apply

#Extract many types of files

extract() 
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2) 	tar -jxvf $1		;;
			*.tar.gz)	tar -zxvf $1		;;
			*.bz2)		bunzhip2 $1		;;
			*.dmg)		hdiutil mount $1	;;
			*.gz)		gunzip $1		;;
			*.tar)		tar -xvf $1		;;
			*.tbz2)		tar -jxvf $1		;;
			*.tgz)		tar -zxvf $1		;;
			*.zip)		unzip $1		;;
			*.Z) 		uncompress $1		;;
			*.tar.xz)	tar -xvfJ $1		;;
			*)		echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

rpminstall()
{
    #Install rpm files
	rpm -ivh $1
}
localtex()
{
    #This will only work if you run it
    #   1) on Fedora, or something else using Gnome
    #   2) run it from the root folder of the repo
    #   3) Have pdflatex to compile .tex files from the command line
    #To fix these, respectively
    #   1) replace "gnome-open" with whatever opens files in your 
    #       system
    #   2) move to the root folder of the repo :P
    #   3) Get a commandline latex compiler, and replace "pdflatex" with 
    #       whatever that is
    #
    #Pardon the awful code lol. But it works!

    cat stuff/skeleton.tex | sed "s/--REPLACEME--/$1/g" > tmp.tex
    pdflatex tmp.tex
    gnome-open tmp.pdf
    rm tmp.tex tmp.aux tmp.log tmp.out
}

cdmit()
{
    #Jump to folder for a certain class
	classname=$(echo $1 | sed 's/\.//g')
    cd $(find ~/mit/ -type d -name $classname -print)
}

openbook()
{
    #Open a textbook given a bunch of partial string queries

    BOOKLIST=$(ls /home/abhijitm/textbooks)
    for query in "$@"
    do
        BOOKLIST=$(echo $BOOKLIST | grep "$query")
    done
    
    if [ -z "$BOOKLIST" ]
    then
        echo "No books matched your query"
    else
        okular /home/abhijitm/textbooks/$(echo $BOOKLIST | head -1) &
    fi
}

gcal()
{
    #aliases for gcalcli (google calendar cli)
    if [ -n $1 ]; then
        case $1 in 
            add) gcalcli --title $2 --when $3 --duration $4 --reminder 30 add ;;
            rm) gcalcli delete $2 ;;
            ls) gcalcli calw ;;
            *) echo "Not a valid gcal argument" ;;
        esac
    else
        echo "gcal() needs at least one argument"
    fi
}

clean_history()
{
    cd ~
    mv .histfile .histfile_bad
    strings .histfile_bad > .histfile
    fc -R .histfile
}


latex_dotfiles()
{
    ln -s ~/grease/dotfiles/latex-things/preamble.tex preamble.tex
    ln -s ~/grease/dotfiles/latex-things/macros.tex macros.tex
    echo "Don't make any changes to this file that you don't want in your permanent preamble/macros"
    touch $1.tex  
    echo "input{preamble} \n input{macros} \n" >> $1.tex
}


tex2markdown()
{
    cat $1 | ~/blogging/tex2markdown/hack.sh | python3 ~/blogging/tex2markdown/tex2markdown.py 
}

alias vi=vim
alias sshmit="ssh abhijitm@athena.dialup.mit.edu"
alias t="task"
alias venv_create="python3 -m venv env"
alias venv_activate="source env/bin/activate"
alias ob="openbook"
export GOPATH=$HOME/work

#Get vim bindings
bindkey 'jj' vi-cmd-mode
PS1+='${VIMODE}'
#   '$' for normal insert mode
#   a big red 'I' for command mode - to me this is 'NOT insert' because red
function zle-line-init zle-keymap-select {
    DOLLAR='%B%F{red}$%f%b '
    GIANT_I='%B%F{green}I%f%b '
    VIMODE="${${KEYMAP/vicmd/$DOLLAR}/(main|viins)/$GIANT_I}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


