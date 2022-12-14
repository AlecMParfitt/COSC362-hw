# prints the bash history of specified user to a file [username]-[date].log in the current directory
# also prints the last login of that user to [username]-login.log
#
# Assumes that home directories are in /home/[username]
#
# requires root privileges if you want to run it on another user's account
#
# usage: sudo userlog.sh [username]
#
# @author: Alec Parfitt

# check for argument
if [ $# -eq 0 ]; then
    echo "No argument supplied"
    echo "Usage: userlog.sh username"
    exit 1
fi

# check if user exists
if ! id -u "$1" >/dev/null 2>&1; then
    echo "User does not exist"
    exit 1
fi

# read user bash history from home/user/.bash_history
cat /home/"$1"/.bash_history > ./$1-"$(date)".txt

# get last login date and time and append it to the log
last -a "$1" | head -n 1 > ./$1-login.log

