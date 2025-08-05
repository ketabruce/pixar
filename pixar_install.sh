#!/bin/bash

# Install MSSQL ODBC drives
sh ./odbc_install.sh

# Install python packages
python3 -m venv /tmp
export PATH=$PATH:/tmp/bin
/tmp/bin/pip install --include-deps dbt-core dbt-sqlserver
/tmp/bin/pip install --include-deps dagster dagster-cloud dagster-dbt dagster-webserver

# Change to Dagster directory
cd dagster_pixar
# Start Dagster webserver in background
/tmp/bin/dagster dev -h 0.0.0.0 -p 3000 &
