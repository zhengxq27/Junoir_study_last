function [zq,pq,oq] = plotzp(bq, aq)
[zq,pq,kq]=tf2zp(bq,aq);
markers = {'*','+'};
zh = plot(zq,markers{1},'MarkerSize',7);
ph = plot(pq,markers{2},'MarkerSize',8);