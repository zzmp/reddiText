# Versioning commands
###################

# Grab the version from the package
version=`cat package.json | json version`

# Assign the version to the manifest
json -I -f chrome-ext/manifest.json -e "this.version=$version"

# Zip the distro
###################

zip dist chrome-ext/**/*

# git commands
###################

# Bump the version
git add --all
git commit -m "(bump) $1"
git tag "$1"

# Push the release
git remote add origin git@github.com:zzmp/reddiText.git
git push --tags origin master
