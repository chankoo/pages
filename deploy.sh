#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Replace Obsidian links with Hugo links
cd content/posts

for file in *.md
do
  tmp_file1="$file.tmp1"
  tmp_file2="$file.tmp2"

  # 너비가 지정된 이미지 링크 처리
  sed 's/!\[\[\(.*\)|\(.*\)\]\]/{{< image src="\/images\/\1" width="\2" >}}/g' "$file" > "$tmp_file1"
  
  # 너비가 지정되지 않은 이미지 링크 처리
  sed 's/!\[\[\(.*\)\]\]/{{< image src="\/images\/\1" >}}/g' "$tmp_file1" > "$tmp_file2"

  # 일반 텍스트 링크 처리
  sed -r 's/\[\[(.*)\]\]/[\1]({{< ref "\/posts\/\1.md" >}})/g' "$tmp_file2" > "$file"

  # 임시 파일 삭제
  rm "$tmp_file1" "$tmp_file2"
done

# Build the project.
# hugo -t <여러분의 테마>
cd ../..
hugo -t hugo-clarity --logLevel info

# Go To Public folder, sub module commit
cd public
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

