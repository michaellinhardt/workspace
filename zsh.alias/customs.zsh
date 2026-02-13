alias wsone_csv="sh $SCRIPTS/customs/wsone_csv.sh"


checkpoint () {
	cd ~/workspace
    gad -A && gco "checkpoint" && gpu
    cd -
	cd ~/sopai
    gad -A && gco "checkpoint" && gpu
    cd -
    cd ~/secondbrain
    gad -A && gco "checkpoint" && gpu
	cd -
}

sprint-runner () {
    local arg=${1:-1}
    grimoire && claude --dangerously-skip-permissions "/bmad:bmm:workflows:sprint-runner $arg"
}