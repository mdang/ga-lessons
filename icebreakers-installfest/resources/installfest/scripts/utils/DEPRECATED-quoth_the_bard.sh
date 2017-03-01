
function quoth_the_bard () {
  local message=$1
  local attribution=$2
  echo ""
  echo "${RED}${message}${RESET}"
  echo "${BLUE}${attribution}${RESET}"
  echo ""
}

# TODO (phlco) move these to a better place like utils

function pause_awhile () {
  echo ""
  read -p "${BG_YELLOW}>>>>    $*. Press <Enter> to continue.${RESET}"
}

function inform () {
  echo ""
  echo "${BG_GREEN}>>>>    $* ${RESET}"
}

function warn () {
  echo ""
  echo "${BG_RED}${WHITE}>>>>    $* ${RESET}"
}

function backup () {
  local timestamp=$(date +%s)
  local file=$1
  if [ -a "$file" ]; then
    cp -r $file{,-$timestamp.backup}
  fi
}

function install_zip () {
  local file_name="$1"
  mkdir "$file_name"
  unzip "$file_name.zip" -d "$file_name"
  mv $file_name/*.app /Applications
}

THE_PLAYS_THE_THING="The play's the thing..."
HOW_NOW_SSH_KEYS=(
"Double, double toil and trouble; Fire burn, and caldron bubble."
"--Macbeth (IV.i)"
)
HOW_NOW_RVM=(
"Woe, destruction, ruin, and decay; the worst is death and death will have his day."
"--Richard II (III.ii)"
)
HOW_NOW_BREW=(
"PISTOL: The plain-song is most just: for humours do abound:
Knocks go and come; God's vassals drop and die;
And sword and shield,
In bloody field,
Doth win immortal fame.

Boy: Would I were in an alehouse in London! I would give
all my fame for a pot of ale and safety."
"--Henry V (III.ii)"
)
HOW_NOW_TERMINAL=(
"I have touch'd the highest point of all my greatness;
And, from that full meridian of my glory,
I haste now to my setting: I shall fall
Like a bright exhalation in the evening,
And no man see me more."
"--Henry VIII (III.ii)"
)
HOW_NOW_RUBY=(
"Once more the ruby-colour'd portal open'd,"
"--Venus and Adonis (1593)"
)
HOW_NOW_GIT=(
"MARIA: This and these pearls to me sent Longaville:
The letter is too long by half a mile.

PRINCESS OF FRANCE: I think no less. Dost thou not wish in heart
The chain were longer and the letter short?"
"--Love's Labour Lost (V.ii)"
)
HOW_NOW_APPS=(
"Lend me an arm; the rest have worn me out
With several applications..."
"--All's Well That Ends Well (I.ii)"
)
HOW_NOW_CONFIGURE=(
"Suit the action to the word, the word to the action,
with this special observance that you o'erstep not the modesty of nature."
"--Hamlet (III.ii)"
)
HOW_NOW_GEMS=(
"Making a couplement of proud compare,
With sun and moon, with earth and sea's rich gems,
With April's first-born flowers, and all things rare
That heaven's air in this huge rondure hems."
"--Sonnet 21"
)
HOW_NOW_DB=(
"'Tis in my memory lock'd, And you yourself shall keep the key of it."
"--Hamlet (I.iii)"
)
HOW_NOW_FINISH=(
"Once more unto the breach, dear friends, once more;
Or close the wall up with our English dead."
"--Henry V (III.i)"
)
HOW_NOW_NODE=(
"But that my heart's on future mischief set,
I would speak blasphemy ere bid you fly:
But fly you must; uncurable discomfit
Reigns in the hearts of all our present parts."
"--Henry VI, Part 2 (V.ii)"
)
HOW_NOW_GIT=(
"HAMLET: ... for you yourself, sir,
should be old as I am if, like a crab, you could go backward.

POLONIUS: [aside] Though this be madness, yet there is a method in't.-
Will You walk out of the air, my lord?"
"--Hamlet (II.ii)"
)
