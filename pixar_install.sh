#!/bin/bash

# Install python packages
pipx install dbt-core dbt-sqlserver
pipx install dagster dagster-cloud dagster-dbt dagster-webserver

# Install MSSQL ODBC drives
sh ./odbc_install.sh

# Change to Dagster directory
cd dagster_pixar
# Start Dagster webserver in background
dagster dev -h 0.0.0.0 -p 3000 &
