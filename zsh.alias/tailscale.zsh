tailscale-stop () {
    sudo killall tailscaled
}

tailscale-start () {
    sudo killall tailscaled 2>/dev/null
    sudo nohup /opt/homebrew/opt/tailscale/bin/tailscaled &
    sleep 5
    tailscale status
}
