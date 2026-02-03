#!/usr/bin/env bash
set -euo pipefail

SQLCMD_PATH="/opt/mssql-tools/bin/sqlcmd"
if [[ ! -x "${SQLCMD_PATH}" ]]; then
  SQLCMD_PATH="/opt/mssql-tools18/bin/sqlcmd"
fi

if [[ ! -x "${SQLCMD_PATH}" ]]; then
  echo "sqlcmd binary not found in expected locations." >&2
  exit 1
fi

/opt/mssql/bin/sqlservr &
sqlservr_pid="$!"

echo "Waiting for SQL Server to become available..."
for _ in $(seq 1 60); do
  if "${SQLCMD_PATH}" -S localhost -U sa -P "${SA_PASSWORD}" -Q "SELECT 1" >/dev/null 2>&1; then
    ready="true"
    break
  fi
  sleep 2
done

if [[ "${ready:-false}" != "true" ]]; then
  echo "SQL Server did not become ready in time." >&2
  exit 1
fi

echo "Running schema initialization..."
"${SQLCMD_PATH}" -S localhost -U sa -P "${SA_PASSWORD}" -i /docker-entrypoint-initdb.d/01-schema.sql

wait "${sqlservr_pid}"
