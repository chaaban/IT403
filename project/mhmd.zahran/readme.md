# File Organizer
This script is a file organizer designed to automatically sort 
files into different directories based on their file types.
It helps in organizing a target directory by creating separate
subdirectories for different file types such
 as Images, Documents, Videos, and Others.

## Usage
Update the target_dir variable to specify the directory that
you want to organize.

Run the script using the Bash interpreter.

+ Enter The nano for the scripit & put the path of the file you want sort
+ bash file-organizer.sh

## Description
+ The script starts by defining the target directory that needs to be organized.
Update the

```
target_dir 
```
  variable with the path to your desired directory.

   It then creates subdirectories named

   "Images", "Documents", "Videos", and "Others"

   within the target directory, if they don't already exist. 

   These subdirectories will be used to categorize the files based on their types.


+ The script iterates over each file in the target directory using a 
```
for
```
 loop

+ For each file, it checks if it's a regular file using the 
```
[ -f "$file" ] 
```
 conditional statement.

+ If it's a regular file, it extracts the file extension using the 
```
"${file##*.}
```
 parameter expansion. This is used to determine the type of the file.

+ Based on the file extension, the script uses a 
```
case
```
  statement to match the file type and move the file to the corresponding subdirectory.
  Images are moved to the "Images" directory, documents to the
  "Documents" directory, videos to the "Videos" directory, and any other file types to the "Others" directory.

+ Once all files have been processed, the script displays the message
```
"File Organization complete!".
```

