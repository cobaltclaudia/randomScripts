file="$1"
#echo "this is the file: $file"
while read -r link titleName; 
do streamlink --stdout $link  best | ffmpeg -i pipe:0 $titleName
echo "running streamlink --stdout $link  best | ffmpeg -i pipe:0 $titleName"
if ! streamlink --stdout $link  best | ffmpeg -i pipe:0 $titleName; then
    echo "command returned an error"
fi 
done <$file
