# Intro to Bash and Python
## Directories and Navigation
* Directory is the equivalent to folders. Your working directory is where you are currently in the computer/server.
  * To get the path to your working directory use the print working directory command `pwd`.
* Linux has a set of pre-installed programs (like pwd) that are very efficient in their functionality and run-time. You call the programs using their commands.
* To stop a program while it is running, enter "ctrl c". Note that this is very useful if your program enters a loop, has wrong syntax for the call, or is simply taking too long and you need to be somewhere else.
* To learn more about the commands you can use the command `man`.
For example, to learn more about the functionality and options of pwd, enter the command: `man pwd`.
This displays a page that has a description of the program as well as the options you can utilize with it.
Now press "q" to quit.
---------------------------------------------------------------
### Relative Paths and Absolute Paths
#### Set-up
* We will be making three directories ubic1, ubic2, and ubic3.
* To make a directory, use the make directory command `mkdir`. mkdir uses the first variable as the name of the directory to be created.
Therefore, our command will be: `mkdir ubic1`.  
Now repeat the process for ubic2, and ubic3
* To see if the directory was created we can check what is in the current directory using the ls command: `ls`.  
_Note: ls has many options that can be used to see hidden files and file information. Highly recommend looking at man ls._
* To move into the new directory we use the change directory command: `cd`. Similarly to mkdir, the first variable is the name of the directory you would like to move into.
Therefore, the command is: `cd ubic1`.  
_Use `pwd`  to verify that you are in the new directory._

#### Now that set-up is complete
##### Relative Paths
* The current directory can be referenced as **"."** and the parent directories can referenced as **".."**

* So the directory /home/linux/ieng6/oce/5g/spetrus/ubic1  
  Looks like ../../../../../../.  
So to go to the parent directory  
from /home/linux/ieng6/oce/5g/spetrus/ubic1  
To  
/home/linux/ieng6/oce/5g/spetrus  
the command is:
`cd ..`

* To go from  
/home/linux/ieng6/oce/5g/spetrus/ubic1  
to /home/linux/ieng6/oce/5g/  
the command is: `cd ../../`

* To go from  
/home/linux/ieng6/oce/5g/spetrus/ubic1  
to /home/linux/ieng6/oce/5g/spetrus/ubic2  
The command is: `cd ../ubic2`

##### Absolute Paths
* You can use a hard link to reference directories and file.
* A hard link has the same format as what is printed by `pwd`.
* To go from **any directory**  
to /home/linux/ieng6/oce/5g/spetrus/ubic1  
the command is: `cd /home/linux/ieng6/oce/5g/spetrus/ubic1`.  
_It is very important to include the forward slash "/" to the beginning of the directory._
* If you're not sure where your program will be launching from or you are referencing a file that is much further than the one you are currently in, it is easier and more reliable to use hard links.
------------------------------------------------------------------------
## Autocomplete
#### Set-up
* We will need to download some files to demonstrate how the autocomplete functionality.  
##### wget
* We will use wget to download files
* Use this command to download the example files to follow along:  
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example1.name.txt`  
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example2.name.txt`  
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example3.name.txt`
* wget downloads files to the current directory.  
_Use `ls` to see if the files have been downloaded._
##### curl
* cURL can also be used to download the files.
* cURL outputs what is in the link onto the terminal. So we will need to redirect the output to a file to save it.
###### Redirecting
  * To redirect the output of a program into a file you use the greater sign **">"** after the command and the name of the file you would like to write the output to after the sign, as such:  
`pwd > example1.txt`  
If you wish to append to a file you use **">>"** instead.
* Combining cURL with redirecting, we get:  
`curl https://raw.githubusercontent.com/semarpetrus/ubic/master/example1.name.txt > example1.name.txt`  
`curl https://raw.githubusercontent.com/semarpetrus/ubic/master/example2.name.txt > example1.name.txt`
`curl https://raw.githubusercontent.com/semarpetrus/ubic/master/example3.name.txt > example1.name.txt`

#### Now that set-up is complete
* Linux has an autocomplete function that will autocomplete the names of folders, files, and programs.  
Type `ls example1.`  
Press **Tab**  
And Linux will complete the rest of the file name for you.

* If there are more than one file beginning with what you typed then it will not autocomplete but if you press Tab again, it will list the options.  
Type `ls example`  
Press **Tab**  
Press **Tab** again

-------------------------------------------------------------------

## The Wildcard  "*"
* We can use **"*"** as a filler to select more than one file with specific attributes, for example:  
If we want all the files that have a "txt" extension, the command would be:
`ls *.txt`

------------------------------------------------------------------
## Exploring Files
* This Section will cover ways to view the content of a file without opening it in an editor.

* Use wget or cURL to download the file from:  
https://raw.githubusercontent.com/semarpetrus/ubic/master/anno.noid.out  
Name the output file **man.example.out**  
_Use `man wget` to see how you can output to a specific file._  
_Use ls to see if the file has been downloaded._
##### head
Display the first lines of the file.
head -n10 man.example.out
-n option specifies the number of lines to be displaced
This command will display the first 10 lines
##### tail
Display the last lines of the files.  
`tail -n10 man.example.out`  
-n option specifies the number of lines to display  
This command will display the last 10 lines
##### more
Display a block of the file.  
`more man.example.out`  
`more` will start at the start of the file and you can use the space bar to move down the file.  
Press **q** to exit
##### less
Display a block of the file.  
`less man.example.out`  
`less` will start at the start of the file and you can use the space bar to move down the file.  
Press **q** to exit.  
_More and Less operate very similarly, but more writes the content to the terminal and less writes to a separate window that you need to quit. When you exit more, the file content will still be on the terminal and you can scroll back to see it, but with less you can't see the content once you've exited_
##### cat
Write the  entire content of the file to the terminal.  
`cat man.example.out`  
`cat` will display the entire the content of the file on the terminal.
--------------------------------------------------------------

## Quick Analysis
#### Set-up
* For this section we will be using these four programs
##### Word Count
`wc`  
Options:  
-c : count character  
-w : count words  
-l : count line
##### Cut
`cut`  
Cuts each line at a delimiter
Options:
-f# : selects the # field
-d : specifies the delimiter (Default is tab)
So the command:
cut -d ',' -f3 filename
If the filename contents look like this:
A,B,C,D
It would display
C
##### sort
`sort`  
Sorts the lines of the file.  
Options:  
-n : sorts the file numerically. By default the program sorts alphabetically which means that it would sort 20 as more than 100 because it would read the 2 and compare it to the 1 and determine that it is higher than the 1. Numerically would sort 20 as less than 100.  
-r : reverse the order of the sorting.
##### unique
`uniq`  
It keeps one copy of duplicated lines. `uniq` does not compare a line to the rest of the lines in the file, instead it compares the line to the next line.  
Therefore, in order to apply the function to the whole file we need to sort it alphabetically first.  
Options:  
-c : counts the number of occurrences of the lines.
##### Piping
In Linux you can chain programs into one command using **"|"** . By that I mean you could, in a single command, run your file through one program and take the output if that program and pipe it through to another program.  
For example, since `uniq` needs the similar lines to be consecutive, we can `sort` the file first, so our command would be:  
`sort filename | uniq`

#### Now that set-up is complete

* If you use `head` to look at the header of the **man.example.out**, you will see that the file consists of:  
Type	| Score |	PPV |	Id |	desc  
:---:|:---:|:---:|:---:|:---:  
Description (desc) in this case is more verbose and can give us a better idea of what we're looking at.
Our objective is to see how many of each description there is.

* First thing we need to do is isolate the description and we will do that using `cut`.  
We will select the 5th column which contains the descriptions:  
`cut -f5 man.example.out`  
Now we need to use `uniq` to count the number of unique descriptions, but as we have said before they need to be sorted first, so we `sort` first:  
`cut -f5 man.example.out | sort`  
Not that we have a sorted list of descriptions we will use `uniq`:  
`cut -f5 man.example.out | sort | uniq -c`  
This will give us a list of the descriptions and how many each has occurred.

* Let's say we want to see the **top 5 most frequent descriptions**  
We take the command we had and we `sort` **numerically** in **reverse**:   
`cut -f5 man.example.out | sort | uniq -c | sort -rn`  
Now we have a list of descriptions sorted by frequency with the most frequent being on top.  
To view the top 5 we will use `head` with the option **-n**:  
`cut -f5 man.example.out | sort | uniq -c | sort -rn | head -n5`  
Now let's write the results to a file we will call **man.example.top_5.out**:  
`cut -f5 man.example.out | sort | uniq -c | sort -rn | head -n5 > man.example.top.out`  
# AND THERE YOU HAVE IT!
