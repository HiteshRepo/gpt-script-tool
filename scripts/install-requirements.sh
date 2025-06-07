#!/bin/bash
set -e

if [ -n "$SKIP_INSTALL" ]; then
  # Packages are installed via nix
  echo "Skipping installation of requirements as SKIP_INSTALL is set"
  exit 0
fi

SCRIPT_DIR="${BASH_SOURCE%/*}"
[[ -d "${SCRIPT_DIR}" ]] || SCRIPT_DIR="${PWD}"

echo "Installing requirements..."

# Define versions
GPT_SCRIPT_VERSION=$(awk '$1 == "nodejs" {print $2}' < "${SCRIPT_DIR}/../.tool-versions")

GPT_SCRIPT_MAJOR_VERSION=${GPT_SCRIPT_VERSION%%.*}

# Install bash 5.2 if it's not installed yet
if [ "${BASH_VERSINFO[0]}" -eq 5 ] && [ "${BASH_VERSINFO[1]}" -lt 2 ] || [ "${BASH_VERSINFO[0]}" -lt 5 ]; then
  echo "Installing Bash 5.2+"
  brew install bash
else
  echo "Bash 5.2+ is already installed"
fi

# Install node if it's not installed yet
if ! node -v | grep -q "$GPT_SCRIPT_MAJOR_VERSION"; then
  echo "Installing gptscript $GPT_SCRIPT_MAJOR_VERSION..."
  brew install "gptscript@$GPT_SCRIPT_MAJOR_VERSION" || true
  brew link --overwrite --force "gptscript@$GPT_SCRIPT_MAJOR_VERSION"
  if ! node -v | grep -q "$GPT_SCRIPT_VERSION"; then
    echo "gptscript $GPT_SCRIPT_VERSION is not installed"
    exit 1
  fi
else
  echo "gptscript $GPT_SCRIPT_VERSION is already installed"
fi
