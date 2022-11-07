#! /bin/bash
set -e

pwd=$(pwd)
path=$(dirname "$0")
cd "${path}"

if ! command -v brew &> /dev/null
then
    echo "Installing homebrew"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/main/install.sh
fi

echo "Homebrew installed.  Running brew bundle"
brew bundle -v

if [[ -f ../requirements.txt ]]
then
    echo "Installing mkdocs (python) modules"
    python3 -m pip install -r ../requirements.txt
fi

echo "Installing pre-commit modules"
for hook in pre-push commit-msg pre-commit post-checkout
do
    pre-commit install --hook-type "${hook}"
done

cd "${pwd}"

echo "Installing npm modules"
npm install -g

echo "All done!"
