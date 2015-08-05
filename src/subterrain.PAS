var i,k,c,f,g,h,l,m,o,p,n,q,r,s,x,y,w,z:integer;u,v,b:longint;t,d:array[0..320]of integer;begin for
x:=0to$ff do t[x]:=round(sin(x/40.4)*127);asm mov ax,19;int 16;end;for x:=0 to$ff do begin port[968]:=x;port[969]:=x shr
2;port[969]:=x shr 2;port[969]:=x shr 3;end;c:=63;r:=-41;l:=-6500;repeat u:=t[lo(c)];v:=t[lo(c+64)];for x:=0to 319do
d[x]:=0;for y:=0to 250do begin n:=l;q:=m;z:=sqr(250-y)shr 7+1;f:=10000div z;o:=v*f div$b0;p:=u*f div$b0;g:=u*f-o*160-q;
h:=-v*f-p*160-n;for x:=0to 319do begin i:=170-(t[hi(g+g+g)]-t[hi((h-g)shl 2)]+t[hi(h shl 3-h)]+384)shr 2;if i>60then
i:=60;if i<0 then i:=0;w:=100-z*i shr 7;if w>100then w:=100;if w>d[x]then begin k:=x+w*320;s:=255-(t[hi(g+g+g+999)]-t[hi(h
shl 2+g-999)]+256)shr 2+hi(h xor g+h)and 8-y;if s<0then s:=0;for f:=d[x]to w-1do begin mem[$a000:k]:=s;mem[$a000:x+x-1536-k]:=s
;k:=k-320;end;d[x]:=w;end;inc(g,o);inc(h,p);end;end;inc(m,u*r div 9);dec(l,v*r div 9);asm mov ax,11;int 51;shr cx,1;add c,cx
add r,dx;end;until port[96]=1;asm mov ax,3;int 16;end;end.