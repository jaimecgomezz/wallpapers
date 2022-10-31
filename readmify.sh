#!/usr/bin/env sh

##############################
# @jaimecgomezz
#
# updates theme's README with
# wallpapers previews
#
##############################

for theme in */; do
	echo -e "# Preview" >"${theme}/README.md"
	for filename in "${theme}"*; do
		file="$(echo "${filename}" | sed "s_${theme}__")"
		name="$(echo "$file" | sed 's/\..*//')"
		echo -e "![${name}](${file} '${name}')" >>"${theme}/README.md"
	done
	sed -i '/README.md/d' "${theme}/README.md"
done
