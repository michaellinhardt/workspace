# REPLACE SSH COMMAND WITH PRE AND POST HOOKS
ssh () { ssh_with_hooks "$@" }

ssh_with_hooks() {
    ssh_hook_before
    /usr/bin/ssh "$@"
    ssh_hook_after
}

ssh_hook_before() {
    echo "Executing pre-connection commands..."
    echo -e "\033]Ph370000\033\\"
}

ssh_hook_after() {
    echo "Executing post-connection commands..."
    echo -e "\033]Ph000000\033\\"
}