#!/bin/bash

#echo "Link to work-related docs and directories..."
docs=(
"Display-aggregator-control-panels"
"Frequent-viewed-Docs"
"Reporting-UAT-and-Other-Stuff"
"Rpt-portal-migration-to-AWS"
"Upgrade-mac-os-to-High-Sierra"
"Yamplus-traffic-api-dev-notes"
"aolp-prd-data-encryption"
"aws-host-info"
"avata-info"
"aws-encryption-task"
"display_aggregator_URLs"
"myStuffToDo"
"new-relic-url"
#"redis-master-key-info"
"toDo"
"things-to-learn"
"yahoo-hosts-access"
"yahoo-onboarding-checklist"
"yahoo-permanent-id-change"
"yahoo-api-development-guide"
"yahoo-tech"
"yamplus_api_build_instructions"
)

## link documents in docs directory
#for doc in "${docs[@]}"; do
#    #echo "docs:${docs_dir}/${doc}"
#    ln -s ${docs_dir}/${doc} $dest_dir
#done

#jira_docs=(
#"vertica-test-notes"
#"mysql-aws-tests"
#"vertica-aws-tests"
#)
## link documents in jira_docs directory
#for doc in "${jira_docs[@]}"; do
#    #echo "jira_docs:${jira_dir}/${doc}"
#    ln -s ${jira_dir}/${doc} $dest_dir
#done

#notes_docs=(
#"aws_notes"
#"java_notes"
#"jenkins_notes"
#"python_notes"
#"scala_notes"
#"seeker_notes"
#)
## link documents in notes_docs directory
#for doc in "${notes_docs[@]}"; do
#    #echo "notes_docs:${notes_dir}/${doc}"
#    ln -s ${notes_dir}/${doc} $dest_dir
#done
#echo "== End =="
#
for doc in "${docs[@]}"; do
    echo "doc=[$doc]"
done
