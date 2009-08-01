# ---- language-env DON'T MODIFY THIS LINE!
# ログインシェルではない bash の起動時に実行される。
# ----- 基本的な設定 -----
# XIM サーバーの名前を定義する
# (XIM は、language-env だけで使うシェル変数です)
XIM=kinput2
# xprop は、xbase-clients パッケージに含まれます
if [ -n "$WINDOWID" -a -x /usr/bin/X11/xprop ] ; then
  # X Window System 上で走ってるけど X Window System と通信する権限が
  # ないとき (su したときなど) への対策
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
  # gnome-terminal は $WINDOWID の意味が違う
  # mlterm は WM_CLASS を設定しない
  # Eterm もロケール自動認識になった
  # xterm もロケール自動認識になった (ただしフォント設定が必要)
  # rxvt-beta もロケール自動認識
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
# XMODIFIERS を export しないのは、emacs が Segmentation Fault を起こすから
# ただし、この方法だと、Debian メニューシステムからの起動には対応できない。
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
# perl がロケールにかんするワーニングを出す場合に有効にしてください。
# PERL_BADLANG=0 ; export PERL_BADLANG
# .bash_profile で使う。
BASHRC_DONE=1
# mh がインストールされていたら、PATH に加える。
if [ -x /usr/bin/mh/mhmail ]
then
  if type mhmail &>/dev/null
  then
    true
  else
    PATH=$PATH:/usr/bin/mh
  fi
fi
## ----- お好みに応じて -----
# ls の動作 (属性表示、色つき)。man ls 参照
if [ "$TERM" = "dumb" -o "$TERM" = "emacs" ]
then
  alias ls='/bin/ls -F'
else
  alias ls='/bin/ls -F --color=auto'
fi
# 標準エディタを vi にする。Debian Policy Manual 参照
EDITOR=vi
export EDITOR
# プロンプト。man bash 参照
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
# ファイルを作るとき、どんな属性で作るか。man umask 参照
umask 022
# less の動作。man less 参照
LESS=-M
export LESS
if type /usr/bin/lesspipe &>/dev/null
then
  LESSOPEN="| /usr/bin/lesspipe '%s'"
  LESSCLOSE="/usr/bin/lesspipe '%s' '%s'"
  export LESSOPEN LESSCLOSE
fi
# Ctrl-D でログアウトするのを抑制する。man bash 参照
IGNOREEOF=3
# カレントディレクトリのバックアップファイルを表示する
# (削除する際は "chkbackups | xargs rm" を実行のこと)
alias chkbackups='/usr/bin/find . -name "?*~" -o -name "?*.bak" -o -name ".[^.]?*~" -o -name ".[^.]?*.bak" -maxdepth 1'
# X Window System 上での設定
if [ "$DISPLAY" ]
then
  # 画面サイズを変更すると COLUMNS, LINES を変更する。man bash 参照
  shopt -s checkwinsize
  # 端末ウィンドウのタイトルを変更する
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