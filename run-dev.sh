#!/bin/bash

# Check if a tmux session named 'reporter-dev' is already running
if tmux has-session -t reporter-dev 2>/dev/null; then
    # Kill the existing session
    tmux kill-session -t reporter-dev
fi

# Start a new tmux session named 'reporter-dev'
tmux new-session -d -s reporter-dev

# Enable mouse mode to allow scrolling
tmux set-option -g mouse on

# Rename the window to 'frontend-backend'
tmux rename-window -t reporter-dev 'frontend-backend'

# Start the backend dev server in the first pane
tmux send-keys -t reporter-dev "cd server && npm run serve" C-m

# Split the window horizontally and start the frontend dev server in the new pane
tmux split-window -h -t reporter-dev
tmux send-keys -t reporter-dev "cd app && npm run dev" C-m

# Attach to the session
tmux attach -t reporter-dev
#!/bin/bash

# Check if a tmux session named 'reporter-dev' is already running
if tmux has-session -t reporter-dev 2>/dev/null; then
    # Kill the existing session
    tmux kill-session -t reporter-dev
fi

# Start a new tmux session named 'reporter-dev'
tmux new-session -d -s reporter-dev

# Enable mouse mode to allow scrolling
tmux set-option -g mouse on

# Automatically kill the session if no clients are attached
tmux set-option -t reporter-dev destroy-unattached on

# Rename the window to 'frontend-backend'
tmux rename-window -t reporter-dev 'frontend-backend'

# Start the backend dev server in the first pane
tmux send-keys -t reporter-dev "cd server && npm run serve" C-m

# Split the window horizontally and start the frontend dev server in the new pane
tmux split-window -h -t reporter-dev
tmux send-keys -t reporter-dev "cd app && npm run dev" C-m

# Attach to the session
tmux attach -t reporter-dev
