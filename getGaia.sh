#!/bin/bash -v

get3lastchar()
{
  echo $1 | grep -o '.\{3\}$'
  return 0
}

getAndUnpack()
{
  filename=GaiaSource_"$(get3lastchar $1)"-"$(get3lastchar $2)"-"$(get3lastchar $3)".csv.gz
  wget http://cdn.gea.esac.esa.int/Gaia/gdr1/gaia_source/csv/$filename; gzip -d $filename
  return 0
}

for (( k=1000; k<=$(expr $1 + 1000); k++))
do
  for (( j=1000; j<=$(expr $2 + 1000); j++))
  do
    for (( i=1000; i<=$(expr $3 + 1000); i++ ))
    do
      getAndUnpack $k $j $i
    done
  done
done

echo "Done"
exit 0
