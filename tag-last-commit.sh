#!/bin/bash

rm ./all_tags_with_commits.txt
for i in  `git tag` ; do echo "$i `git rev-list $i | head -n 1`" >>./all_tags_with_commits.txt; done;
git log | head -n 1 | cut -d " " -f 2 >./last_commit.txt
last_commit=`cat ./last_commit.txt`
last_tag=`cat ./all_tags_with_commits.txt | head -n 1 | cut -d " " -f 1`
git tag --contains $last_commit >./tag_for_last_commit.txt
tag_for_last_commit=`cat ./tag_for_last_commit.txt`
if [[ -z $tag_for_last_commit ]] 
then
 echo "Last tag: $last_tag"
 last_version=`echo $last_tag | egrep -o '[0-9]+[^a-zA-Z].*'`
 echo "Last version was: $last_version"
 last_version_number_major=`echo  $last_version | cut -d "." -f 1`
 last_version_number_minor=`echo  $last_version | cut -d "." -f 2`
 last_version_number_build=`echo  $last_version | cut -d "." -f 3`
 last_version_number_revision=`echo  $last_version | cut -d "." -f 4`
 echo "Last version revision: $last_version_number_revision"
 next_version_number_revision=`expr $last_version_number_revision + 1`
 echo "Next version revision: $next_version_number_revision" 
 next_version="$last_version_number_major.$last_version_number_minor.$last_version_number_build.$next_version_number_revision"
 next_version_tag="metrics-ui-$next_version"
 echo "Next version tag: $next_version_tag"
 # git tag -a "$next_version_tag" -m "Build $next_version" $last_commit 
 # git push --tags
else
 echo "Last commit pulled ($last_commit) already tagged as $last_tag"
fi
