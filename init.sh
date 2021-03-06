set -ex

if [[ -z "${GH_REPO}" && -z "${GH_OWNER}" ]]; then
  echo 'env var GH_REPO or GH_OWNER not provided'
else
	SUBDIR="${GH_SUBDIR:-.}"
	# replaces \ with /
	SUBDIR=${SUBDIR//\\/\/}

	BRANCH="${GH_BRANCH:-main}"
	
	STRIP=$(echo $SUBDIR | tr -cd '/' | wc -c)
	# add +1 for repo-folder and add +1 for last dir
	STRIP=$(($STRIP + 2))

	# clean cwd
	rm -rf .gitpod.yml init.sh README.md .git

	curl https://codeload.github.com/$GH_OWNER/$GH_REPO/tar.gz/$BRANCH | \
		tar -xz --strip=$STRIP $GH_REPO-$BRANCH/$SUBDIR

	COMMAND="${GH_COMMAND:-ls}"

	eval $COMMAND
fi