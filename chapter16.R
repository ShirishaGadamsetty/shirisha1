#installing package
install.packages("ggplot2")
library(ggplot2)
# Considering the iris data.
# Creating a histogram
ggplot(data  = iris, aes( x = Sepal.Length)) + geom_histogram( )
ggplot(data  = iris, aes(x = Sepal.Length)) + geom_histogram(binwidth=1)
ggplot(data = iris , aes(x=Sepal.Length)) + geom_histogram(color="black", fill="white", bins = 10) 
#How to visualize various groups in histogram
ggplot(iris, aes(x=Sepal.Length, color=Species)) + geom_histogram(fill="white", binwidth = 1)
#Creating Density Plot
ggplot(iris, aes( x = Sepal.Length)) + geom_density( )
#How to show various groups in density plot
ggplot(iris, aes(x=Sepal.Length, color=Species)) + geom_density( )
#Creating Bar and Column Charts :
ggplot(mpg, aes(x= class)) + geom_bar() 
ggplot(mpg, aes(x= class)) + geom_bar() + coord_flip()
#How to add or modify Main Title and Axis Labels 
p = ggplot(mpg, aes(x= class)) + geom_bar() 
p + labs(title = "Number of Cars in each type", x = "Type of car", y = "Number of cars")
#How to add data labels 
p = ggplot(mpg, aes(x= class)) + geom_bar()
p = p + labs(title = "Number of Cars in each type", x = "Type of car", y = "Number of cars")
p + geom_text(stat='count', aes(label=..count..), vjust=-0.25)
#How to reorder Bars 
install.packages("plyr")
library(plyr)
library(dplyr)
data("mtcars")
 
count(mpg,class) %>% arrange(-n) %>%
  mutate(class = factor(class,levels= class)) %>%
  ggplot(aes(x=class, y=n)) + geom_bar(stat="identity")
#Showing Mean of Continuous Variable by Categorical Variable
df = mpg %>% group_by(class) %>% summarise(mean = mean(displ)) %>%
  arrange(-mean) %>% mutate(class = factor(class,levels= class))

p = ggplot(df, aes(x=class, y=mean)) + geom_bar(stat="identity")
p + geom_text(aes(label = sprintf("%0.2f", round(mean, digits = 2))),
              vjust=1.6, color="white", fontface = "bold", size=4)
#Creating Stacked Bar Chart 
p <- ggplot(data=mpg, aes(x=class, y=displ, fill=drv))
p + geom_bar(stat = "identity")
p + geom_bar(stat="identity", position=position_dodge())
#Creating BoxPlot 
mtcars$cyl = factor(mtcars$cyl)
ggplot(mtcars, aes(x=cyl, y=disp)) + geom_boxplot()
ggplot(mtcars, aes(x=cyl, y=disp)) + geom_boxplot(notch = TRUE)
#Scatter Plot 
# Creating a scatter plot denoting various species.
ggplot(data = iris, aes( x = Sepal.Length, y = Sepal.Width,shape = Species, color = Species)) + geom_point()
# Creating scatter plot for automatic cars denoting different cylinders.
ggplot(data = subset(mtcars,am == 0),aes(x = mpg,y = disp,colour = factor(cyl))) + geom_point()
# Seeing the patterns with the help of geom_smooth.
ggplot(data = mtcars, aes(x = mpg,y = disp,colour = hp))  + geom_point() + geom_smooth()
# Plotting the horsepower using geom_line
ggplot(data = mtcars, aes(x = mpg,y = disp,colour = hp))  + geom_point(size = 2.5) + geom_line(aes(y = hp))
#Modifying the axis labels and appending the title and subtitle
#Adding title or changing the labels
ggplot(mtcars,aes(x = mpg,y = disp)) + geom_point() + labs(title = "Scatter plot") 
#Alternatively
ggplot(mtcars,aes(x = mpg,y = disp)) + geom_point() + ggtitle(label = "Scatter plot")
ggplot(mtcars,aes(x = mpg,y = disp)) + geom_point() + ggtitle(label = "Scatter plot",
                                                              subtitle = "mtcars data in R")
a <- ggplot(mtcars,aes(x = mpg, y = disp, color = factor(cyl))) + geom_point()
a
#Changing the axis labels.
a + labs(color = "Cylinders")
a + labs(color = "Cylinders") + xlab("Mileage") + ylab("Displacement")
#Combining it all
a + labs(color = "Cylinders") + xlab("Mileage") + ylab("Displacement") + ggtitle(label = "Scatter plot", subtitle = "mtcars data in R")
#Playing with themes 
#Changing the themes.
b <- ggplot(mtcars,aes(mpg,disp)) + geom_point()  + labs(title = "Scatter Plot") 
#Changing the size and color of the Title and the background color.
b + theme(plot.title = element_text(color = "blue",size = 17),plot.background = element_rect("orange"))
b + theme_minimal( )
#Removing the lines from the background.
b + theme(panel.background = element_blank())
#Removing the text from x and y axis.
b + theme(axis.text = element_blank())
b + theme(axis.text.x = element_blank())
b + theme(axis.text.y = element_blank())
#Changing the legend position
c <- ggplot(mtcars,aes(x = mpg, y = disp, color = hp)) +labs(title = "Scatter Plot") + geom_point()
c +  theme(legend.position = "top")
#Combining everything.
c + theme(legend.position = "bottom", axis.text = element_blank()) +
  theme(plot.title = element_text(color = "Forest Green",size = 17),plot.background = element_rect("Yellow")) 
#Changing the color scales in the legend 
c + scale_color_gradient(low = "yellow",high = "red") 
c + scale_color_gradient2(low = "red",mid = "green",high = "blue")
c + theme(legend.position = "bottom") + scale_color_gradientn(colours = c("red","forest green","white","blue"))
#Changing the breaks in the legend.
#Changing the breaks in the legend
c + scale_color_continuous(name = "horsepower", breaks = seq(50,350,75), labels = paste(seq(50,350,75),"hp"))
#Changing the break points and color scale of the legend together.
#Trial 1 : This one is wrong
c + scale_color_continuous( breaks = seq(50,350,75)) +
  scale_color_gradient(low = "blue",high = "red") 
#Trial 2: Next one is wrong.
c  +  scale_color_gradient(low = "blue",high = "red") +
  scale_color_continuous( breaks = seq(50,350,75))
#The correct way to do is to define the arguments in one function only.
c + scale_color_continuous(name = "horsepower", breaks = seq(50,350,75), low = "red", high = "black") + theme(panel.background = element_rect("green"),
                                                                                                              plot.background = element_rect("orange"))
#Changing the axis cut points
d <- ggplot(mtcars,aes(x = mpg,y = disp)) + geom_point(aes(color = factor(am)))  +
  xlab("Mileage") + ylab("Displacement") +
  theme(panel.background = element_rect("black") , plot.background = element_rect("pink"))
d +  scale_x_continuous(limits = c(2,4)) + scale_y_continuous(limits = c(15,30))
d + scale_x_continuous(limits = c(2,4),breaks = seq(2,4,0.25)) +
  scale_y_continuous(limits = c(15,30),breaks = seq(15,30,3))
#Faceting.
#We can mention the number of rows we need for faceting.
# Control the number of rows and columns with nrow and ncol
ggplot(mtcars, aes(mpg, disp)) +  geom_point() +  facet_wrap(~carb,nrow = 3)
#Faceting using multiple variables.
# You can facet by multiple variables
ggplot(mtcars, aes(mpg, disp)) + geom_point() + facet_wrap(~carb + am)
#Alternatively
ggplot(mtcars, aes(mpg, disp)) + geom_point() + facet_wrap(c("carb","am"))
# Use the `labeller` option to control how labels are printed:
ggplot(mtcars, aes(mpg, disp)) +  geom_point() +  facet_wrap(~carb  + am, labeller = "label_both")
z <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
z + facet_grid(. ~ cyl)   #col
z + facet_grid(cyl ~ .)   #row
z + facet_grid(gear ~ cyl,labeller = "label_both")  #row and col
#Adding text to the points.
ggplot(mtcars, aes(x= mpg,y = disp)) + geom_point() +
  geom_text(aes(label = am))
equire(ggrepel)
ggplot(mtcars, aes(x= mpg,y = disp)) + geom_point() +
  geom_text_repel(aes(label = am))
