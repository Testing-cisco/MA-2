#!/bin/bash
echo -e "########### Starting Script ###################"
sleep 3

echo "Collecting Data"
filename=$1
auth_token=$2
echo -e "########### Starting Migration Analyzer #############"
# Generate files for the report
echo "orgName, repoName, pushedAt, isArchived, numOfPullRequests, numOfIssues, numOfProjects, numOfDiscussions, numOfPackages, numOfReleases, wikiEnabled, diskUsage" > ./gh-migration-analyzer/metrics/repo-metrics.csv
echo "orgName, numOfMembers, numOfProjects, numOfRepos, mostPrs, averagePrs, mostIssues, averageIssues" > ./gh-migration-analyzer/metrics/org-metrics.csv
# Read the file and run migration analyzer for each organization name
is_header=true
while read org
do
	if [ "$is_header" = true ]; then
		is_header=false
		continue
	fi
	echo "Running analyzer for $org"
	node gh-migration-analyzer/src/index.js GH-org -o "$org" -t "$auth_token" -s https://api.github.com/graphql
	echo "Analyzer completed for $org"
done < "$filename"
