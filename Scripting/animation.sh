# plays an animation of a string that will bounce off the sides of the terminal
# Usage: animation.sh "string"
#      : animation.sh
# no argument will use the default string "O"
#
# press q to quit
#
# @author: Alec Parfitt

# check for argument
if [ $# -eq 0 ]; then
    ball="O"
else
    ball="$1"
fi

# set up the screen
clear
tput civis
tput sc

# set up the ball
x=0
y=0
vx=1
vy=1

# set up the boundaries
max_x=$(tput cols)
max_y=$(tput lines)

# set waitkey to break from loop
key = "q"

# set up the loop
while true; do
    # move the ball
    x=$((x + vx))
    y=$((y + vy))

    # check for collisions
    if [ $x -ge $max_x ]; then
        vx=-1
    fi
    if [ $x -le 0 ]; then
        vx=1
    fi
    if [ $y -ge $max_y ]; then
        vy=-1
    fi
    if [ $y -le 0 ]; then
        vy=1
    fi

    clear
    # draw the ball
    tput rc
    tput cup $y $x
    echo -n "$ball"

    # wait a bit
    sleep 0.02

    # check for keypress
    read -t 0.02 -n 1 key
    if [ "$key" = "q" ]; then
        break
    fi

done

# clean up the screen
tput cnorm
tput clear
