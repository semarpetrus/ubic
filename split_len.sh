# $1: input file path
# $2: cutoff
# $3: first output
# $4: second output
echo '' > $3
echo '' > $4
exec 5< $1
while read header <&5
do
  read seq <&5
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
