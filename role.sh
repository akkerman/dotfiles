#!/bin/bash

role=$1

# roles/
#     $role/               # this hierarchy represents a "role"
#         tasks/            #
#             main.yml      #  <-- tasks file can include smaller files if warranted
#         handlers/         #
#             main.yml      #  <-- handlers file
#         templates/        #  <-- files for use with the template resource
#             ntp.conf.j2   #  <------- templates end in .j2
#         files/            #
#             bar.txt       #  <-- files for use with the copy resource
#             foo.sh        #  <-- script files for use with the script resource
#         vars/             #
#             main.yml      #  <-- variables associated with this role
#         meta/             #
#             main.yml      #  <-- role dependencies

OLDIFS=$IFS; IFS=',';

parts=(
    'tasks',true 
    'handlers',true 
    'templates',false 
    'files',false 
    'vars',true 
    'meta',true
)

for tuple in "${parts[@]}" 
do
    set $tuple; part=$1; hasMain=$2    
    printf -v dir "roles/%s/%s" $role $part
    printf -v file "%s/main.yml" $dir
    printf -v header "# file: %s" $file

    mkdir -p $dir

    if [ $hasMain ] 
        then
            echo "---" > $file
            echo $header >> $file
    fi
done

IFS=$OLDIFS