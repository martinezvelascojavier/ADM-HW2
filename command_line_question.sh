#!/bin/bash

wget https://adm2022.s3.amazonaws.com/instagram_posts.zip
unzip instagram_posts.zip
wget https://adm2022.s3.amazonaws.com/instagram_profiles.zip
unzip instagram_profiles.zip

#First we create a new file containing the first ten rows in the instagram_posts.csv in which the description column contains more that 100 characters 'length($8) > 100'
#But we ommit those lines in which the comments are the same '!seen[$8]++'

cat instagram_posts.csv | awk 'length($8) > 100 && !seen[$8]++' | head -10 > top10profiles.csv

#Finally we print their ids, and if their sid_profile is -1 ($2 != -1) it means they are not in instagram_profiles.csv, so we output "user not found"
#However, within this ids, all the users are in instagram_profiles.csv. 
#After testing our code, we learned that the first id that would output a "User not found" would appear if we print the top 80 users, instead of top 10.

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
                   
