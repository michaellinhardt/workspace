alias wsone_csv="sh $SCRIPTS/customs/wsone_csv.sh"


checkpoint () {
    cd ~/secondbrain
    gad -A && gco "checkpoint" && gpu
	cd -
	cd ~/workspace
    gad -A && gco "checkpoint" && gpu
    cd -
}