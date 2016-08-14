# read data
emit_data<-readRDS("./explodata_project2/summarySCC_PM25.rds")

# Plot Data 3
baltimore<-subset(emit_data,fips=="24510")
plotdata3 <- aggregate(baltimore[c("Emissions")], list(year = baltimore$type), sum)

# Create Plot 3
png("./explodata_project2/Plot3.png")
plot3<-ggplot(plotdata3,aes(x=year,y=Emissions,colour=type)) +
       geom_point(alpha=.3)+geom_smooth(alpha=.3,size=1,method="loess")+
       ggtitle("Total Emissions BY Sources In Baltimore City")
print(plot3)

# Switch off device
dev.off()