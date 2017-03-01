# TODO (phlco) remove the description part with a regex capture group
os_version=$(lsb_release -a | grep -i Description)
