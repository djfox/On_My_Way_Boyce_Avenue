#/bin/sh
lilypond -o pdf/ On_My_Way.ly
find . -not -name "On_My_Way.ly" -name "*.ly" -exec lilypond -o pdf/parts/ {} \;
rm pdf/*.ps pdf/*.midi pdf/parts/*.ps pdf/parts/*.midi
