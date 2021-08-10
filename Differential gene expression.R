#Date 2021.01.10
#Author wbt
data = read.csv(file = "C:/Users/Tunnnnn/Desktop/graduate student/experiment/transcriptome/data/gene expression-p0.005,lg2fc1.csv")
install.packages("ggplot2")
library(ggplot2) 


data$Significant = "stable"
data$Significant[data$Log2FC.RP.SP. > 0.5 & data$Padjust < 0.05] = "up"
data$Significant[data$Log2FC.RP.SP. < -0.5 & data$Padjust < 0.05] = "down"

ggplot(data,aes(data$Log2FC.RP.SP.,-1*log10(data$Padjust))) + xlim(-16,12) +ylim(0,75) +
  geom_point(aes(color = data$Significant),size = 1.2)+ theme_classic() +
  xlab("log2(fold change)") + theme(axis.title.x = element_text(size = 15, family = "myFont", color = "black  ", face = "bold", vjust = 1.3, hjust = 0.5,))+
  ylab("-log10(P_value)") + theme(axis.title.y = element_text(size = 15, family = "myFont", color = "black", face = "bold", vjust = 2, hjust = 0.5,))+
  labs(fill="group")+
  scale_color_manual(values = c("#FF4500","#00CD00","#33CC00"))+
  theme(legend.title = element_text(colour="black", size=13, face="bold"))+
  geom_hline(yintercept = 1.3,linetype = 4,size =0.8)+
  geom_vline(xintercept = c(-0.5,0.5),linetype =4,size =0.8)+
  theme(title = element_text(size = 18),text = element_text(size = 18))+
  theme(
    legend.position = c(0.94, 0.94),
    legend.justification = c(0.94, 0.94)) 

