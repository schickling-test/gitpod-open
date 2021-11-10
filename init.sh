set -x 

if [[ -z "${GH_REPO}" && -z "${GH_OWNER}" ]]; then
	SUBDIR="${GH_SUBDIR:-.}"
	BRANCH="${GH_BRANCH:-main}"

	curl https://codeload.github.com/$GH_OWNER/$GH_REPO/tar.gz/$BRANCH | \
		tar -xz --strip=2 $GH_REPO-$BRANCH/$SUBDIR

	ls
  
else
  echo 'env var GH_REPO or GH_OWNER not provided'
fi