# $1: input file path
# $2: cutoff
# $3: first output
# $4: second output
IFS=
file_content=$(zcat $1)
headers=$(echo $file_content | grep '>')
IFS=$' \t\n'
for header in $headers
do
  IFS=
  seq=$(echo $file_content | grep -A1 $header | tail -n1)
  seq_len=$(echo $seq | wc -c)
  if [[ $seq_len -le $2 ]]
  then
    echo $header >> $3
    echo $seq >> $3
  else
    echo $header >> $4
    echo $seq >> $4
  fi
done
