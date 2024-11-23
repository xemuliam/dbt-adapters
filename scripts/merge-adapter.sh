adapter=$1
repo=https://github.com/dbt-labs/$adapter.git
echo $repo
git remote remove old || true
git remote add old $repo
git fetch old
git merge old/main --allow-unrelated-histories
