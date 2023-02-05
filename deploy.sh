#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Replace Obsidian links with Hugo links
cd content/posts

for file in *.md
do
  tmp_file="$file.tmp"
  sed -r 's/\[\[(.*)\]\]/[\1]({{< ref "\/posts\/\1.md" >}})/g' "$file" > "$tmp_file"

  if [ -s "$tmp_file" ]; then
    mv "$tmp_file" "$file"
  else
    rm "$tmp_file"
  fi
done

# Build the project.
# hugo -t <여러분의 테마>
hugo -t hugo-clarity

# Go To Public folder, sub module commit
cd ../../public
# Add changes to git.
git add .

# Commit changes.
msg="Rebuild site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin main

# Come Back up to the Project Root
cd ..


# blog 저장소 Commit & Push
git add .

msg="Rebuild site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin main

