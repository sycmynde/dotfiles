
# Hermes Agent command
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac

# Auto-start Hermes gateway if not running
if [ -n "$PS1" ] && [ -x /root/start-hermes-gateway.sh ]; then
  /root/start-hermes-gateway.sh >/dev/null 2>&1
fi
