var e,i,k,c,f,g,h,l,m,o,p,n,q,r,s,x,y,w,z:integer;u,v,b:longint;t,d:array[0..320]of integer;begin for x:=0to$ff do
t[x]:=round(sin(x/40.4)*127);asm mov ax,19;int 16;end;for x:=0 to$ff do begin port[968]:=x;port[969]:=0;port[969]:=x shr
2;port[969]:=x shr 2;end;for y:=0to 9999do mem[$a000:y]:=127-y div 80;repeat u:=t[lo(c)];v:=t[lo(c+64)];for x:=0to 319do
d[x]:=0;for y:=0to 250do begin n:=l;q:=m;z:=sqr(249-y)shr 7+1;f:=10000div z;o:=v*f div$b0;p:=u*f div$b0;g:=u*f-o*160-q;h:=-v*f-
p*160-n;for x:=0to 319do begin i:=(t[hi(h shl 3)]+t[hi(g shl 3+e)]+256)shr 5+80;f:=(t[hi(g+g-h-h)]-t[hi(h)]+t[hi(h+g)]+384)shr
2;s:=260-(t[hi(g+g-h)]-t[hi(h+h-g)]+256)shr 2-y-hi(g xor h)and 8;if f<i then begin s:=s-20;i:=f;end;w:=150-z*i shr
7;if w>150then w:=150;if w>d[x]then begin k:=x-w*320-1536;if s<0then s:=0;for f:=d[x]to w-1do begin mem[$a000:k]:=s;k:=k+320;
end;d[x]:=w;end;inc(g,o);inc(h,p);end;end;inc(m,u*r div 9);dec(l,v*r div 9);asm mov ax,11;int 51;shr cx,1;add c,cx;add r,dx
end;inc(e,3333);until port[96]=1;end.