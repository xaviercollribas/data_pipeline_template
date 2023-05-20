#!/bin/bash

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo -e "Welcome to this script, you have this execution option: 
            --see_report: This flag will automatically open the data observability report. 
                          Otherwise, it will not open it automatically"
else
    piperider run


echo -e "Downloading and inserting data into formatted zone. \n"
echo -e "----------------------------------------------------"
cd /home/xavier/Documents/FIB/TFG/22_04/scripts
python3 execute_extraction.py
echo -e "----------------------------------------------------\n"


echo -e "Running dbt. \n"
echo -e "----------------------------------------------------"
cd /home/xavier/Documents/FIB/TFG/22_04/dbt/data_pipeline
dbt run
echo -e "----------------------------------------------------\n"


echo -e "Creating data observability. \n"
echo -e "----------------------------------------------------"
cd /home/xavier/Documents/FIB/TFG/22_04/dbt/data_pipeline

if [[ "$1" == "--see_report" ]]; then
    piperider run --open
else
    piperider run
fi

echo -e "----------------------------------------------------\n"

fi