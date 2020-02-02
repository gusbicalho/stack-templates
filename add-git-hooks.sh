#! /bin/bash

HOOKS=".git/hooks"
HOOKS_TARGET="../.git-hooks"

if [ -d "$HOOKS" ]; then
  if [ -L "$HOOKS" ]; then
    printf "Removing symlink $HOOKS -> $(readlink $HOOKS)\n"
    rm "$HOOKS"
  else
    printf "Moving old hooks to .git/old-hooks\n"
    mv $HOOKS .git/old-hooks
  fi
fi

printf "Creating symlink to $HOOKS_TARGET\n"
ln -s -f $HOOKS_TARGET $HOOKS
