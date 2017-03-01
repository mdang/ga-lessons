# cat "$HOME/.wdi/install.log"> $EMAILMESSAGE

# create file
# PUT /repos/:owner/:repo/contents/:path

subject="Installfest Log Report for $fname $lname"
user_name=$(ruby -e "n = '$fname $lname';puts n.gsub(' ', '_').downcase;")

user_info='{
        name: "'"$fname $lname"'",
        github: {
          name: "'"$github_name"'",
          email: "'"$github_email"'"
        },
        specs: {
          mac_address: "'"$mac_address"'",
          os_version: "'"$os_version"'",
          os_type: "'"$OSTYPE"'"
        }
      }'

encoded_content=$(ruby -rjson -rbase64 -e "puts Base64.strict_encode64($user_info.to_json);")

payload='{
  message: "'"$subject"'",
  committer: {
    name: "'"$fname $lname"'",
    email: "'"$github_email"'"
  },
  content: "'"$encoded_content"'"
}'

timestamp=$(date +%s)

curl "https://api.github.com/repos/$OWNER/$REPO/contents/logs/installfest/$user_name-$timestamp.json" \
  -X "PUT" \
  -H "User-Agent: WDIInstallFest" \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$github_name:$github_password" \
  -d "$(ruby -rjson -e "j=$payload; puts j.to_json")"
