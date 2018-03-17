#!/bin/bash
# running to fast will lead to get error latest tag name!!!

current_tag=$(git describe --abbrev=0 --tags)
if [ "$current_tag" != "" ]; then
	echo "Current tag is: $current_tag"
	version="${current_tag/v/}"
	version_bits=(${version//./ })
	if (( $((${version_bits[1]}+1)) < 10 )); then
		new_tag="v${version_bits[0]}.$((${version_bits[1]}+1))"
	else
		new_tag="v$((${version_bits[0]}+1)).0"
	fi
	echo "Next tag is: $new_tag"
	git tag $new_tag -m "$new_tag"
else
	git tag v1.0 -m 'v1.0'
fi