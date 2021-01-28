#!/bin/sh

# If a command fails then the deploy stops
set -e

# Print out commands before executing them
set -x

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t cactus  # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

git branch -M main

# Push source and build repos.
git push origin main

# Back to the origin folder
# cd ..

# rm -rf public