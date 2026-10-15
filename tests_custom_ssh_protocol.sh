
#!/bin/sh

# SSH Protocol Configuration Audit

SSH_CONFIG="/etc/ssh/sshd_config"

echo "======================================"
echo " SSH Protocol Configuration Audit"
echo "======================================"

if [ ! -r "$SSH_CONFIG" ]; then
    echo "[WARN] SSH configuration file is missing or unreadable"
    exit 1
fi

for setting in PermitRootLogin PasswordAuthentication; do
    value=$(grep -E "^[[:space:]]*${setting}[[:space:]]+" "$SSH_CONFIG" \
        | grep -vE "^[[:space:]]*#" \
        | tail -n 1 \
        | awk '{print $2}')

    if [ -n "$value" ]; then
        echo "[INFO] $setting is explicitly configured: $value"
    else
        echo "[INFO] $setting is not explicitly configured in the main file"
    fi
done

echo "======================================"
