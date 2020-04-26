DIR=$1

FILES=$(find $DIR -type f -name '*.cpp')
FILESHEAD=$(find $DIR -type f -name '*.h')
FILEC=$(find $DIR -type f -name '*.c')
FILEHPP=$(find $DIR -type f -name '*.hpp')

ALL_FILES="$FILES $FILESHEAD $FILEC $FILEHPP"

for f in $FILES
do
    if test -f $f; then
        #CHARSET="$( file --mime-encoding "$f"| awk -F ": " '{print $2}')"
        #if [ "$CHARSET" != utf-8 ]; then
        #    sh -c "iconv -f $CHARSET -t UTF-8 $f > $f.temp"
        #    mv -f "$f.temp" $f
        #fi
		sh -c "iconv -f GBK -t UTF-8 $f > $f.temp"
		mv -f "$f.temp" $f
		#echo $f
    else
        echo -e "\nSkipping $f - it's a regular file";
    fi
done
