#!/bin/bash

########################################################################
# 
# homework4.sh.pseudocode - MNXB11-2024 Homework 4
#
# Author: Florido Paganelli florido.paganelli@hep.lu.se
#
# Description: This script 
#              - Takes as input a list of URLs to some websites
#              - Downloads each URL into an input_N file using wget, 
#                where N is the position of the link in the list, starting from 1
#              - Checks whether the downloaded file is a pdf or not. 
#                   - If it is a PDF, moves it into a "PDF" folder 
#                     and adds the .pdf extension, for example
#                     PDF/input_1.pdf
#                   - If it is **not** a PDF, moves it into a "notPDF" folder 
#                     for example:
#                     notPDF/input_1
#
# Example usage:
#        ./homework4.sh 'https://canvas.education.lu.se/files/4047200/download?download_frd=1' 'https://github.com/floridop/MNXB11-BASH/blob/main/README.md'  http://www.hep.lu.se
#
# Note: The slide numbers in the pseudocode below refer to Tutorial4
#       unless otherwise stated.
#
########################################################################

#### Evaluation of the score ######################################
# 
# The script submitted must run without any further editing by the teacher.
#
# The teacher can test passing any parameter so do not expect the
# input parameters to be the same as examples. Test your code with different
# input parameters before submitting!
#
# The maximum points for this homework is 19 points, divided in 10 Exercises.
# Each Exercise shows how many points it yields.
# 
# I will grade the homework based on this scale:
# Score 0-4: Grade 1, failed, not acceptable
# Score 5-9: Grade 2, poor, needs improvement
# Score 10-13: Grade 3, acceptable solution, a pass
# Score 14-17: Grade 4, good, mostly complete, with some shortcomings
# Score 18-19: Grade 5, excellent
#
# Half points might be awarded depending on the submission.
#
# Resubmission rules follow the page at
# https://canvas.education.lu.se/courses/24805/pages/grading-scheme-and-deadlines?module_item_id=912201
#
# The deadline is on Canvas.
#
########################################################################

### BEGIN: Functions - DO NOT MODIFY THE FUNCTION CODE ########

usage(){
   echo "   usage: $0 URL1 URL2 URL3 ..."
   echo "   Example:"
   echo "   $0 'https://canvas.education.lu.se/files/4047200/download?download_frd=1' 'https://github.com/floridop/MNXB11-BASH/blob/main/README.md'  http://www.hep.lu.se"
}

#### END: Functions - DO NOT MODIFY ABOVE CODE ########

if [[ $# -lt 1 ]]; then
   usage
   exit 1
fi

URLS=("$@")

mkdir -p PDF
mkdir -p notPDF

COUNT=1

for url in "${URLS[@]}"; do
    CURRENTINPUTFILE="input_$COUNT"
    
    echo "Processing url $COUNT $url"
    
    wget -a wget.log -O "$CURRENTINPUTFILE" "$url"
    
    if [ $? -eq 0 ]; then
        FILE_TYPE=$(file "$CURRENTINPUTFILE" | grep "PDF")
        
        if [ $? -eq 0 ]; then
            echo "File $CURRENTINPUTFILE is a PDF, Moving to directory PDF..."
            mv "$CURRENTINPUTFILE" "PDF/$CURRENTINPUTFILE.pdf"
        else
            echo "File $CURRENTINPUTFILE is not a PDF, moving to directory notPDF..."
            mv "$CURRENTINPUTFILE" "notPDF/$CURRENTINPUTFILE"
        fi
    else
        echo "Download of $CURRENTINPUTFILE failed, skipping..."
        rm -f "$CURRENTINPUTFILE"
    fi
    
    COUNT=$(( $COUNT + 1 ))

done
