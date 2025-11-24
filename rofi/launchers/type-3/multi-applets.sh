#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-3"
theme='style-8-center'  # Use your centered theme

SCREENSHOT_SCRIPT="$HOME/.config/rofi/applets/bin/screenshot.sh"
SYSTEM_SCRIPT="$HOME/.config/rofi/applets/bin/system-info.sh"
VOLUME_SCRIPT="$HOME/.config/rofi/applets/bin/volume.sh"
BATTERY_SCRIPT="$HOME/.config/rofi/applets/bin/battery.sh"

case "$1" in
    "screenshot")
        rofi \
            -modi "screenshot:$SCREENSHOT_SCRIPT" \
            -show screenshot \
            -theme ${dir}/${theme}.rasi
        ;;
    "system")
        rofi \
            -modi "system:$SYSTEM_SCRIPT" \
            -show system \
            -theme ${dir}/${theme}.rasi
        ;;
    "volume")
        rofi \
            -modi "volume:$VOLUME_SCRIPT" \
            -show volume \
            -theme ${dir}/${theme}.rasi
        ;;
    "battery")
        rofi \
            -modi "battery:$BATTERY_SCRIPT" \
            -show battery \
            -theme ${dir}/${theme}.rasi
        ;;
    "multi")
        # Multi-modi mode - switch between applets with Alt+1, Alt+2, etc.
        rofi \
            -modi "apps:drun,\
                   screenshot:$SCREENSHOT_SCRIPT,\
                   system:$SYSTEM_SCRIPT,\
                   volume:$VOLUME_SCRIPT,\
                   battery:$BATTERY_SCRIPT" \
            -show apps \
            -theme ${dir}/${theme}.rasi
        ;;
    "applets")
        # Master applets menu
        choice=$(echo -e "🚀 Multi-Mode (Alt+1,2,3...)\n📸 Screenshot\n🔋 Battery\n💡 System Info\n🔊 Volume\n🎯 Applications Only" | \
                 rofi -dmenu \
                      -p "Applets:" \
                      -theme ${dir}/${theme}.rasi)
        
        case "$choice" in
            "🚀 Multi-Mode (Alt+1,2,3...)") $0 multi ;;
            "📸 Screenshot") $0 screenshot ;;
            "🔋 Battery") $0 battery ;;
            "💡 System Info") $0 system ;;
            "🔊 Volume") $0 volume ;;
            "🎯 Applications Only")
                rofi \
                    -show drun \
                    -theme ${dir}/${theme}.rasi
                ;;
        esac
        ;;
    *)
        # Default: open the master applets menu
        $0 applets
        ;;
esac
