oh-my-posh init fish --config $HOME/.poshthemes/customMontys.omp.json | source
function fish_greeting
    set_color cyan
    echo "👋 Welcome, $USER!"
    set_color green
    echo "Today is " (date "+%A, %B %d, %Y")
    set_color normal

    # Battery
    if test -d /sys/class/power_supply/BAT0
        set capacity (cat /sys/class/power_supply/BAT0/capacity)
	set sStatus (cat /sys/class/power_supply/BAT0/status)   
     	set_color yellow
        echo "Battery: $capacity% ($sStatus)"
        set_color normal
    end

    # Uptime
    set uptime (uptime -p)
    set_color green
    echo "Uptime: $uptime"
    set_color normal

    echo ""
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
