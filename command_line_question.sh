#!/bin/bash

wget https://adm2022.s3.amazonaws.com/instagram_posts.zip
unzip instagram_posts.zip
wget https://adm2022.s3.amazonaws.com/instagram_profiles.zip
unzip instagram_profiles.zip

cat instagram_posts.csv | awk 'length($8) > 100 && !seen[$4]++' | head -10 > top10profiles.csv

awk '{
if($2 != -1)
{
print $4,"\n"
}
else
{
print "User not found", "\n"
}
 
}' top10profiles.csv
~                    