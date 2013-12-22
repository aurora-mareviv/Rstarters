##########################################
### COMMANDS TO START WITH R CONSOLE 2 ###
##########################################
# Under GNU-GPL license
 
# First, install R: http://cran.r-project.org/
# Second, install and open R-Studio: http://www.rstudio.com/ide/download/desktop
# You can open this text file from inside R-studio, or with a basic text editor (like Notepad).
 
# Just copy and paste the following commands, and press ENTER to see the results.
# You can recycle these commands to make new ones suitable for your own data!
# Note: the lines of text preceeded by "#" are considered comments, and they are not executed even if they are pasted.
 
# Install R Commander:
install.packages(Rcmdr)
# Execute R commander for first time in a session.
library(Rcmdr)
# To execute Rcmdr for second or more times (after being closed in a session):
Commander()
# To open a help page write ? and the name of the function.
?Rcmdr
?log
?boxplot
 
 
 
#############################
### IMPORT - EXPORT DATA ####
#############################
# We will use different packages (libraries) to import data.
# Important: read this link: http://cran.r-project.org/doc/manuals/r-release/R-data.html

# Note: you will have to choose your working directory (e.g. a folder named "My data")
# Then you need to change the working directory of R to that folder. For example:
setwd("C:/Users/Me/My Documents/.../My data")


####### 1. SPSS DATA ########
# We need to have our data in the .sav format, and store it in our folder.
# The following commands import data from SPSS to R format.
library(foreign)
mydata <- read.spss("somedata.sav", use.value.labels=T, to.data.frame=T)
?read.spss # help page about the function "read.spss" and its arguments/options
save(mydata, file="mydata.RData")
# You will need to review the data imported to make sure there are no inconsistencies.
# Some errors can be fixed in the SPSS file before importing.
names(mydata)
summary(mydata)
View(mydata)
fix(mydata)
# To change var1 from numeric to factor, just type:
mydata$var1 <- as.factor(mydata$var1)
# To return to numeric, type:
mydata$var1 <- as.numeric(mydata$var1)

# Save (overwrite) the corrected file
save(mydata, file="mydata.RData")


###### 2. EXCEL DATA ########
# You will need to review the data imported to make sure there are no inconsistencies.
# Some errors can be fixed in the Excel file before importing.
names(mydata)
summary(mydata)
View(mydata)
fix(mydata)
# To change var1 from numeric to factor, just type:
mydata$var1 <- as.factor(mydata$var1)
# To return to numeric, type:
mydata$var1 <- as.numeric(mydata$var1)

# In .XLS format (Excel 2003)

    # Option 1: use R Commander, from the Menu>>Data>>Import Data
    
    # Option 2: use gdata (can give errors if Perl modules are missing)
    library(gdata)
    mydata <- "C:/Users/Me/My Documents/.../My data/somedata.xls"
    mydata <- read.xls(mydata, sheet='name of my sheet')
    names(mydata)
    summary(mydata)
    View(mydata)
    fix(mydata)
    # Save the corrected file
    save(mydata, file="mydata.RData")

    # Option 3: XLConnect (can give errors if Java modules are missing)
    library(XLConnect, pos=4)
    .Workbook <- loadWorkbook("C:/Users/Me/My Documents/.../My data/somedata.xls")
    mydata <- readWorksheet(.Workbook, "Sheet1")
    remove(.Workbook)
    names(mydata)
    summary(mydata)
    View(mydata)
    fix(mydata)
    # Save the corrected file
    save(mydata, file="mydata.RData")

    # Other options available: http://cran.r-project.org/doc/manuals/r-release/R-data.html


# In .XLSX format (Excel 2007-2010)

    # Option 1: use gdata (can give errors if Perl modules are missing)
    library(gdata)
    mydata <- "C:/Users/Me/My Documents/.../My data/somedata.xlsx"
    mydata <- read.xls(mydata, sheet='name of my sheet')
    names(mydata)
    summary(mydata)
    View(mydata)
    fix(mydata)
    # Save the corrected file
    save(mydata, file="mydata.RData")

    # Option 2: XLConnect (can give errors if Java modules are missing)
    library(XLConnect, pos=4)
    .Workbook <- loadWorkbook("C:/Users/Me/My Documents/.../My data/somedata.xlsx")
    mydata <- readWorksheet(.Workbook, "Sheet1")
    remove(.Workbook)
    names(mydata)
    summary(mydata)
    View(mydata)
    fix(mydata)
    # Save the corrected file
    save(mydata, file="mydata.RData")

    # Other options available: http://cran.r-project.org/doc/manuals/r-release/R-data.html

