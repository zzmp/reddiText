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

# Add the versioned manifest
git add --all
git commit -manifest "(bump) $version"
git tag "$version"

# Push the release
git remote add origin git@github.com:zzmp/reddiText.git
git push --tags origin master
