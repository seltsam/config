#
# $URL: file:///home/ryo/svn/zshconf/trunk/dot.zshrc $
# $Id: dot.zshrc 6 2006-09-18 08:29:39Z ryo $

echo "Loading $HOME/.zshrc"

### shell variables

# zsh ���Ȥ��������ѿ��Τ����ҥ��ȥ������ǽ�ˤ˴ؤ�����

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

# ��ʬ�ʳ��Υ桼���Υ������󡦥��������Ȥ�ɽ������褦�ˤʤ�

WATCH=notme

# core �ե�����Υ������� 0 ����������
unlimit
limit core 0
limit -s

# �ե�����������Υǥե���ȤΥ⡼�ɤ���ꤹ��
umask 022

# ü�������ꡧCtrl+H �� 1 ʸ�������Ctrl+C �˳����ߡ�Ctrl+Z �˥����ڥ��
stty erase '^H'
stty intr '^C'
stty susp '^Z'

# ����ɽ�����줿�䴰����򥫡��������򤹤�
zstyle ':completion:*:default' menu select=1

### key bindings

# zsh �Υ����Х���ɤ�Ķ��ѿ� EDITOR �˴ؤ�餺 emacs ���ˤ���

bindkey -e				# EDITOR=vi -> bindkey -v
#bindkey -v                              # EDITOR=vi -> bindkey -v

# �������ƤǤϤʤ�������������֤�������������������褦���ѹ�
# ��Ctrl+Space �ˤ��ޡ������֤��饫��������֤ޤǤ�ä��褦���ѹ�
# ��Esc+H �ǡ�������������ñ�������backward-kill-word ���¿��˾ä���
# ��Esc+. �ǡ����ޥ�ɥ饤��κǸ�ΰ����򷫤��֤���������

bindkey '^U' backward-kill-line		# override kill-whole-line
bindkey '^W' kill-region		# override backward-kill-word
bindkey '^[h' vi-backward-kill-word	# override run-help
bindkey '^[.' copy-prev-word		# override insert-last-word


# esc �ϻȤ��ˤ����ΤǶ����� ctrl �˳�꿶�롣
bindkey '^B' backward-word
bindkey '^F' forward-word



## �ʲ������̤����ɤ����뤿���ʣ���ե�������ڤ�ʬ���� include ���Ƥ��� ##
## ��$ZUSERDIR �� .zprofile �ǻ����                                     ##

### zsh options

# zsh ���Τ�Τ�ư�����ꤹ�륪�ץ���������

if [ -f $ZUSERDIR/zshoptions ]; then
  source $ZUSERDIR/zshoptions
fi


### completions

# �䴰�������Ԥ� compctl ������ե�������ɤ߹���

if [ -f $ZUSERDIR/completions ]; then
  source $ZUSERDIR/completions
fi

# see $fpath
autoload -U compinit ; compinit

### aliases

# ���ޥ�ɤ���̾��Ĥ��� alias ������ե�������ɤ߹���

if [ -f $ZUSERDIR/aliases ]; then
  source $ZUSERDIR/aliases
fi


### functions

# ʣ���ʵ�ǽ��¸�����ؿ� function ������ե�������ɤ߹���

if [ -f $ZUSERDIR/functions ]; then
  source $ZUSERDIR/functions
fi


### color ls

# ���Ĥ� ls ������ե�������ɤ߹���

if [ -f $ZUSERDIR/lscolors ]; then
  source $ZUSERDIR/lscolors
#  alias ll='ls -lAF --color=tty'
fi

autoload -U colors ; colors

### User environment

# �桼���ȼ�������ե����뤬������ɤ߹���

if [ -f $ZUSERDIR/zshrc.user ]; then
  source $ZUSERDIR/zshrc.user
fi
