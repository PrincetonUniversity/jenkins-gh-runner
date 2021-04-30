#! /bin/bash

LISTENER_PATH=/home/luet/actions-runner/bin/Runner.Listener
TMUX_SESSION_NAME=gh-runner

# test for running listener
/usr/sbin/pidof $LISTENER_PATH
running=$?
echo $running

if [ $running -eq 0 ]
then
    echo Runner is running
else
    echo Runner is not running
    echo starting it
    tmux new-session -d -s $TMUX_SESSION_NAME /home/luet/actions-runner/run.sh
fi
