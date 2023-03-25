if [ $TMUX ]; then
    current_tmux="$(tmux display-message -p '#W/#P')"
    current_tmux_pane="$(tmux display-message -p '#P')"
    echo "Current tmux-session: $current_tmux_pane"
    if [[ "$current_tmux_pane" == "1" ]]; then
	echo "Current tmux-session: $current_tmux_pane"
	tmux split-window -h
    fi
    echo "Current tmux-session: $current_tmux"
    target_script="$HOME/.tmux/scripts/$current_tmux.sh"
    if [ -f $target_script ]; then
	sh $target_script
    fi
fi
