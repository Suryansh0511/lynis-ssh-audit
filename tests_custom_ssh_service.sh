
#!/bin/sh

echo "===================================="
echo " SSH Service Status Audit"
echo "===================================="

if command -v ssh >/dev/null 2>&1; then
    echo "[PASS] SSH client is installed"
else
    echo "[FAIL] SSH client is not installed"
fi

if command -v pgrep >/dev/null 2>&1 && pgrep -x sshd >/dev/null 2>&1; then
    echo "[PASS] SSH daemon is running"
else
    echo "[FAIL] SSH daemon is not running"
fi

echo "===================================="
