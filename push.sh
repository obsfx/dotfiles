files=$(git ls-files --modified --deleted --others)

git add -A
git commit -m "Updated: $files"
git push -u origin main
