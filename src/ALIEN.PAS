var i,k,c,f,g,h,l,m,o,p,n,q,r,s,x,y,w,z:integer;u,v,b:longint;t,d:array[0..320]of integer;begin for x:=0to$ff do
t[x]:=round(sin(x/40.4)*127);asm mov ax,19;int 16;end;for x:=0 to$ff do begin port[968]:=x;port[969]:=x div 4;port[969]:=x div
6;port[969]:=x shr 4;end;r:=-9;repeat u:=t[lo(c)];v:=t[lo(c+64)];fillchar(d[0],640,0);for y:=0to 250do begin z:=sqr(250-y)shr
7+1;n:=l;q:=m;f:=9999div z;o:=v*f div$b0;p:=u*f div$b0;g:=u*f-o*160-q;h:=-v*f-p*160-n;for x:=0to 319do begin i:=80-(t[hi(g shl
3+h)]-t[hi(g+g+g-h)]-t[hi(h shl 3-h)]+320)shr 3and 236;if i<9then i:=0;w:=99-z*i shr 7;if w>99then w:=99;if w>d[x]then begin
k:=x+w*320;s:=(t[hi(g*20)]+t[hi(h*23)]+256)shr 2-y+90;if(4=4and i)and(i>0)then s:=s+2and hi(g xor h)*6+9;if s<0then s:=0;for
f:=d[x]to w-1do begin mem[$a000:k]:=s;mem[$a000:x+x-1856-k]:=s;k:=k-320;end;d[x]:=w;end;inc(g,o);inc(h,p);end;if(d[80]or
d[240]or d[160]>9)and(y=0)then r:=-r;end;inc(m,u*r div 30);dec(l,v*r div 30);asm mov ax,11;int 51;shr cx,1;add c,cx;add r,dx
end;until port[96]=1;end.