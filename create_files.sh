for i in {01..20}
do
    echo "This is file $i" > ./globbing-files/file_$i.txt
    touch ./globbing-files/figure_$i.png
done
