# Assumptions:
real.r = 5.0  # Real return from portfolio, in stocks, bonds, etc. as percent.
swr    = 4.0  # "Safe Withdrawal Rate" from portfolio, as percent.

# Load libraries, load assumptions
library(ggplot2)
library(scales)
library(RColorBrewer)

#######################
# PART 1: Calculation #
#######################

# Convert variables from percent to decimal
real.r <- real.r/100+1
swr    <- swr   /100

# Declare a blank data frame with savings rate, years saved, and amount in portfolio
df<-data.frame("save.r"=NA, "years"=NA, "amt"=NA)

# Sweep across percentage of income saved
for(inc.pct in seq(.01,.99,.01)){
  saved<-0
  # Calculate an amount for each year saved
  for(years in 0:60){
    saved<-saved*real.r+inc.pct
    df<-rbind(df,c(inc.pct,years,saved))
  } }; rm(saved); rm(years); rm(inc.pct)

# Remove "NA" from data frame
df<-subset(df, !is.na(df$save.r))

# Calculate living income based off Safe Withdrawal Rate
df$l.income<-df$amt*swr

# Calculate expense rate after retirement
df$spend <- df$l.income/(1-df$save.r)

####################
# PART 2: Plotting #
####################

# Plot the final results, as Income Multiplier
ggplot(df,aes(save.r,years))+
  # Using logscale since it's easier to visualize on this heatmap.
  geom_raster(aes(fill=log(l.income)/log(2)), interpolate=T, alpha=.7)+
  geom_contour(aes(z=log(l.income)/log(2)),color="black",size=.5, binwidth=1)+
  scale_fill_gradientn("Desired Income\nAfter Retirement",
                       colors = brewer.pal(9,"PiYG"),
                       limits=c(-4,4),
                       breaks=c(-4:4),
                       labels=c(".06 x income",".13 x income",".25 x income",".5 x income","1 x income","2 x income","4 x income","8 x income", "16 x income"),
                       oob=scales::squish)+
  scale_x_continuous(breaks=seq(0,1,.1), labels=scales::percent, limits=c(0,1))+
  scale_y_continuous(breaks=seq(0,60,10), limits=c(-1,61))+
  labs(title="Retirement, by Desired Income",
       subtitle="Assuming 5% portfolio earnings, 4% safe withdrawal rate",
       x="Savings rate, as % of income",
       y="Number of years saved",
       caption="created by /u/zonination for /r/personalfinance")+
  # annotate("rect",xmin=.15,xmax=.20,ymin=35,ymax=40,alpha=.5,fill="black",color="darkgreen")+
  annotate("text", x=.5, y=49.5, label="4 x income", size=3, angle=-20)+
  annotate("text", x=.5, y=37, label="2 x income", size=3, angle=-20)+
  annotate("text", x=.5, y=26, label="1 x income", size=3, angle=-20)+
  annotate("text", x=.5, y=17, label=".5 x income", size=3, angle=-15)+
  annotate("text", x=.5, y=10, label=".25 x income", size=3, angle=-10)+
  theme_bw()+
  theme(plot.caption=element_text(size=7, vjust=0))+
  theme(legend.text =element_text(size=8))+
  theme(legend.title=element_text(size=10))
ggsave("income.png",height=6,width=10,dpi=100,type="cairo-png")

# Plot the final results, as Spend Multiplier
ggplot(df,aes(save.r,years))+
  # Using logscale since it's easier to visualize on this heatmap.
  geom_raster(aes(fill=log(spend)/log(2)), interpolate=T, alpha=.7)+
  geom_contour(aes(z=log(spend)/log(2)),color="black",size=.5, binwidth=1)+
  scale_fill_gradientn("Desired Budget\nAfter Retirement",
                       colors = brewer.pal(9,"PiYG"),
                       limits=c(-4,4),
                       breaks=c(-4:4),
                       labels=c(".06 x budget",".13 x budget",".25 x budget",".5 x budget","1 x budget","2 x budget","4 x budget","8 x budget", "16 x budget"),
                       oob=scales::squish)+
  scale_x_continuous(breaks=seq(0,1,.1), labels=scales::percent, limits=c(0,1))+
  scale_y_continuous(breaks=seq(0,60,10), limits=c(-1,61))+
  labs(title="Retirement, by Desired Budget",
       subtitle="Assuming 5% portfolio earnings, 4% safe withdrawal rate",
       x="Savings rate, as % of income",
       y="Number of years saved",
       caption="created by /u/zonination for /r/personalfinance")+
  annotate("text", x=.5, y=37, label="4 x budget", size=3, angle=-35)+
  annotate("text", x=.5, y=26.5, label="2 x budget", size=3, angle=-30)+
  annotate("text", x=.5, y=17, label="1 x budget", size=3, angle=-25)+
  annotate("text", x=.5, y=10, label=".5 x budget", size=3, angle=-20)+
  annotate("text", x=.5, y=5.75, label=".25 x budget", size=3, angle=-12.5)+
  theme_bw()+
  theme(plot.caption=element_text(size=7, vjust=0))+
  theme(legend.text =element_text(size=8))+
  theme(legend.title=element_text(size=10))
ggsave("budget.png",height=6,width=10,dpi=100,type="cairo-png")