
# check for gems
for gem in ${gemlist[@]}; do
  assert_that "$gem gem is installed" "gem list $gem -i" "true"
done
