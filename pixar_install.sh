#!/bin/bash

# Download source from GitHub
wget https://github.com/ketabruce/pixar/archive/refs/heads/main.zip

# Unzip source code
unzip main.zip

# Change to code directory
cd pixar-main

# Install python packages
pip install dbt-core dbt-sqlserver
pip install dagster dagster-cloud dagster-dbt dagster-webserver

# Install MSSQL ODBC drives
sh ./odbc_install.sh

# Change to Dagster directory
cd dagster_pixar
# Start Dagster webserver in background
dagster dev -h 0.0.0.0 -p 3000 &
