info="Commit: $(date)"
echo "OS detected: $OSTYPE"

case "$OSTYPE" in
    darwin*)
        cd "`dirname $0`" || exit 1
        ;;

    linux*)
        cd "$(dirname "$(readlink -f "$0")")" || exit 1
        ;;

    *)
        echo "OS unsupported (submit an issue on GitHub!)"
        ;;
esac

echo "$info" >> output.txt
echo "$info"
echo

# Detect current branch (main, master, etc)
branch=$(git rev-parse --abbrev-ref HEAD)

# Ship it
git add output.txt
git commit -m "$info"
git push origin "$branch"

cd -
