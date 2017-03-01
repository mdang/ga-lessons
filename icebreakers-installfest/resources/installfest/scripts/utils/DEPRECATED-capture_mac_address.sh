echo "Script now will gather your mac address and send to the class chatbot for"
echo "attendance purposes"

# Get MAC address for attendance
# TODO (phlco) do we need sudo here again?
mac_address=$(sudo ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')
