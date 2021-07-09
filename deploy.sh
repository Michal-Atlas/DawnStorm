#!/usr/bin/env bash
set -euox pipefail

git worktree add /tmp/gh-pages gh-pages
emacs DawnStorm.org --batch -f 'org-html-export-to-html' --kill
mv DawnStorm.html /tmp/gh-pages/index.html
cd /tmp/gh-pages
git add .
git commit -m "$(date -Ins)"
git push
cd -
git worktree remove /tmp/gh-pages
