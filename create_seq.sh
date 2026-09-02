echo "SampleID,Coverage,Reads,GCcontent,Sex,Platform" > sequencing-data.csv

for i in {1..1000}
do
    gc=$((RANDOM%20+30))

    if (( RANDOM % 2 )); then
        sex="M"
    else
        sex="F"
    fi

    if (( RANDOM % 2 )); then
        platform="Illumina"
    else
        platform="Nanopore"
    fi

    echo "S$i,$((RANDOM%40+10)),$((RANDOM*1000)),$gc,$sex,$platform" >> sequencing-data.csv
done
