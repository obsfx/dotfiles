files=$(git ls-files --modified --deleted --others)

echo "modified: $files"

git add -A
git commit -m "Updated: $files"

echo "pushing to the repo"
git push -u origin main

echo "done"
