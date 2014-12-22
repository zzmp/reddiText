# Versioning commands
###################

# Grab the version from the package
version=`cat package.json | json version`

# Assign the version to the manifest
json -I -f chrome-ext/manifest.json -e "this.version='$version'"

# Zip the distro
###################

zip -r dist chrome-ext

# git commands
###################

# Add the versioned manifest
git add --all
git commit -m "(patch) v$version"
git tag "v$version"

# Push the release
git remote add origin git@github.com:zzmp/reddiText.git
git push --tags origin master
