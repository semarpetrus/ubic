# Intro to Bash and Python
## To Start
* We'll start with a simple term: Directory. Directory is the equivalent to folders. Your working directory is where you are currently in the computer/server. To get the path to your working directory use the command `pwd`
* Linux has a set of pre-installed programs (like pwd) that are very efficient in their functionality and run-time. You call the programs using their commands. 
* To stop a program while it is running, enter "ctrl c". Note that this is very useful if your program enters a loop, has wrong syntax for the call, or is simply taking too long and you need to be somewhere else.
* To learn more about the commands you can use the command `man`
For example, to learn more about the functionality and options of pwd, enter the command: `man pwd`
This displays a page that has a description of the program as well as the options you can utilize with it.
Now press "q" to quit.
--------------------------------------------------------------------------------------------------------

### Next we will make three directories called ubic1, ubic2 and ubic3.
* To make a directory, use the command mkdir. mkdir uses the first variable as the name of the directory to be created.
Therefore, our command will be: `mkdir ubic1`
Now repeat the process for ubic2, and ubic3
* To see if the directory was created we can check what is in the current directory using the ls command: `ls`.
_Note: ls has many options that can be used to see hidden files and file information. Highly recommend looking at man ls._
* To move into the new directory we use the change directory command: `cd`. Similarly to mkdir, the first variable is the name of the directory you would like to move into.
Therefore, the command is: `cd UBIC1`


Use `pwd`  to verify that you are in the new directory.

---------------------------------------------------------------------------------------

The current directory can be referenced as "."
And the parent directories can referenced as ".."

So the directory
/home/linux/ieng6/oce/5g/spetrus/ubic1

Looks like
../../../../../../.

So to go to the parent directory 
from /home/linux/ieng6/oce/5g/spetrus/ubic1 
To
/home/linux/ieng6/oce/5g/spetrus 
the command is:
`cd ..`

And to go 
from
/home/linux/ieng6/oce/5g/spetrus/ubic1
 to 
/home/linux/ieng6/oce/5g/
the command is:
`cd ../../`

from
/home/linux/ieng6/oce/5g/spetrus/ubic1
To
/home/linux/ieng6/oce/5g/spetrus/ubic2
The command is:
`cd ../ubic2`

Hard links:
You can use a hard link to reference directories and file.
A hard link has the same format as what is printed by pwd

To go from any directory
To
/home/linux/ieng6/oce/5g/spetrus/ubic1
the command is:
`cd /home/linux/ieng6/oce/5g/spetrus/ubic1`
It is very important to include the forward slash to the beginning of the directory.

If you're not sure where your program will be launching from or you are referencing a file that is much further than the one you are currently in, it is easier and more reliable to use hard links.
----------------------------------------------------------------------------------------------

### wget
We will use wget to download files
Use this command to download the example files to follow along:
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example1.name.txt`
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example2.name.txt`
`wget https://raw.githubusercontent.com/semarpetrus/ubic/master/example3.name.txt`

wget downloads files to the current directory.

Use `ls` to see if the file has been downloaded


-------------------------------------------------------------------------------------------

## Autocomplete
Linux has an autocomplete function that will autocomplete the names of folders, files, and programs.
Type "ls example1."
Press Tab
And Linux will complete the rest of the file name for you.

If there are more than one file beginning with what you typed then it will not autocomplete but if you press Tab again, it will list the options.
Type
"ls example"
Press Tab
Press Tab again


## The use of  "*"
We can use "*" as a filler to select more than one file with specific attributes, for example:
If we want all the files that have a "txt" extension, the command would be:
ls *.txt

--------------------------------------------------------------------------------------------------------------

## View
The next Section will cover ways to view the content of a file without opening it in an editor.

Use wget to download the file from:
https://www.dropbox.com/s/ljalt0yk0b1ua84/anno.noid.out
And use the -O option to name the output file "man.example.out"
Use ls to see if the file has been downloaded

**head**
Display the first lines of the file
head -n10 man.example.out 
-n option specifies the number of lines to be displaced
This command will display the first 10 lines 

**tail**
Display the last lines of the files
tail -n10 man.example.out
-n option specifies the number of lines to display
This command will display the last 10 lines

**more**
Display a block of the file.
more man.example.out
"More" will start at the start of the file and you can use the space bar to move down the file
Press q to exit

**less**
Display a block of the file.
less man.example.out
"Less" will start at the start of the file and you can use the space bar to move down the file
Press "q" to exit

_More and Less operate very similarly, but more writes the content to the terminal and less writes to a separate window that you need to quit. When you exit more, the file content will still be on the terminal and you can scroll back to see it, but with less you can't see the content once you've exited.

**cat**
Write the  entire content of the file to the terminal.
cat man.example.out
Will display the entire the content of the file on the terminal.
--------------------------------------------------------------------------------------------------------------

Writing to files
To write the output of a program into a file you use the greater sign ">" after the command and the name of the file you would like to write the output to after the sign, as such:
head man.example.out > man.example2.out
If you wish to append to a file you use ">>" instead:
tail man.exmaple.out >> man.example2.out
Now the file man.example2.out contains the first and the last 10 lines of example.out
--------------------------------------------------------------------------------------------------------------

For this section we will be using these four programs 

wc
Word count
Options:
-c : count character
-w : count words
-l : count line

cut
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

sort
Sorts the lines of the file
Options:
-n : sorts the file numerically. By default the program sorts alphabetically which means that it would sort 20 as more than 100 because it would read the 2 and compare it to the 1 and determine that it is higher than the 1. Numerically would sort 20 as less than 100.
-r : reverse the order of the sorting.

uniq
It keeps one copy of duplicated lines. uniq does not compare a line to the rest of the lines in the file, instead it compares the line to the next line. Therefore, in order to apply the function to the whole file we need to sort it alphabetically first. 
Options:
-c : counts the number of occurrences of the lines.

Piping
In Linux you can chain programs into one command using "|" . By that I mean you could, in a single command, run your file through one program and take the output if that program and pipe it through to another program.For example, since uniq needs the similar lines to be consecutive, we can sort the file first, so our command would be:sort filename | uniq
-------------------------------------------------------------------------------------------

Analysis
Now let's use these programs and piping to run a simple analysis on man.example.out

If you use head to look at the header of the man.example.out, you will see that the file consists of
Type	Score	PPV	Id	desc
Description (desc) in this case is more verbose and can give us a better idea of what we're looking at.
Our objective is to see how many of each description there is.

First thing we need to do is isolate the description and we will do that using cut. We will select the 5th column which contains the descriptions:
cut -f5 man.example.out
Now we need to use uniq to count the number of unique description, but as we have said before they need to be sorted first, so we sort first:cut -f5 man.example.out | sort
Not that we have a sorted list of descriptions we will use uniq:
cut -f5 man.example.out | sort | uniq -c
This will give us a list of the descriptions and how many each has occurred.

Let's say we want to see the top 5 most frequent descriptions
We take the command we had and we sort numerically in reverse: 
cut -f5 man.example.out | sort | uniq -c | sort -rn
Now we have a list of descriptions sorted by frequency with the most frequent being on top. To view the top 5 we will use head with the option "n":
cut -f5 man.example.out | sort | uniq -c | sort -rn | head -n5
Now let's write the results to a file we will call man.example.top.out
cut -f5 man.example.out | sort | uniq -c | sort -rn | head -n5 > man.example.top.out
----------------------------------------------------------------------------------------

DIY

Download this file:
https://www.dropbox.com/s/r68krzzq3zghprw/DIY1.tsv

The file is divided into
embl-cds:ABO13260       C5CGP2  Glycolysis / Gluconeogenesis, Carbohydrate metabolism   link

Our target is to find the top 7 most frequent pathways (in red).
