var i,k,c,f,g,h,l,m,o,p,n,q,r,s,x,y,w,z:integer;u,v,b:longint;t,d:array[0..320]of integer;begin for
x:=0to$ff do t[x]:=round(sin(x/40.4)*127);asm mov ax,19;int 16;end;for x:=0 to$ff do begin port[968]:=x;port[969]:=x shr
2;port[969]:=x shr 3;port[969]:=0;end;c:=223;r:=-20;l:=-1000;repeat u:=t[lo(c)];v:=t[lo(c+64)];for x:=0to 319do
d[x]:=0;for y:=0to 250do begin n:=l;q:=m;z:=sqr(250-y)shr 7+1;f:=10000div z;o:=v*f div$b0;p:=u*f div$b0;g:=u*f-o*160-q;h:=-v*f-
p*160-n;for x:=0to 319do begin i:=(t[hi(g*3)]-t[hi((h+g)*2)]+t[hi(h*4)]+212)shr 2-120;if i>200then i:=-50-i and 17;w:=100+z shr
1*i div 64;if w>100then w:=100;if w>d[x]then begin k:=x+w*320;s:=255-(t[hi(g*9+999)]-t[hi(h*7-999)]+256)shr 3-hi(g xor h)and 8
shl 1-(50-i)shr 3-y;if s<0then s:=0;for f:=d[x]to w-1do begin mem[$a000:k]:=s;mem[$a000:x+x-1536-k]:=s;k:=k-320;end;d[x]:=w;
end;inc(g,o);inc(h,p);end;end;inc(m,u*r div 9);dec(l,v*r div 9);asm mov ax,11;int 51;shr cx,1;add c,cx;add r,dx;end;until
port[96]=1;asm mov ax,3;int 16;end;end.