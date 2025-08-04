#!/bin/bash

# Install MSSQL ODBC drives
sh ./odbc_install.sh

# Install python packages
pipx ensurepath
pipx install --include-deps dbt-core dbt-sqlserver
pipx install --include-deps dagster dagster-cloud dagster-dbt dagster-webserver

# Change to Dagster directory
cd dagster_pixar
# Start Dagster webserver in background
dagster dev -h 0.0.0.0 -p 3000 &
