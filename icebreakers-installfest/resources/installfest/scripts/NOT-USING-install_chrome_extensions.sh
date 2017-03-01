# https://developer.chrome.com/extensions/external_extensions.html

# Useful Extensions

# Open chrome extensions in the browser
chrome_ext () {
  local app=$1
  local webstore=https://chrome.google.com/webstore/detail/
  #Checks for system
  if [[ $OSTYPE == "Darwin"*]]; then
    open "$webstore$app"
  else
    xdg-open "$webstore$app"
  fi
}

echo "Now we're going to open your browser to install some Chrome extensions
from the Chrome Webstore."
echo "Just click 'Free' to install them."
echo "If you've already installed them you'll see 'Added to Chrome'"
echo "Ready?"
read -p "Just hit enter!"

# Validate and view JSON documents
chrome_ext jsonview/chklaanhfefbnpoihckbnefhakgolnmc

# Integration with LiveReload App and guard-livereload
chrome_ext livereload/jnihajbhpnppcggbcgedagnkighmdlei

# analyzes the performance of web pages and provides suggestions to make them faster
chrome_ext pagespeed-insights-by-goo/gplegfbjlmmehdoakndmohflojccocli

# REST Client to test in Browser
chrome_ext postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm

# helps you identify and fix performance problems in your web application
chrome_ext speed-tracer-by-google/ognampngfcbddbfemdapefohjiobgbdl

# Adds a panel to Chrome Developer Tools that displays views, models, collections and routers
chrome_ext backbone-debugger/bhljhndlimiafopmmhjlgfpnnchjjbhd

# all information about your Rails app requests right there in the Developer Tools panel
chrome_ext railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg
