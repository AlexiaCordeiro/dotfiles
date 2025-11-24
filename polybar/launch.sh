#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Set the config file path
CONFIG_PATH="$HOME/.config/polybar/config.ini"

# Check if config file exists
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Error: Config file not found at $CONFIG_PATH"
    exit 1
fi

# Launch Polybar for each monitor
echo "Launching Polybar..."

# Launch main bar
if polybar top -c "$CONFIG_PATH" & then
    echo "Top bar launched successfully"
else
    echo "Failed to launch top bar"
fi

# Wait a moment before launching the second bar
sleep 0.5

# Launch external bar
if polybar external -c "$CONFIG_PATH" & then
    echo "External bar launched successfully"
else
    echo "Failed to launch external bar"
fi

echo "Polybar launch complete!"
