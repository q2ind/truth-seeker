#!/bin/bash -x
#
# Usage: $0 [day-shif]
# Last updated: 2018-10-02
#
dest_dir=$(pwd)
#echo "dest_dir=$dest_dir"
docs_dir=/Users/garychen/Documents/work/docs
#echo $docs_dir
jira_dir=/Users/garychen/Documents/work/jira
#echo $jira_dir
notes_dir=/Users/garychen/Documents/mystuff/notes

# only link directory
ln -s ${docs_dir} "$dest_dir"
ln -s ${notes_dir} "$dest_dir"
ln -s ${jira_dir} "$dest_dir"


## copy tasks and update start/end dates
taskfile=$dest_dir/tasks
/bin/cp $docs_dir/tasks-header "$taskfile"

# -- update dates in tasks
# -- days_shift:
#      positive number: shift forward
#      negative number: shift backward
#    e.g. run on 11/02 with days_shift=3, it will generate 11/05 - 11/09
#         run on 11/02 with days_shift=-3, it will generate 10/30 - 11/03
#
days_shift=0
if [ "$#" -eq "1" ]; then
    days_shift=$1
    echo "days_shift=[$days_shift]"
fi

days=(1 2 3 4 5)
for day in "${days[@]}"; do
    ##let "daydiff=$day-1+$days_shift"
    (( daydiff=day-1+days_shift ))
    #echo "daydiff: ${daydiff}"
    if (( daydiff < 0 )); then
        formatted_day=$(date -v ${daydiff}d '+%m/%d/%Y')
    elif (( daydiff > 0 )); then
        formatted_day=$(date -v +${daydiff}d '+%m/%d/%Y')
    else
        formatted_day=$(date '+%m/%d/%Y')
    fi
    #echo "formatted_day = $formatted_day"
    #formatted_day=$(date -v +${daydiff}d '+%m/%d/%Y')
    #echo "day: ${day} = ${formatted_day}"
    sed -i.bak "s%day${day}%$formatted_day%" "$taskfile"
    if [ "$day" -eq "1" ]; then
        sed -i.bak "s%week_start%$formatted_day%" "$taskfile"
    elif [ "$day" -eq "5" ]; then
        sed -i.bak "s%week_end%$formatted_day%" "$taskfile"
    fi
done
## clean up backup file
if [ -f "$taskfile.bak" ]; then
    /bin/rm -f "$taskfile".bak
fi


## link docs
ln -s docs/myStuffToDo .

## link notes
notes=(
2019-goals
dev-kafka-notes
druid-tutorials-notes
dulles-analytics
kafka-loadtest-notes
kafka-server-filter
kafka-tasks
kafka-upgrade-notes
kafka_notes
on-going-tasks
separate-python-config-from-packer
screwdriver-notes
targetting-druid-notes
yinst-notes
)
for note in "${notes[@]}"; do
    ln -s notes/"$note" .
done


# link miscellaneous 
# commented below 2 lines on 09/30/2019
#ln -s ../jmx-metrics .
#ln -s ../keystores .

## link previous week tasks
if [ "$days_shift" -lt "7" ]; then
    (( days_diff=7-days_shift ))
    prev_week=$(date -v-"${days_diff}"d +%m%d)
else
    (( days_diff=days_shift-7 ))
    prev_week=$(date -v+"${days_diff}"d +%m%d)
fi

ln -s ../week-"$prev_week"/tasks prev.tasks

## link DMP/CMP related notes
## ln -s notes/cmp_api_notes .

CURRENT_DIR=$(pwd)
echo "$CURRENT_DIR"
ls -al

