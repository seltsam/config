# $URL: file:///home/ryo/svn/zshconf/trunk/dot.zshenv $
# $Id: dot.zshenv 6 2006-09-18 08:29:39Z ryo $

# comment for rsync auto login.
#echo "Loading $HOME/.zshenv"

### env

prompt

#PROMPT="%n@%l'%U%m%u[`jobcount()`]:%4~%# "
#PROMPT="%n@%l'%U%m%u[0]:%4~%# "
#PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# ' via いやなブログ

#RPROMPT='   %D{%Y.%m.%d %a %H:%M:%S}'
RPROMPT=$'%{\e[33m%}[%~]%{\e[m%}'

#SPROMPT='zsh: correct '\''%R'\'' to '\''%r'\'' [nyae]? '
#SPROMPT='zsh: replace '\''%R'\'' to '\''%r'\'' ? [Yes/No/Abort/Edit] '

# root attention.
#if [ $UID = 0 ]; then
#	PROMPT="%BROOT%b@%l'%U%m%u[0]:%4~%# "
#                     %n@%l'%U%m%u[0]:%4~%#
#fi

# set default
PROMPT_DEFAULT="$PROMPT"
#RPROMPT_DEFAULT="$RPROMPT"

# for X client
#DISPLAY="192.168.0.210:0.0"

# term
# TERM=xterm-256color

# LANG
export LANG=ja_JP.UTF-8

# surpress perl warnings
export PERL5LIB=~/perl/lib/perl:~/perl/share/perl
#export PERL_BADLANG=0
#export PERLDOC_PAGER=${PAGER}
export EDITOR=/usr/local/bin/vim
export SVN_EDITOR=/usr/local/bin/vim

export DEBFULLNAME=seltsam
export DEBEMAIL=seltsam@gmail.com


## path setting

path=(/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin)
#path=($path /usr/libexec /usr/local/libexec)
#path=($path $HOME/bin)

#path=($path /usr/local/sysutil)
#path=($path /usr/ucb /usr/etc)	# for SunOS

export LD_LIBRARY_PATH=/usr/local/lib

# X
if [ -x /usr/X11R6/bin/X ]; then
	export X11HOME=/usr/X11R6
	path=($path $X11HOME/bin $X11HOME/libexec)
fi

# apache
if [ -x /usr/local/apache/bin ]; then
	path=($path /usr/local/apache/bin)
fi

# namazu
if [ -x /usr/local/namazu/bin ];then
	path=($path /usr/local/namazu/bin)
fi

# samba
if [ -x /usr/local/samba/bin ]; then
	path=($path /usr/local/samba/bin)
fi

# ssl
if [ -x /usr/local/ssl ]; then
	path=($path /usr/local/ssl/bin)
fi

# pg
if [ -x /usr/local/pgsql/bin ]; then
	path=($path /usr/local/pgsql/bin)
fi

# mysql
if [ -x /usr/local/mysql/bin ]; then
	path=($path /usr/local/mysql/bin /usr/local/mysql/libexec)
fi

# qmail
if [ -x /var/qmail/bin ]; then
	path=($path /var/qmail/bin)
fi

# proftpd
if [ -x /usr/local/proftpd/sbin ]; then
	path=($path /usr/local/proftpd/sbin)
fi

# majordomo
if [ -x /usr/local/majordomo/bin ]; then
	path=($path /usr/local/majordomo/bin)
fi

# gems
if [ -x /usr/lib/ruby/gems/1.8 ]; then
  path=($path /usr/lib/ruby/gems/1.8)
fi

# php5
if [ -x /usr/local/php5/bin ];then
	path=($path /usr/local/php5/bin)
fi

# user local bin
if [ -x $HOME/local/bin ];then
	path=($path $HOME/local/bin)
fi
