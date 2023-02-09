# Assignment 1
# File Stat script due 2/8 EOD
#
# This bash script will:  List all the files in a given directory,
#   along with file sizes and last modification date
#    This script will recurse all subdirectories of the directory
#  This script will take as input a directory name to parse,
# If directory name is not given, user is prompted to enter a directory name
# Output goes into output.txt
#!/bin/bash

# Make sure just one outputFile.txt, in current directory
outputFile=`pwd`"/outputFile.txt"
#echo "Output file is " $outputFile
echo "Filename                         Size                       Last Modified" > "${outputFile}"
echo "========	                =========		    ===========" >> 	"${outputFile}"					
# First check that a directory name was given on command line,
if [ -d "${1}" ] 
then
	echo "Parsing directory: ""${1}"
else
	echo $1 " is not a proper directory"
	echo "Try again. Enter a directory name as an argument"
	echo "Example:"
	echo "./file_stat.sh <directory name to search>"
	exit

fi
	
# Go to the given directory and start search
cd "${1}"
# Create an input file of all the files to list
inputFile=`pwd`/tempFile
# Create an indexed array of the files in directory
find $PWD -type f > tempFile # Create a temp file of the found files
 
 while read line
 do
	#List out each file and its info
	#ls -XlrH "${line}" >>  "${outputFile}";
	#stat -c "%n %s %x"  "${line}" >>  "${outputFile}";
	stat --printf='%n  %s  %x \n' "${line}" >>  "${outputFile}";
	
done < "${inputFile}"
rm "${inputFile}"   # Remove the temp input file
echo "Output can be found in file: "${outputFile}
