#!/bin/bash -x
#
# Usage: $0 [day-shif]
# Last updated: 2018-10-02
#
dest_dir=`pwd`
echo "dest_dir=$dest_dir"
docs_dir=/Users/garychen/Documents/work/docs
#echo $docs_dir
jira_dir=/Users/garychen/Documents/work/jira
#echo $jira_dir
notes_dir=/Users/garychen/Documents/mystuff/notes

# only link directory
ln -s ${docs_dir} $dest_dir
#ln -s ${jira_dir} $dest_dir
ln -s ${notes_dir} $dest_dir
ln -s ${jira_dir}/jira-on-going $dest_dir

#echo "Link to work-related docs and directories..."
#docs=(
#"Display-aggregator-control-panels"
#"Frequent-viewed-Docs"
#"Reporting-UAT-and-Other-Stuff"
#"Rpt-portal-migration-to-AWS"
#"Upgrade-mac-os-to-High-Sierra"
#"Yamplus-traffic-api-dev-notes"
#"aolp-prd-data-encryption"
#"aws-host-info"
#"avata-info"
#"aws-encryption-task"
#"display_aggregator_URLs"
#"myStuffToDo"
#"new-relic-url"
##"redis-master-key-info"
#"toDo"
#"things-to-learn"
#"yahoo-hosts-access"
#"yahoo-onboarding-checklist"
#"yahoo-permanent-id-change"
#"yahoo-api-development-guide"
#"yahoo-tech"
#"yamplus_api_build_instructions"
#)

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

## copy tasks and update start/end dates
taskfile=$dest_dir/tasks
/bin/cp $docs_dir/tasks-header $taskfile

# -- update dates in tasks
# -- day_shift:
#      positive number: shift forward
#      negative number: shift backward
#    e.g. run on 11/02 with day_shift=3, it will generate 11/05 - 11/09
#         run on 11/02 with day_shift=-3, it will generate 10/30 - 11/03
#
day_shift=0
if [ "$#" -eq "1" ]; then
    day_shift=$1
    echo "day_shift=[$day_shift]"
fi

days=(1 2 3 4 5)
for day in "${days[@]}"; do
    let "daydiff=$day-1+$day_shift"
    echo "daydiff: ${daydiff}"
    if (( daydiff < 0 )); then
        formatted_day=`date -v ${daydiff}d '+%m/%d/%Y'`
    elif (( daydiff > 0 )); then
        formatted_day=`date -v +${daydiff}d '+%m/%d/%Y'`
    else
        formatted_day=`date '+%m/%d/%Y'`
    fi
    echo "formatted_day = $formatted_day"
    #formatted_day=`date -v +${daydiff}d '+%m/%d/%Y'`
    #echo "day: ${day} = ${formatted_day}"
    sed -i.bak "s%day${day}%$formatted_day%" $taskfile
    if [ "$day" -eq "1" ]; then
        sed -i.bak "s%week_start%$formatted_day%" $taskfile
    elif [ "$day" -eq "5" ]; then
        sed -i.bak "s%week_end%$formatted_day%" $taskfile
    fi
done
## clean up backup file
if [ -f $taskfile.bak ]; then
    /bin/rm -f $taskfile.bak
fi

#appdir=reporting-validation

#if [ -d $appdir ]; then
#  echo "$appdir exists"
#else
#  echo "$appdir not existed"
#fi

#echo $?
#grep 'test' data.sh
#out=$?
#echo $out

## link reporting-portal related tasks (as of 11/01/2018)
ln -s notes/reporting-b2b-upgrade $dest_dir
## 
## link kafka related notes (06/18/2018)
ln -s notes/kafka-upgrade-notes $dest_dir
ln -s notes/kafka_notes .
ln -s notes/dev-kafka-notes .
## link qiao notes (issues) 08/09/2018
ln -s notes/qiao_notes .   
#ln -s notes/kafka_load_tests_notes .
ln -s notes/kafka-tasks $dest_dir

## link previous week tasks
let "days_diff=7-$day_shift"
#let "days_diff=7+$day_shift"
echo "-- debug -- days_diff=$days_diff"
#prev_week=`date -v-7d +%m%d`
prev_week=`date -v-${days_diff}d +%m%d`
echo "-- debug -- prev_week=$prev_week"
ln -s ../week-$prev_week/tasks prev.tasks


CURRENT_DIR=`pwd`
echo $CURRENT_DIR


