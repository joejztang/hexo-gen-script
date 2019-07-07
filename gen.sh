#!/bin/bash
read -p "Enter the title: " title 
Title=`echo $title | tr -d '[:punct:]'`
dashedTitle=""
for word in $Title
do
if [ -z "${dashedTitle}" ]
then
  dashedTitle=${word}
else
  dashedTitle=${dashedTitle}-${word}
fi
done
# bash 4.2 and above
filename="${dashedTitle}.md"
touch $filename
echo "---" >> $filename
# echo "published: true" >> $filename
# echo "layout: post" >> $filename
echo "title: \"${title}\"" >> $filename
# echo "author: Yu" >> $filename
echo "date: `date +%Y-%m-%d` `date +%T`" >> $filename
echo "categories:" >> $filename
echo "tags:" >> $filename
# echo "-" >> $filename
echo "updated:" >> $filename
echo "---" >> $filename
echo "" >> $filename
mv $filename _posts/$filename
