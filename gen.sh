#!/bin/bash
read -p "Enter the title: " title 
read -p "Enter which folder you want to put in (relative to '_post/'): " fld
# delete trailing slash if there is any
Folder=`echo $fld | sed -e 's#/$##'`
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
echo "toc: true" >> $filename
echo "---" >> $filename
echo "" >> $filename
if [ -z "${Folder}" ]
then
mv $filename _posts/$filename
vim _posts/$filename
else
mv $filename _posts/$Folder/$filename
vim _posts/$Folder/$filename
fi
