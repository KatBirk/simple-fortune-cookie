#!/bin/bash
# ci/test-app.sh

echo "Testing ${APP_URL}..."
response=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}")

if [ "$response" -eq 200 ]; then
  echo "Test passed: App is reachable and returned HTTP 200."
  exit 0
else
  echo "Test failed: App returned HTTP $response."
  exit 1
fi
