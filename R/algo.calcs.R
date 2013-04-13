require(moments)
source("R/functions.moments.R")
num.quantiles=5
length.ma=100
wmean=t(rep(1,length.ma)/length.ma)
wvol=wmean
ret = diff(df$price)

mhist=weighted.historicals(ret,list(mean=wmean,vol=wvol))

qs.hmean=quantile(t(mhist$hmean), probs = (1/num.quantiles)*(1:num.quantiles))
qs.hvol=quantile(t(mhist$hvol), probs = (1/num.quantiles)*(1:num.quantiles))
qts.hmean=quantile.ts(mhist$hmean, qs.hmean)
qts.hvol=quantile.ts(mhist$hvol, qs.hvol)

dfg = cbind(times=df$time[-1],ret,mhist,qts.hmean,qts.hvol)

g = ggplot(dfg,aes(x=times,y=hmean,color=hvol))
g = g + geom_point(aes(group=1))
g
str(dfg)

delay.signal=1
sig=c(as.logical(rep(0,delay.signal)),
  dfg$hmean[1:(dim(dfg)[1]-delay.signal)])
qs.sig=quantile(sig, seq(0.01,1,0.01))
dfg$qts.sig=quantile.ts(sig,qs.sig)
dfg$pos=as.numeric(dfg$qts.sig>27)
summary(dfg$pos)

dfn = subset(dfg, select = -c(times) )  
stats = return.to.stats.raw(dfn)
rownames(stats) = colnames(dfn)
stats

b = bucket.stats(
  dfg$ret,
  dfg$qts.hmean, 
  dfg$qts.hvol,
  num.quantiles,
  delay.signal)

require(reshape)
require(scales)
vol.cats=c("low vol", "low-mid vol", "mid vol", "high-mid vol", "high vol")
ret.cats=c("low ret", "low-mid ret", "mid ret", "high-mid ret", "high ret")
data = b$br
which.name = "return"
colnames(data)=vol.cats
rownames(data)=ret.cats
data.m = melt(data)
colnames(data.m) = c("return.level","volatility.level", which.name)
data.m$return.level = factor(data.m$return.level,levels=ret.cats)
data.m$volatility.level = factor(data.m$volatility.level,levels=vol.cats)
data.m <- transform(data.m, rescale = rescale(data.m[which.name]))
p <- ggplot(data.m, aes(return.level, volatility.level)) + geom_tile(aes(fill = return), 
                                                  colour =   "white") 
p + scale_fill_gradient(low = "white", high = "steelblue", space="Lab")
p
ggsave("pricevolheat.svg")
