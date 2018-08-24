# Melt Sample df, labeling all correlation values as 'corr' in a new variable
sample.m <- melt(sample)

# Converts var1 and var2 to characters and factors, maintaining their order
sample.m$var2 <- as.character(sample.m$var2)
sample.m$var2 <- factor(sample.m$var2, levels=unique(sample.m$var2),ordered=TRUE)
sample.m$var1 <- as.character(sample.m$var1)
sample.m$var1 <- factor(sample.m$var1, levels=unique(sample.m$var1),ordered=TRUE)

# Constructs the plot using ggplot, Rescale the values and define the color scheme
p <- ggplot(sample.m, aes(var2,var1)) + geom_tile(aes(fill=value), colour="transparent") +    scale_fill_gradientn(colours = c("cyan", "black", "red"), values = scales::rescale(c(-0.5, -0.05, 0, 0.05, 0.5)))
base_size <- 9

# Apply some formatting to the plot: legend position, axis ticks, x-axis text angle, text size 
p + theme_bw() + labs(x = "", y = "") + scale_x_discrete(expand = c(0,0)) + theme(legend.position = "bottom", axis.ticks = element_blank(), axis.text.x = element_text(size = base_size * 0.8, angle = 330, hjust = 0, colour = "black"), axis.text.y = element_text(size = base_size * 0.8,colour = "black"))
