## Description
This script will run the open source GitHub migration analyzer for multiple organizations at once.
The script generates two reports for the list of organizations.
The script will read the list of organzations from a mandatory csv file

## Requirements
- A csv file containing the list of organizations in one column with a title row
- Node.js, version 14 or greater

## How to use
- Open the command line(bash), cd to a prefered directory and clone the repo
- cd to "gh-migration-analyzer" and run `npm install` to install the required packages
- Go back to the working directory with `cd ..`
- Place the file containing the list of organizatons in this location
- Generate a classic PAT
- Run `./launch.sh <filename.csv> <PAT>`
    - `filename` is the csv file with the list of organizations to analyze
A folder named `metrics` will be generated under the working directory. It contains 2 files:
    - `orgs-metrics` for the organizations stats
    - `repo-metrics` for the repos stats