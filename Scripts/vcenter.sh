#!/bin/bash
#
#  ████████╗███╗   ███╗██╗   ██╗██╗  ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
#  ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
#     ██║   ██╔████╔██║██║   ██║ ╚███╔╝     ███████╗██║     ██████╔╝██║██████╔╝   ██║   
#     ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗     ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   
#     ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗    ███████║╚██████╗██║  ██║██║██║        ██║   
#     ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   
#          For multi Vcenters
# 
# Simple Script to open some panel and connect vcenter
#
# We need to have a ssh account on each VCenter and we need to create a .ssh/config file with the VCenter ssh information
#
# Written by: Christophe Pelichet (c.pelichet@protonmail.com)
#
# Find me on: 
# 
# * LinkedIn:     https://linkedin.com/in/christophepelichet
# * Github:       https://github.com/ChristophePelichet
#
# Change Log 
# V1.00 - 12/15/2021 - Initial version

################
# Start Script #
################

# Set session Name 
SESSION="VCenter"

# Check if $SESSION already exists
tmux has-session -t Vcenter

# if not create
if [ $? != 0 ]
then
    # Create $SESSION and detach
    tmux new-session -s $SESSION -n $SESSION -d

    # Create 1 vertical panel at 20% screen size
    tmux splitw -v -t $SESSION:0 -p 80

    # Create 3 horizontal panel 
    tmux splitw -h -t $SESSION:0.1
    tmux splitw -h -t $SESSION:0.2
    tmux splitw -h -t $SESSION:0.3

    # Split the 3 horizontal panel to vertical
    tmux select-pane -t 0.1 && tmux send-keys && tmux splitw -v -t $SESION:0.1 -p 100
    tmux select-pane -t 0.3 && tmux send-keys && tmux splitw -v -t $SESION:0.3 -p 100
    tmux select-pane -t 0.5 && tmux send-keys && tmux splitw -v -t $SESION:0.5 -p 100
    tmux select-pane -t 0.7 && tmux send-keys && tmux splitw -v -t $SESION:0.7 -p 100

    # Run application 
    tmux select-pane -t 0   && tmux send-keys "ssh my_vcenter_1" C-m
    tmux select-pane -t 0.1 && tmux send-keys "ssh my_vcenter_2" C-m
    tmux select-pane -t 0.2 && tmux send-keys "ssh my_vcenter_3" C-m
    tmux select-pane -t 0.3 && tmux send-keys "ssh my_vcenter_4" C-m
    tmux select-pane -t 0.4 && tmux send-keys "ssh my_vcenter_5" C-m
    tmux select-pane -t 0.5 && tmux send-keys "ssh my_vcenter_6" C-m
    tmux select-pane -t 0.6 && tmux send-keys "ssh my_vcenter_7" C-m
    tmux select-pane -t 0.7 && tmux send-keys "ssh my_vcenter_8" C-m
    tmux select-pane -t 0.8 && tmux send-keys "ssh my_vcenter_9" C-m

    # Back to main panel
    tmux select-pane -t 0

fi

# If already exists , attach to the $SESSION
tmux attach -t $SESSION