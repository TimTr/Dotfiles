# check the current folder location, then copy the .plist files

# Gets the name of the folder containing where this script was run
CONTAIN_DIR="$( cd "$( dirname "$0" )" && pwd )"

# This style will give the relative path name (not sure how reliable)
# CONTAIN_DIR=$(dirname "$0")

echo "Installing Xcode settings from: " ${CONTAIN_DIR}
cp ${CONTAIN_DIR}/*.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes




exit 0
