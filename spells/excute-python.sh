#!/bin/bash
p='/Users/arius/code/xbrain/xmonitor-worker/xmonitorparser'

split_by () {
    string=$1
    separator=$2

    tmp=${string//"$separator"/$'\2'}
    IFS=$'\2' read -a arr <<< "$tmp"
    for substr in "${arr[@]}" ; do
        echo "<$substr>"
    done
    echo
}

split_by "$p" "/"
