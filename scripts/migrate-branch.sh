user=$1
adapter=$2
branch=$3

# create a remote for the legacy adapter repo/fork
git remote remove old || true
git remote add old https://github.com/$user/$adapter.git

# rebase commits in the target branch on top of the monorepo commits
git fetch old
git rebase old/monorepo/stage old/$branch

# merge the updated branch from the legacy adapter repo/fork into the dbt-adapters repo/fork
git checkout -b $branch
git merge old/$branch --allow-unrelated-histories

# remove the remote that was created by this process
git remote remove old || true
