#COPY DATA FROM EXCEL TO R
data = read.table(text="
X Y Z
                  6 5 0
                  6 3 NA
                  6 1 5
                  8 5 3", header=TRUE)

data
