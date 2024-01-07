#!/bin/bash 

# Cloning ORG RTD theme to local workspace
# NOTE: This worked however this is not best way of doing this - so 'clone' is not added
#       to repo. I need to find another - better way
git clone --depth 1 https://github.com/fniessen/org-html-themes.git

# Copy theme to right folder
mkdir -vp docs/src/readtheorg_theme
rsync -av org-html-themes/src/readtheorg_theme/ docs/src/readtheorg_theme/
