#!/bin/bash
# simple tests for the Jenkins Test stage

fail=0
for f in Amandykova_Diana_info.txt scripts/Amandykova_Diana_system.sh app/server.js Dockerfile docker-compose.yml Jenkinsfile; do
  if [ -e "$f" ]; then echo "[PASS] $f"; else echo "[FAIL] $f not found"; fail=1; fi
done

grep -q "41547" Amandykova_Diana_info.txt && echo "[PASS] student ID" || { echo "[FAIL] student ID"; fail=1; }
bash -n scripts/Amandykova_Diana_system.sh && echo "[PASS] script syntax" || { echo "[FAIL] script syntax"; fail=1; }

exit $fail
