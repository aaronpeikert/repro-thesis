#!/bin/sh
rm -rf book-output
git clone -b gh-pages \
  git@github.com:aaronpeikert/repro-thesis.git \
  book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m "Update the thesis"
git push -q origin gh-pages
