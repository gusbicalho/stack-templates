#! /bin/bash



function make_template() {
  TEMPLATENAME="$1"
  git clean -fxd "$TEMPLATENAME"
  for file in $(cd "$TEMPLATENAME"; find . -type f | sed 's%^./%%' | sort); do
    echo "{-# START_FILE $file #-}"
    cat "$TEMPLATENAME/$file"
  done \
  | perl -p -e 's%(.+){-# START_FILE%\1\n{-# START_FILE%' \
  | sed 's/PROJECTNAME/{{name}}/g' \
  | sed 's%GITHUB_USERNAME%{{github-username}}{{^github-username}}githubuser{{/github-username}}%g' \
  | sed 's%AUTHOR_NAME%{{author-name}}{{^author-name}}Author name here{{/author-name}}%g' \
  | sed 's%AUTHOR_EMAIL%{{author-email}}{{^author-email}}example@example.com{{/author-email}}%g' \
  | sed 's%COPYRIGHT%{{copyright}}{{^copyright}}{{year}}{{^year}}2019{{/year}} {{author-name}}{{^author-name}}Author name here{{/author-name}}{{/copyright}}%g' \
  > "$TEMPLATENAME.hsfiles"
}


for lockfile in ./**/*.lock; do
  [ -e "$lockfile" ] && rm "$lockfile"
done

make_template "multi-pkg-app"
