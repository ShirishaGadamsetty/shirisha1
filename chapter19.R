#R : CHARACTER FUNCTIONS
#1. Convert object into character type
Y = as.character(25)
class(Y)
#2. Check the character type
x = "I love R Programming"
is.character(x)
#3. Concatenate Strings
#Paste Function Syntax(paste (objects, sep = " ", collapse = NULL))
#Example 1
x = "siri"
y ="sathya"
paste(x, y)
paste(x, y, sep = ",") 
#Example 2 : To create column names from x1 through x10
paste("x", seq(1,10), sep = "")
#Example 3 : Use of 'Collapse' keyword
paste("x", seq(1,10), sep="", collapse=",")
#4. String Formatting
#Sprintf Function Syntax //sprintf(fmt, ...)
x = 0.25
sprintf("%.0f%%",x*100)
#Other Examples
a = seq(1, 5)
sprintf("x%03d", a)
#The letter 'd' in the format is used for numeric value.
sprintf("%s has %d rupees", "Ram", 500)
#5. Extract or replace substrings
#substr Syntax - substr(x, starting position, end position)
x = "abcdef"
substr(x, 1, 3)
#Replace Substring - substr(x, starting position, end position) = Value
substr(x, 1, 2) = "b"
x
#6. String Length
x = "I love R Programming"
nchar(x)
#7. Replace the first match of the string
#sub Syntax - sub(sub-string, replacement, x, ignore.case = FALSE)
sub("okay", "fine", "She is okay.")
#Let's replace all values of a vector
cols = c("x1", "x2", "x3")
sub("x", "Year", cols)
#8. Extract Word from a String
#Word Function Syntax (Library : stringr)
#word(string, position of word to extract, separator) 
x = "I love R Programming"
install.packages("stringr")
library(stringr)
word(x, 1,sep = " ")
#Extract Last Word
word(x, -1,sep = " ")
#9. Convert Character to Uppercase / Lowercase /Propercase
#Examples
tolower(x)
#The tolower() function converts letters in a string to lowercase.
toupper(x)
#The toupper() function converts letters in a string to uppercase.
str_to_title(x)
#10. Remove Leading and Trailing Spaces
trimws(x, which = c("both", "left", "right"))
a = " sirisai "
trimws(a)
str_trim(a)
#11. Converting Multiple Spaces to a Single Space
install.packages("qdap")
library(qdap)
Trim(clean(x))
#12. Repeat the character N times
strrep("x",3)
#13. Find String in a Character Variable
x = c("Aon Hewitt", "Aon Risk", "Hewitt", "Google")
library(stringr)
str_detect(x,"Aon")
#14. Splitting a Character Vector
x = c("I love R Programming")
strsplit(x, " ")
#15. Selecting Multiple Values
x = sample(LETTERS,100, replace = TRUE)
x[x %in% c("A","B","C")]
#16. Pattern Matching
x = c("siri", "sravs", "sathya", "nag", "chandu")
#1. Keeping characters starts with the letter 'D'
x[grepl("^D",x)]
#To make it case-insensitive, we can add (?i) before ^D.
x[grepl("(?i)^d",x)]
#2. Keeping characters do not start with the letter 'D'
x[!grepl("(?i)^d",x)]
#3. Keeping characters end with 'S'
x[grepl("s$",x)]
#4. Keeping characters contain "S"
x[grepl("(?i)*s",x)]





## various formats of pi :

sprintf("%f", pi)
sprintf("%.3f", pi)
sprintf("%1.0f", pi)
sprintf("%5.1f", pi)
sprintf("%05.1f", pi)
sprintf("%+f", pi)
sprintf("% f", pi)
sprintf("%-10f", pi) # left justified
sprintf("%e", pi)
sprintf("%E", pi)
sprintf("%g", pi)
sprintf("%g",   1e6 * pi) # -> exponential
sprintf("%.9g", 1e6 * pi) # -> "fixed"
sprintf("%G", 1e-6 * pi)


## no truncation:
sprintf("%1.f", 101)

## re-use one argument three times, show difference between %x and %X
xx <- sprintf("%1$d %1$x %1$X", 0:15)
xx
xx <- matrix(xx, dimnames = list(rep("", 16), "%d%x%X"))
xx
noquote(format(xx, justify = "right"))
