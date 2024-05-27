uses crt,dos;
const 

       L1=20000;     

var   h,x,u,y,v,t,t0,x0,u0,y0,v0,k0x,k0y,k0u,k0v,k1x,k1y,k1u,k1v,k2x,k2y,k2u,k2v:extended;
      k3x,k3y,k3u,k3v,k4x,k4y,k4u,k4v,Io,Ga,Rc,Rb,Vt,rau,tmin,a,b,C,C1,C2,Cb,alpha,beta,mu,k,zita,E: extended;
      d,s,ep1,nu,ep2,Is ,Ga1,C0,xx,Vref, aa,a1,Rs, f,ome, a2, bb, L,pas, L2, m,eps, ww,R1,R, R2, R3, R4,omega : extended;
      vitav1, vitesse1,alpha1,alpha2,alpha3,sigma1,sigma2,C3, R5,R6,R7,neta:extended;
      deltat,ie:integer;
      nom:string;
      result: text ;
	  
function g1(x,u,y,v:extended):extended;
begin
g1:=u;
end;

function g2(x,u,y,v:extended):extended;
begin

g2:=a*y;
end;

function g3(x,u,y,v:extended):extended;
begin
g3:=-b*x-c*y-(-neta+beta*abs(v))*u;
end;

function g4(x,u,y,v:extended):extended;
begin
g4:=alpha*(-u);
end;



begin


clrscr;
nom:='d:\duf_mem.dat';
assign(result,nom);
rewrite(result);

neta:=6.667; beta:=4.03; alpha:= 2; 

a:=5; b:=1.43;     c:=0.5;

t0:=0.0; x0:=0; u0:=-0.0; y0:=0.1;v0:=-0.70; h:=0.005;  tmin:=5000;

deltat:=500; pas:=(5-1)/500;


repeat
    repeat
       repeat 
k1x:=g1(x0,u0,y0,v0);
k1u:=g2(x0,u0,y0,v0);
k1y:=g3(x0,u0,y0,v0);
k1v:=g4(x0,u0,y0,v0);

k2x:=g1(x0+k1x*(h/2),u0+k1u*(h/2),y0+k1y*(h/2),v0+k1v*(h/2));
k2u:=g2(x0+k1x*(h/2),u0+k1u*(h/2),y0+k1y*(h/2),v0+k1v*(h/2));
k2y:=g3(x0+k1x*(h/2),u0+k1u*(h/2),y0+k1y*(h/2),v0+k1v*(h/2));
k2v:=g4(x0+k1x*(h/2),u0+k1u*(h/2),y0+k1y*(h/2),v0+k1v*(h/2));

k3x:=g1(x0+k2x*(h/2),u0+k2u*(h/2),y0+k2y*(h/2),v0+k2v*(h/2));
k3u:=g2(x0+k2x*(h/2),u0+k2u*(h/2),y0+k2y*(h/2),v0+k2v*(h/2));
k3y:=g3(x0+k2x*(h/2),u0+k2u*(h/2),y0+k2y*(h/2),v0+k2v*(h/2));
k3v:=g4(x0+k2x*(h/2),u0+k2u*(h/2),y0+k2y*(h/2),v0+k2v*(h/2));

k4x:=g1(x0+k3x*h,u0+k3u*h,y0+k3y*h,v0+k3v*h);
k4u:=g2(x0+k3x*h,u0+k3u*h,y0+k3y*h,v0+k3v*h);
k4y:=g3(x0+k3x*h,u0+k3u*h,y0+k3y*h,v0+k3v*h);
k4v:=g4(x0+k3x*h,u0+k3u*h,y0+k3y*h,v0+k3v*h);

k0x:=(k1x+2*k2x+2*k3x+k4x)/6;      
k0u:=(k1u+2*k2u+2*k3u+k4u)/6;
k0y:=(k1y+2*k2y+2*k3y+k4y)/6;
k0v:=(k1v+2*k2v+2*k3v+k4v)/6;

x:=x0+k0x*h;
u:=u0+k0u*h;
y:=y0+k0y*h;
v:=v0+k0v*h;

t:=t0+h;

vitav1:=g1(x0,u0,y0,v0);
x0:=x;
u0:=u;
y0:=y;
v0:=v;
t0:=t;
vitesse1:=g1(x,u,y,v);
until t>tmin;

    if (vitav1>0)and (vitesse1<0) then
      begin
      writeln('a=',a,'x=',x,'u=',u,'y=',y,'v=',v);

      writeln(result,' ',a:5:8,' ',x:5:8,' ',u:5:8,' ',y:5:8,' ',v:5:8);
    end;

  until t>(tmin+deltat);


t0:=-0.00; 

  a:=a-pas;

until a<1;
close(result);

readln;
end.

