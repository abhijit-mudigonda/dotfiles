
#PATH things

export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH


#Start things

tmux

#Antigen things

source ~/.antigen/antigen.zsh

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

latex()
{
    #Compile a latex file and build and open the pdf
	pdflatex $1
	rm *.log
	rm *.aux
	rm *.vim
    echo $1
    gnome-open ${1%.tex}.pdf
}

vimtex()
{
    cp ~/.default.tex .
    mv .default.tex $1
}

cdmit()
{
    #Jump to folder for a certain class
	classname=$(echo $1 | sed 's/\.//g')
	cd ~/Documents/fall2017/$classname
}

openbook()
{
    #Open a textbook given a partial string
    gnome-open ~/Documents/textbooks/$(ls ~/Documents/textbooks/ | grep $1)
}
pharos()
{
    #Print to athena!
	source ~/Documents/mitprint/print.sh $1
}
#Aliases

alias vi="vim"
alias cdcheeg="cd ~/Documents/cheegnet/cheegnet"
alias sshmit="ssh abhijitm@athena.dialup.mit.edu"
alias sshmind="ssh abhijitm@openmind7.mit.edu"
alias gp="git remote | xargs -L1 git push --all"
alias t="task"
export GOPATH=$HOME/work
