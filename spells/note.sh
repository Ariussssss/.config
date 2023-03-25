today=$(date -d '1 days ago' +%F)
msg=":dizzy: Update at $today"

cd ~/org/grimoire
git add -A
git commit -a -m "$msg"
git push --repo origin

cd ~/Packages/Ariussssss/open-grimoire
find . -not -path "./.git*" -not -path "." -exec rm -rf {} \;
ls -d ~/org/grimoire/* | xargs -I {} cp -r {} ~/Packages/Ariussssss/open-grimoire
git add -A
git commit -a -m "$msg"
git push --repo origin
cd -

PINK='\033[38;5;218m'
NC='\033[0m' # No Color

printf "\n👾 ${PINK}Push success.${NC}\n\n"
