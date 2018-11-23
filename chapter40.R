#CREATE DUMMY COLUMNS FROM CATEGORICAL VARIABLE

DF <- data.frame(strcol = c("A", "A", "B", "F", "C", "G", "C", "D", "E", "F"))
for(level in unique(DF$strcol)){
  DF[paste("strcol", level, sep = "_")] <- ifelse(DF$strcol == level, 1, 0)}

