#######################################
# Quick Jump To Today's WDI Folder
#
# Required Environmental Variables:
#   1) `export WDI_WORK_DIR_PATH`
#       Epoch Time of Program W01/D01 (6:00 AM PST)
#       (http://www.epochconverter.com/)
#   2) `export WDI_COURSE_START_TIME`
#       Root Directories Path (Ex: ~/user/code/WDI_DTLA_5/work)
#
# HOW TO USE...
#   To be directed to todays folder (if it has been created):
#   $ wdi
#
#   To be directed to a specific weeks folder (week 2 in this case):
#   $ wdi 2
#
#   To be directed to a specific days folder (week 2 / day 3)
#
#   $ wdi 2 3
#
#######################################

function wdi() {
  # first we check to see if an argument (specific week number) was given
  if [ $1 ]
  then
    # we assign our week variable to the given argument
    week=$1
    # checks to see if an argument (specific day number) was given
    if [ $2 ]
    then
      # we assign our day variable to the given argument
      day=$2
    else
      # we assign our day to an arbitrary variable
      day=yourBirthday
    fi
  else
    # If no day/week is specified, then we need to calculate the difference between our current time and the time of the beginning of course using epoch time

    courseStart=$WDI_COURSE_START_TIME
    secondsPerWeek=604800
    secondsPerDay=86400

    # get current epoch time
    currentTime=$(date +%s)
    let secondsSinceStart=$currentTime-$courseStart

    # days represents the number of days since courseStart rounded down (adds 1 to compensate for starting on d00)
    let day=($secondsSinceStart/$secondsPerDay)+1
    # weeks represents the number of weeks since courseStart rounded down (adds 1 to compensate for starting on w00)
    let week=($day/7)+1

    # use modulus to break down day of week (day 1-7)
    let day=$day%7
  fi

  # Next we check if a number is less than ten
  if [ $week -lt 10 ]
  then
    # If so add the 0 to the front of it for proper formatting (w01)
    week=w0$week
  else
    week=w$week
  fi

  # formatting day to read like 'd01'
  day=d0$day

  # checking if a folder number exists, if not return repo parent folder
  if [ -d $WDI_WORK_DIR_PATH/$week/$day ]
    then
      cd $WDI_WORK_DIR_PATH/$week/$day
  elif [ -d $WDI_WORK_DIR_PATH/$week ]
    then
      cd $WDI_WORK_DIR_PATH/$week
  else
    cd $WDI_WORK_DIR_PATH
  fi
}
