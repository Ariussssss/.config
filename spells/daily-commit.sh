today=$(date -d '1 days ago' +%F)
msg=":dizzy: Update at $today"
git add -A
git commit -a -m "$msg"
git push --repo origin

PINK='\033[38;5;218m'
NC='\033[0m' # No Color

printf "\n👾 ${PINK}Push success.${NC}\n\n"
