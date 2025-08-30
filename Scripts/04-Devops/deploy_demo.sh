#!/bin/bash

# deploy_demo.sh
# Description: A safe simulation of a deployment workflow.
# Usage: ./deploy_demo.sh

echo "🚀 Starting simulated deployment..."

# Step 1: Pull latest code (simulated)
echo "[1/4] Pulling latest code... (simulated git pull)"
sleep 1

# Step 2: Install dependencies (simulated)
echo "[2/4] Installing dependencies... (simulated npm install)"
sleep 1

# Step 3: Run tests (simulated)
echo "[3/4] Running test suite..."
if sleep 1; then
    echo "✅ All tests passed!"
else
    echo "❌ Tests failed! Aborting deployment." 1>&2
    exit 1
fi

# Step 4: Restart service (simulated)
echo "[4/4] Restarting application service... (simulated systemctl restart)"
sleep 1

echo -e "\n🎉 Deployment completed successfully! (This was a simulation)"
echo "The application is now live at: http://localhost:8080 (simulated)"
