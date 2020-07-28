#!/usr/bin/env zsh
#
# Copy across dotfiles and configs (warning this overrites, does not symlink).
#
# TODO: how to import iTerm profile via script?

# All config files which will be copied into the default ~/. location.
find ./dotfiles -type f -name ".*" -maxdepth 1 -exec cp {} ~/ \;

# Profile Config dir to copy (just check nested backgrounds folder exists)
USER="$(whoami)"
OUTPUT_DIR="/Users/${USER}/${PROFILE_DIR}/"
BASE_DIR="${PWD}/configs/profile/"
DEFAULTS_DIR="${BASE_DIR}defaults/"

if [ ! -d "${OUTPUT_DIR}/backgrounds" ]; then
    mkdir -p "${OUTPUT_DIR}/backgrounds"
    echo "Created profile config directory for: ${USER}"
fi

# Copy across all profile related config files
function copy_or_use_default() {
  FILE_NAME=$1

  # If the file is JSON replace occurrences of USER_NAME with actual user.
  # This is not a great way to do it - might be better to embed env variable?
  if [[ $FILE_NAME == *".json" ]]; then
    if [ -f "${BASE_DIR}${FILE_NAME}" ]; then
      JSON_DATA=$(cat "${BASE_DIR}${FILE_NAME}")
    else
      JSON_DATA=$(cat "${DEFAULTS_DIR}${FILE_NAME}")
    fi
    echo ${JSON_DATA//USER_NAME/$(echo "${USER}")} > "${OUTPUT_DIR}${FILE_NAME}"
  else
    if [ -f "${BASE_DIR}${FILE_NAME}" ]; then
      cp "${BASE_DIR}${FILE_NAME}" "${OUTPUT_DIR}"
    else
      cp "${DEFAULTS_DIR}${FILE_NAME}" "${OUTPUT_DIR}"
    fi
  fi
}

copy_or_use_default "terminal.png"
copy_or_use_default "profile.png"
copy_or_use_default "iterm-profile.json"

# Copy all background images
cp -R "${BASE_DIR}backgrounds/" "${OUTPUT_DIR}backgrounds/"

echo -e "${GREEN_TICK} All dotfiles and configs copied successfully.${NC}"
