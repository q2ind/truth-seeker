#!/bin/bash
dest_dir=`pwd`
#dest_dir=`lmrk | grep current | cut -d ' ' -f 2`
echo "dest_dir=$dest_dir"
docs_dir=/Users/garychen/Documents/work/docs
#echo $docs_dir
jira_dir=/Users/garychen/Documents/work/2017-2ndHalf
#echo $jira_dir
notes_dir=/Users/garychen/Documents/mystuff/notes
#echo "Link to work-related docs and directories..."
# ToDo: use array?
ln -s $docs_dir/Bid-Multipler $dest_dir
ln -s $docs_dir/DSP+API-General $dest_dir
ln -s $docs_dir/Display-aggregator-control-panels $dest_dir
ln -s $docs_dir/display_aggregator_URLs $dest_dir
ln -s $docs_dir/Frequent-viewed-Docs $dest_dir
#ln -s $docs_dir/MySql-failover-checklist $dest_dir
#ln -s $docs_dir/Vertica-failover-checklist $dest_dir
ln -s $docs_dir/aolp-prd-data-encryption $dest_dir
ln -s $docs_dir/aws-host-info $dest_dir
ln -s $docs_dir/avata-info $dest_dir
ln -s $docs_dir/aws-encryption-task $dest_dir
ln -s $jira_dir/mysql-aws-tests $dest_dir
ln -s $docs_dir/myStuffToDo $dest_dir
#ln -s $jira_dir/prod-support/ $dest_dir
#ln -s $docs_dir/redis-master-key-info $dest_dir
ln -s $notes_dir/scala_notes $dest_dir
ln -s $docs_dir/toDo $dest_dir
ln -s $docs_dir/uat-passwords $dest_dir
ln -s $jira_dir/vertica-aws-tests $dest_dir
ln -s $docs_dir/yahoo-api-development-guide $dest_dir
ln -s $docs_dir/yahoo-hosts-access $dest_dir
ln -s $docs_dir/yahoo-onboarding-checklist $dest_dir
ln -s $docs_dir/yahoo-permanent-id-change $dest_dir
ln -s $docs_dir/yahoo-tech $dest_dir
ln -s $docs_dir/yamplus_api_build_instructions $dest_dir
#echo "link to on-going work"
#ln -s $jira_dir/DDEFECTS-367-rpt-monitor-enhancements $dest_dir
#ln -s $jira_dir/DFULLSTACK-8886-rf-avata-to-CLS-tables $dest_dir
#echo "== End =="
cp $docs_dir/tasks-header $dest_dir/tasks
