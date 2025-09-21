alias wsone_csv="sh $SCRIPTS/customs/wsone_csv.sh"


checkpoint () {
    cd ~/secondbrain
    git add -A && git commit -m "checkpoint" && git push
    cd -
}