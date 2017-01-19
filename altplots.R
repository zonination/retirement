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
  scale_x_continuous(breaks=seq(0,1,.1), labels=scales::percent, limits=c(0,.61))+
  scale_y_continuous(breaks=seq(0,60,10), limits=c(-1,41))+
  labs(title="Retirement, by Desired Budget",
       subtitle="Assuming 5% portfolio earnings, 4% safe withdrawal rate",
       x="Savings rate, as % of income",
       y="Number of years saved",
       caption="created by /u/zonination for /r/personalfinance")+
  annotate("rect",xmin=.15,xmax=.20,ymin=35,ymax=40,alpha=.5,fill="black",color="darkgreen")+
  annotate("text", x=.5, y=37, label="4 x budget", size=3, angle=-35)+
  annotate("text", x=.5, y=26.5, label="2 x budget", size=3, angle=-30)+
  annotate("text", x=.5, y=17, label="1 x budget", size=3, angle=-25)+
  annotate("text", x=.5, y=10, label=".5 x budget", size=3, angle=-20)+
  annotate("text", x=.5, y=5.75, label=".25 x budget", size=3, angle=-12.5)+
  theme_bw()+
  theme(plot.caption=element_text(size=7, vjust=0))+
  theme(legend.text =element_text(size=8))+
  theme(legend.title=element_text(size=10))
ggsave("altplots/budget-1.png",height=6,width=10,dpi=100,type="cairo-png")