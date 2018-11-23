#INSTALL R PACKAGE DIRECTLY FROM GITHUB
#Step I : Install and load devtools package
install.packages("devtools")
library(devtools)

#Step II : Install Package from GitHub
install_github("tomasgreif/woe")

#How to find proxy server settings :

#Start>control panel>Network and Internet > click on Internet Options > click on connections tab then right at the bottom click on LAN settings > Check Proxy Server Settings
#You can download Rtools from this link - https://cran.r-project.org/bin/windows/Rtools/ . OR
install.packages("installr")
install.Rtools()
