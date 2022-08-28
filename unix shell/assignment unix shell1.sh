file=$1
extract=$(cat $file | tail -n +2 | cut -d ',' -f3 | uniq)
for d in $extract
do
    $ d=$(echo $d | tr ' ' '\n' | sort -nu)
echo $d
fi
done
exit 0