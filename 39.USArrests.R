library(ggplot2)
data("USArrests")
num_features<-ncol(USArrests)
feature_types<-sapply(USArrests,class)
num_records<-sapply(USArrests,length)
summary_stats<-summary(USArrests)
state_largest_rape<-rownames(USArrests)[which.max(USArrests$Rape)]
state_max_murder<-rownames(USArrests)[which.max(USArrests$Murder)]
state_min_murder<-rownames(USArrests)[which.min(USArrests$Murder)]
correlation_matrix<-cor(USArrests)
states_above_median_assault<-rownames(USArrests)[USArrests$Assault>median(USArrests$Assault)]
states_bottom_25_murder<-rownames(USArrests)[USArrests$Murder<quantile(USArrests$Murder,0.25)]
hist_density_plot<-ggplot(USArrests,aes(x=Murder))+
  geom_histogram(binwidth=2,fill="cyan",color='black')+
  geom_density(aes(y=after_stat(scaled)*10),color="red")+
  labs(x="Murder Arrests",y="Density",title="Histogram and Density Plot of Murder Arrests")
print(hist_density_plot)
scatter_plot<-ggplot(USArrests,aes(x=Murder,y=UrbanPop,color=Assault))+
  geom_point()+
  scale_color_gradient(low="blue",high="red")+
  labs(x="Murder Arrests",y="Urban Population Proportion",title="Scatter Plot with Arrests")
barplot_murder_rate<-ggplot(USArrests,aes(x=reorder(row.names(USArrests),-Murder),y=Murder))+
  geom_bar(stat="identity",fill="steelblue")+
  coord_flip()+
  labs(x="State",y="Murder Rate",title="Murder Rate for Each State")
print(num_features)
print(feature_types)
print(num_records)
print(summary_stats)
print(state_largest_rape)
print(state_max_murder)
print(state_min_murder)
print(correlation_matrix)
print(states_above_median_assault)
print(states_bottom_25_murder)
print(hist_density_plot)
print(scatter_plot)
print(barplot_murder_rate)
