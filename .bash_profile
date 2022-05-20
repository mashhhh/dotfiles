if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
fi

export DENO_INSTALL="/home/m_okuda/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
