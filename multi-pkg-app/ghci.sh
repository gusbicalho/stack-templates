#! /usr/bin/env bash
stack ghci \
  "PROJECTNAME:lib" --main-is "PROJECTNAME:PROJECTNAME-test"
