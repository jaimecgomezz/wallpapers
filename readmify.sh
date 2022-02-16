#!/usr/bin/env sh

##############################
# @jaimecgomezz
#
# updates theme's README with
# wallpaper previews
#
##############################

THEMES="$( ls -l | grep ^d | awk '{print $NF}')"

for theme in */; do
  echo -e "# Preview" >"${theme}/README.md"
  for filename in "${theme}"*; do

    name="$( echo "${filename}" | sed "s_${theme}__")"
    echo -e "![$name](${name})" >>"${theme}/README.md"
  done
  sed -i '/README.md/d' "${theme}/README.md"
done
