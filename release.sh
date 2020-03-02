# Gox is a "A dead simple, no frills Go cross compile tool." It's used inside `make release`.
go get -u github.com/mitchellh/gox
# Ghr can be used to "Upload multiple artifacts to GitHub Release in parallel."
go get -u github.com/tcnksm/ghr

export OWNER="puma"
export REPO="puma-dev"
export RELEASE="0.13"
export GITHUB_TOKEN="$GITHUB_API_TOKEN"

make release

git tag -f "v${RELEASE}"
git push origin "v${RELEASE}"

ghr -u $OWNER  -t $GITHUB_TOKEN -r $REPO  -n "v${RELEASE}" -delete -prerelease "v${RELEASE}" ./pkg/
