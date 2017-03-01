
# present a semantic message that allows users to check if their colors are working

show_colors() {
  echo "${RED}${UNDERLINE}This line should be underlined and red before here,"
  echo "${NOUNDERLINE} but just red here.${RESET}"
  echo "${GREEN}${BOLD}This line should be bold green before here,"
  echo "${RESET}${ITALIC}${BG_GREEN} and italic default on a green background here.${RESET}"
  echo "${YELLOW}${BG_BLACK}This line should be yellow on black,${BLACK}${BG_YELLOW} and black on yellow.${RESET}"
  echo "${BLUE}${BG_WHITE}This line should be blue on white,${BG_BLUE}${WHITE} and white on blue.${RESET}"
  echo "${MAGENTA}${BG_CYAN}This line should be magenta on cyan,${BG_MAGENTA}${CYAN} and cyan on magenta.${RESET}"
  echo "${PURPLE}${BG_RED}This line is purple on red.${RESET}"
  echo "${ORANGE}This line is in orange,${RESET}${BG_ORANGE} and on orange.${RESET}"
}

show_colors
