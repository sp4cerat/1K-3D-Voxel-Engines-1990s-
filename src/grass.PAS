var i,k,c,f,g,h,l,m,o,p,n,q,r,s,x,y,w,z:integer;u,v,b:longint;t,d:array[0..320]of integer;procedure j(k:byte);begin
port[969]:=t[lo(x*k)]div 4+31;end;begin for x:=0to$ff do t[x]:=round(sin(x/40.4)*127);asm mov ax,19;int 16;end;for x:=0 to$ff
do begin port[968]:=x;j(3);j(1);j(2);end;c:=90;r:=-9;m:=0;for y:=1to 32000do mem[$a000:y]:=y div 320-80;repeat
u:=t[lo(c)];v:=t[lo(c+64)];for x:=0to 319do d[x]:=0;for y:=1to 249do begin n:=l;q:=m;z:=sqr(249-y)shr 7+1;f:=12000div
z;o:=v*f div$b0;p:=u*f div$b0;g:=u*f-o*160-q;h:=-v*f-p*160-n;for x:=0to 319do begin i:=120-(t[hi(g+g+g)]shl 1+t[hi(h+h)]+
t[hi(h shl 2)]+318)shr 3;if i<-9then i:=80;w:=150-z*i shr 7;if w>149then w:=149;if w>d[x]then begin
s:=(t[hi(g shl 3+g)]-t[hi(h shl 3-h)])shr 5+(hi(g xor h)and 16-i-y)shr 3+9;k:=x-w*320-1536;for f:=d[x]to w-1do begin
mem[$a000:k]:=s;k:=k+320;end;d[x]:=w;end;inc(g,o);inc(h,p);end;end;inc(m,u*r div 8);dec(l,v*r div 8);asm mov ax,11;int 51
shr cx,1;add c,cx;add r,dx;end;until port[96]=1;asm mov ax,3;int 16;end;end.