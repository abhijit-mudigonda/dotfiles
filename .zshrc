
#PATH things

export PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
export PATH=~/miniconda3/bin:$PATH


#Start things

tmux
cat .notetoself.txt


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
    pdflatex $1
	rm *.log
	rm *.aux
	rm *.vim
    rm *.out
    echo $1
    gnome-open ${1%.tex}.pdf
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

gnopen()
{
    gnome-open $1
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
    cd $(find /home/abhijit/Documents/mit/ -type d -name $classname -print)
}

openbook()
{
    #Open a textbook given a partial string
    gnome-open ~/Documents/textbooks/$(ls ~/Documents/textbooks/ | grep $1)
}

openpaper()
{
    #Open a paper given a partial string
    gnome-open ~/Documents/papers/$(ls ~/Documents/papers/ | grep $1)
}
pharos()
{
    #Print to athena!
	source ~/Documents/mitprint/print.sh $1 $2 $3 $4 $5
}

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
			*.tar.xz)	tar -xvf $1		;;
			*)		echo "'$1' cannot be extracted/mounted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
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

block()
{
    source ~/Documents/blocker/block.sh $1
}

unblock()
{
    source ~/Documents/blocker/unblock.sh $1
}

block_list()
{
    source ~/Documents/blocker/block_list.sh 
}

unblock_list()
{
   source ~/Documents/blocker/unblock_list.sh
}

#Aliases
alias vi="vim"
alias sshmit="ssh abhijitm@athena.dialup.mit.edu"
alias t="task"
export GOPATH=$HOME/work
