# ---- language-env DON'T MODIFY THIS LINE!
# �����󥷥���ǤϤʤ� bash �ε�ư���˼¹Ԥ���롣
# ----- ����Ū������ -----
# XIM �����С���̾�����������
# (XIM �ϡ�language-env �����ǻȤ��������ѿ��Ǥ�)
XIM=kinput2
# xprop �ϡ�xbase-clients �ѥå������˴ޤޤ�ޤ�
if [ -n "$WINDOWID" -a -x /usr/bin/X11/xprop ] ; then
  # X Window System ������äƤ뤱�� X Window System ���̿����븢�¤�
  # �ʤ��Ȥ� (su �����Ȥ��ʤ�) �ؤ��к�
  xprop -id $WINDOWID >& /dev/null || unset WINDOWID
fi
if [ -n "$WINDOWID" -a -x /usr/bin/X11/xprop ] ; then
  XPROP=`xprop -id $WINDOWID WM_CLASS`
  case $XPROP in
  *kterm* | *krxvt* | *kwterm* | *katerm* ) LANG=ja_JP.EUC-JP ;;
  *UXTerm* ) LANG=ja_JP.UTF-8 ;;
  *hanterm* ) LANG=ko_KR.eucKR ;;
  *caterm* | *crxvt-big5* ) LANG=zh_TW.Big5 ;;
  *crxvt-gb* ) LANG=zh_CN.GB2312 ;;
  *aterm* ) LANG=C ;;
  # gnome-terminal �� $WINDOWID �ΰ�̣���㤦
  # mlterm �� WM_CLASS �����ꤷ�ʤ�
  # Eterm ������뼫ưǧ���ˤʤä�
  # xterm ������뼫ưǧ���ˤʤä� (�������ե�������꤬ɬ��)
  # rxvt-beta ������뼫ưǧ��
  * ) : ;;
  esac
else
  case $TERM in
    linux) LANG=C ;;
    xterm)
      if [ "$COLORTERM" != "gnome-terminal" ] ; then
        LANG=C
      fi ;;
    jfbterm) : ;;
    *) LANG=ja_JP.EUC-JP ;;
  esac
fi
case $LANG in
  ja_JP.UTF-8) JLESSCHARSET=utf-8 ; LV="-Ou8 -c" ;;
  ja_JP.*) JLESSCHARSET=japanese-euc ; LV="-Oej -c" ;;
  *) JLESSCHARSET=latin1 ; LV="-Al1 -c" ;;
esac
export LANG JLESSCHARSET LV
if type lv &>/dev/null ; then
  PAGER=lv
elif type jless &>/dev/null ; then
  PAGER=jless
elif type less &>/dev/null ; then
  PAGER=less
else
  PAGER=more
fi
export PAGER
# XMODIFIERS �� export ���ʤ��Τϡ�emacs �� Segmentation Fault �򵯤�������
# ��������������ˡ���ȡ�Debian ��˥塼�����ƥफ��ε�ư�ˤ��б��Ǥ��ʤ���
function rxvt {
  if /usr/bin/which krxvt &> /dev/null
  then
    krxvt $*
  else
    /usr/bin/rxvt $*
  fi
}
alias jfbterm='LANG=ja_JP.EUC-JP /usr/bin/jfbterm'
alias xemacs='XMODIFIERS= xemacs'
# perl ��������ˤ��󤹤��˥󥰤�Ф�����ͭ���ˤ��Ƥ���������
# PERL_BADLANG=0 ; export PERL_BADLANG
# .bash_profile �ǻȤ���
BASHRC_DONE=1
# mh �����󥹥ȡ��뤵��Ƥ����顢PATH �˲ä��롣
if [ -x /usr/bin/mh/mhmail ]
then
  if type mhmail &>/dev/null
  then
    true
  else
    PATH=$PATH:/usr/bin/mh
  fi
fi
## ----- �����ߤ˱����� -----
# ls ��ư�� (°��ɽ�������Ĥ�)��man ls ����
if [ "$TERM" = "dumb" -o "$TERM" = "emacs" ]
then
  alias ls='/bin/ls -F'
else
  alias ls='/bin/ls -F --color=auto'
fi
# ɸ�२�ǥ����� vi �ˤ��롣Debian Policy Manual ����
EDITOR=vi
export EDITOR
# �ץ��ץȡ�man bash ����
if [ "$TERM" = "dumb" -o "$TERM" = "emacs" ]
then
  PS1='\w\$ '
else
  if [ "$UID" = "0" ]
  then
    PS1='\[\e[41m\]\w\$\[\e[m\] '
  else
    PS1='\[\e[7m\]\w\$\[\e[m\] '
  fi
fi
# �ե��������Ȥ����ɤ��°���Ǻ�뤫��man umask ����
umask 022
# less ��ư�man less ����
LESS=-M
export LESS
if type /usr/bin/lesspipe &>/dev/null
then
  LESSOPEN="| /usr/bin/lesspipe '%s'"
  LESSCLOSE="/usr/bin/lesspipe '%s' '%s'"
  export LESSOPEN LESSCLOSE
fi
# Ctrl-D �ǥ������Ȥ���Τ��������롣man bash ����
IGNOREEOF=3
# �����ȥǥ��쥯�ȥ�ΥХå����åץե������ɽ������
# (�������ݤ� "chkbackups | xargs rm" ��¹ԤΤ���)
alias chkbackups='/usr/bin/find . -name "?*~" -o -name "?*.bak" -o -name ".[^.]?*~" -o -name ".[^.]?*.bak" -maxdepth 1'
# X Window System ��Ǥ�����
if [ "$DISPLAY" ]
then
  # ���̥��������ѹ������ COLUMNS, LINES ���ѹ����롣man bash ����
  shopt -s checkwinsize
  # ü��������ɥ��Υ����ȥ���ѹ�����
  function xtitle()
  {
    /bin/echo -e "\033]0;$*\007\c"
  }
fi
# ---- language-env end DON'T MODIFY THIS LINE!
PS1="\h [\w] % "
if [ -n ${DISPLAY} ]; then
    export DISPLAY=localhost:0.0
fi
if [ ! -n "${TERM}" ]; then
    TERM=cygwin
fi
export PERL5LIB=/home/seltsam/perl/lib/perl:/home/seltsam/perl/share/perl
alias ls="ls -aF --color=auto --show-control-chars"
alias la="ls -aF"
alias ll="ls -l"
alias emacs="emacs -nw"
if [ -x /usr/bin/ssh-agent -a -z "$SSH_AUTH_SOCK" ]
then
    eval `ssh-agent` > /dev/null 
fi