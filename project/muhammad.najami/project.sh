#!/bin/bash

read -p "Enter Doctor name:" Doctor_Name
read -p "Enter the ID:" id
read -p "Enter the course name:(One of them(IT403,ENG202,CSC201,MTH102,CLT201)" course_name
read -p "Enter your Final grade:" grade
read -p "Enter number of credits the student take" credit #every course have 3 credits

if ((course_name !=IT403 ||ENG202||CSC201||MTH102||CLT201));then
echo"Invalid COURSE"
fi
if ((grade >= 60));then
 echo "Congradulation you passed this course $course_name"

	if((course_name == IT403));then
	 echo "The available corses:(CSC305)"
	elif((course_name == ENG202));then
	 echo "The available corses:(CSC499,ENG308)"
	elif((course_name == CSC201));then
	 echo "The available corses:(CSC202,CSC303,)"
	elif((course_name == MTH102));then
	 echo "The available corses:(MTH203,CSC308,MTH301,MTH201)"
	elif((course_name == CLT201));then
	 echo "The available corses:(CLT202)"
	fi
fi

if((grade >=95));then
	echo "A+"
elif((grade >=90));then
        echo "A"
elif((grade >=85));then
        echo "B+"
elif((grade >=80));then
        echo "B"
elif((grade >=75));then
        echo "C+"
elif((grade >=70));then
        echo "C"
elif((grade >=65));then
        echo "D+"
elif((grade >=60));then
        echo "D"
else
	echo "F"
fi
c=3
total_grade=0
newGrade=$(echo "scale=2; $grade *4 / 100" |bc)
echo "$newGrade"
totalgrade=$(echo "scale=2; $newGrade *3" |bc)
echo "$totalgrade"
gpa=$(echo "scale=2; $totalgrade / $credit" |bc)
echo "The GPA is: $gpa"
