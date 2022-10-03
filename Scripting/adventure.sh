# Simple choose your own adventure game
#
# @author: Alec Parfitt

# starting variables
location="1"
dry=false
power=false
garlicgum=false
homework=false

declare -A locations
locations["1"]="Courtyard"
locations["2"]="Parking Lot"
locations["3"]="Lobby1"
locations["4"]="Lobby2"
locations["5"]="Electrical Room1"
locations["6"]="Stairwell1"
locations["7"]="Stairwell2"
locations["8"]="Hallway"
locations["12"]="Classroom2"
locations["10"]="Restroom1"
locations["11"]="Restroom2"

declare -A descriptions
descriptions["1"]="You are in the courtyard. The Parking Lot is to the West. You can see the Computer Science building where
your next class is. There is a light rain falling."
descriptions["2"]="You are in the parking lot. The Courtyard is to the East. You can see the car you arrived in. There is a 
light rain falling."
descriptions["3"]="You are in the lobby of the CS building. It seems like the power is out. You see the receptionist
asleep at her desk. You see a door with a big lightning bolt on it, the entrance to the stairwell that leads to your classroom,
and the door to the Restroom."
descriptions["4"]="You are in the lobby of the CS building. After switching the power back on, you see the receptionist
has woken up and resumed her duties, which mostly include scrolling through Facebook. There is a strong smell coming from her direction.
You see the stairwell that leads to your classroom. You hear a whirring sound coming from the Restroom."
descriptions["10"]="You are in the restroom. It is a normal restroom, but it is dark."
descriptions["11"]="You are in the restroom. After turning the power on, you notice that the hand dryer is stuck on."
descriptions["5"]="You are in the electrical room. There is a large panel of switches and one big switch labeled 'Power'. The
large switch is flipped to the off position, but something looks sketchy about it."
descriptions["6"]="You are in the stairwell. It is dark. Your classroom is up the stairs."
descriptions["7"]="You are in the stairwell. Your classroom is up the stairs."
descriptions["8"]="You are in the hallway. You see the door to your classroom and there seems to be manicial laughter
and organ music coming from inside."


echo "You arrive at campus as 9:00PM on a late October night. You have a class in the Computer Science building at 9:30PM.
This is a strange time for a class, but the professor is a bit eccentric. You are a bit late, but you can still make it if you hurry."
echo ""

# main loop
while true; do
    echo "==================================================================================="
    # print description
    echo "${descriptions[$location]}"
    echo ""
    echo "What do you want to do?"
    echo ""

    # check where the player is and print options
    if [ $location == "1" ]; then
        select option in "Go to Parking Lot" "Go to CS Building" "Quit"; do
            case $option in
                "Go to Parking Lot")
                    location="2"
                    break
                    ;;
                "Go to CS Building")
                    #check if the power is on
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "2" ]; then
     select option in "Go to Courtyard" "Get homework from car" "Quit"; do
            case $option in
                "Go to Courtyard")
                    location="1"
                    break
                    ;;
                "Get homework from car")
                    if $homework; then
                        echo "You already have your homework."
                    else
                        echo "You get your homework from your car."
                        homework=true
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "3" ]; then
     select option in "Go to Restroom" "Go to Electrical Room" "Go to Stairwell" "Quit"; do
            case $option in
                "Go to Restroom")
                    location="10"
                    break
                    ;;
                "Go to Electrical Room")
                    location="5"
                    break
                    ;;
                "Go to Stairwell")
                    location="6"
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "4" ]; then
     select option in "Go to Restroom" "Go to Stairwell" "Approach receptionist" "Quit"; do
            case $option in
                "Go to Restroom")
                    location="11"
                    break
                    ;;
                "Go to Stairwell")
                    location="7"
                    break
                    ;;
                "Approach receptionist")
                    # check if user has garlic gum
                    if $garlicgum; then
                        echo "==================================================================================="
                        echo "The receptionist tells you to get lost."
                    else
                        echo "==================================================================================="
                        echo "The receptionist doesn't look up from her phone, but points at a plastic Jack-O-Lantern on her desk. 
You take a piece of garlic chewing gum from the pumpkin and immediately and greedily start chewing. There is garlic oozing from your pores"
                        garlicgum=true
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "5" ]; then
     select option in "Go back to Lobby" "Flip the switch" "Quit"; do
            case $option in
                "Go back to Lobby")
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Flip the switch")
                    power=true
                    echo "==================================================================================="
                    echo "You flip the switch. The power comes back on. You exit the electrical room"
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "6" ]; then
     select option in "Ascend the stairs" "Go back to Lobby" "Quit"; do
            case $option in 
                "Ascend the stairs")
                echo "==================================================================================="
                    echo "It is dark. You decide since you can't see the stairs, you should try running as fast as you can in the 
direction you believe them to be. Your muscle memory is great, this probably would have worked for you if 
you were dry, but the rain was not on your mind when you were running. You slip and fall down the stairs. You are
dead."
                    exit
                    ;;
                "Go back to Lobby")
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "7" ]; then
    select option in "Ascend the stairs" "Go back to lobby" "Quit"; do
            case $option in 
                "Ascend the stairs")
                    if $dry; then
                        location="8"
                    else
                        echo "==================================================================================="
                        echo "You feel victorious as you climb the stairs to your classroom. You are momentarily confused as your view switches to 
the ceiling and stairs spiraling up. 'Oh!,' you think, 'I'm looking up the stairwell now. I guess that squeak was my wet shoes 
on the tile. At least vampires can't get me now.' You have slipped down the stairs and died."
                        exit
                    fi
                    break
                    ;;
                "Go back to Lobby")
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "8" ]; then
     select option in "Go to classroom" "Go back to stairwell" "Quit"; do
            case $option in 
                "Go to classroom")
                    # check if user has garlic gum
                    if $garlicgum && $homework; then
                        echo "==================================================================================="
                        echo "You enter the classroom. The professor is a vampire but when he smells the garlic gum, he runs out of the room."
                        echo "You place your homework on the professor's desk and leave the classroom. You survived and got an A!"
                        echo ""
                        echo "You win!"
                    elif $garlicgum; then
                        echo "You enter the classroom. The garlic chewing gum taken from the receptionist's desk is effective against the vampire. 
You have survived, but you failed the class because you didn't turn in your homework."
                        exit
                    else
                        echo "You enter the classroom. Immediately, a .bat file opens and spawns a vampire. You are dead."
                        exit
                    fi
                    break
                    ;;
                "Go back to stairwell")
                    location="7"
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "10" ]; then
     select option in "Go back to Lobby" "Use the restroom" "Quit"; do
            case $option in 
                "Go back to Lobby")
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Use the restroom")
                    echo "==================================================================================="
                    echo "You use the restroom. Since the power is out, you can't flush the toilet. Gross."
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    elif [ $location == "11" ]; then
     select option in "Go back to the Lobby" "Dry shoes with the air dryer" "Quit"; do
            case $option in 
                "Go back to the Lobby")
                    if $power; then
                        location="4"
                    else
                        location="3"
                    fi
                    break
                    ;;
                "Dry shoes with the air dryer")
                    echo "==================================================================================="
                    echo "You dry your shoes with the air dryer. You are now dry."
                    dry=true
                    break
                    ;;
                "Quit")
                    exit
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
    fi
done

