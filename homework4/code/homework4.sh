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

# In the code that follows you're required to substitute the string YOUR_CODE_HERE 
# with code your write. It can be substituted with multiple lines of code as long
# as it performs the requested task.

# E1 (2 points) Test that there is at least 1 parameter passed to the script,
## otherwise exit with error (make sure that the exit code is not 0!)
## Printout the usage information using the provided `usage` function
## Hints: Use the information at Tutorial 4 slides: 41, 44, 47, 55, Ex4.14, 62
if YOUR_CODE_HERE then
   echo "Missing parameters. Exiting..."
   YOUR_CODE_HERE
fi

# E2 (1 point) Store all parameters into the following variable URL
## The script should be able to handle any number of parameters allowed by bash.
## This means I will test your code with any random number of input URLs possible.
## Choose the proper predefined variable to use according to tutorial 4
## Slides: 44 and exercise 4.11
## See this page about Positional Parameters: https://tldp.org/LDP/abs/html/internalvariables.html
URLS=YOUR_CODE_HERE

# E3 (1 point) create the folders `PDF` and `notPDF` in the current directory
## Hint: you can create multiple directories with just one command.
## See tutorial 2 and 4 about how to create directories
YOUR_CODE_HERE

# Start download counter - DO NOT CHANGE THIS
COUNT=1

# Loop over the URLS
## E4 (1 point) Define the proper for code to scan all the URLs passed
## as arguments to the script. Reuse the URLS variable defined above and
## call the for running variable "url" 
## (see how it is used later in the messages provided)
## Hints: see Tutorial 4 slide 85 and exercise 4.22
for YOUR_CODE_HERE do
       
    # E5 (1 point) Create a filename for the downloaded file and place it in the
    # CURRENTINPUTFILE variable.
    ## The filename must be like: input_currentvalueofCOUNT
    ## For example: input_0 if COUNT is 0
    ## Hint: just use the COUNT variable and double quotes to create the filename
    CURRENTINPUTFILE=YOUR_CODE_HERE
    
    # Print out what is been processing - DO NOT CHANGE THIS
    echo "Processing url $COUNT $url"
    
    # E6 (3 points) Download the file pointed by the URL using wget.
    ## Use the append logfile option of wget to write the log of action wget is doing
    ## in a file called "wget.log"
    ## Save the downloaded file with name $CURRENTINPUT
    ## Hint: Find a suitable wget option that allows you to choose an output filename.
    ## Hints: See https://www.linuxandubuntu.com/home/12-practical-examples-of-wget-command-on-linux?expand_article=1 about
    ## selecting a filename and https://www.gnu.org/software/wget/manual/html_node/Logging-and-Input-File-Options.html
    ## to "append" to logfile. 
    YOUR_CODE_HERE
    
    # E7 (1 point) Test if the download was successful
    ## A successful download will make wget exit with exit status == 0
    ## Hint: use the special variable that contains the process exit value
    ## See Tutorial 4 slides 41, 45, 46 and also https://www.delftstack.com/howto/linux/bash-check-exit-code/
    if YOUR_CODE_HERE then
        
        # If the download is successful:
        
        # E8 (3 points) Determine if the downloaded file is a PDF
        ## - Use the `file` command to determine the kind of file downloaded
        ## - Pass the output of the above command to the `grep` command using a pipe `|`
        ## - Check using grep that the output of file contains the string "PDF"
        ## Hints: read about file in the Dataset.pdf document on canvas; about grep on Tutorial 4 slide 13 and manual
        ## page 49; about the pipe in Tutorial 4 slide 57-58.
        ## Test the commands and their pipe concatenation in the command line before
        ## adding to the script! 
        YOUR_CODE_HERE
        
        # E9 (5 points) Write an if..then..else that does the following:
        ## if condition: checks if the previous grep command was succesful. 
        ### This means the "PDF" string was found and hence that the downloaded file is a PDF.
        ## then: If grep was successful, write out a message as suggested below
        ### and move the file to the PDF folder with extension .pdf
        ## else: If grep was not succesful, it means the file is not a PDF,
        ### so write out a message as suggested below
        ### and move the file to the notPDF folder without any extension.
        ## perform any of the file move *after* printing out the suggested messages,
        ## so that you know that the move will happen after them message is shown
        ## Hints: Read Tutorial 4 slides 48-56 and do exercises 4.13-4.15. Use the exit values
        ## described in slides 45-47, review Tutorial 1 to learn how to move files.
        YOUR_CODE_HERE
            # then output message
            echo "File $CURRENTINPUTFILE is a PDF, Moving to directory PDF..."
            YOUR_CODE_HERE
        YOUR_CODE_HERE
            # else output message
            echo "File $CURRENTINPUTFILE is not a PDF, moving to directory notPDF..."
            YOUR_CODE_HERE
        YOUR_CODE_HERE
    else
       # If the download is not successful:
       
       # Skip the processing of the file since the download failed.
       echo "Download of $CURRENTINPUTFILE failed, skipping..."
       
       # E10 (1 point) Delete the current processed file $CURRENTINPUTFILE since
       ## the download failed, but wget may have written the file already
       ## leaving clutter
       ## Hints: see tutorial 1 on how to delete files
       YOUR_CODE_HERE
    fi
    
    # Increase the download counter - DO NOT CHANGE THIS
    COUNT=$(( $COUNT + 1 ))

# end of for    
done 
