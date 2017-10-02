lpass ls | awk '{print $NF}' | sed 's/.$//' | \
    while read -r line; do
        echo "#------------------------------------------------#" >> lpassdump.txt
        lpass show $line >> output/lpassdump.txt
    done
