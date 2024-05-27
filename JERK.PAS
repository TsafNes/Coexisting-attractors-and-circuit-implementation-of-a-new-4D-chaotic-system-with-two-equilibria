uses crt,dos;
const 

       L=20000;
label fin;

var   h,x,u,y,v,t,t0,x0,u0,y0,v0,k0x,k0y,k0u,k0v,k1x,k1y,k1u,k1v,k2x,k2y,k2u,k2v:extended;
      k3x,k3y,k3u,k3v,k4x,k4y,k4u,k4v,Io,Ga,Rc,Rb,Vt,rau,tmin,a,b,c,C1,C2,C0,alpha,mu,k,zita,E: extended;
      d,p1,eps2,nu,eps,is,vref,a3, gamma,sigma, rau1,a1,b1,r0, neta,w,im ,m1,m0, ga0,Rn,beta, R,beta2 : extended;
      deltat,ie:integer;
      nom:string;
      result: text ;

 
function g1(x,u,y,v:extended):extended;
begin
g1:=a*(u-x);
end;

function g2(x,u,y,v:extended):extended;
begin
g2:=x*y+v;
end;

function g3(x,u,y,v:extended):extended;
begin
g3:=b-x*u;
end;

function g4(x,u,y,v:extended):extended;
begin
g4:=c*u*y;
end;

begin

clrscr;
nom:='d:\jerk.dat';
assign(result,nom);
rewrite(result);

a:=10; b:=10;     c:=1;

t0:=0.0; x0:=0; u0:=-0.0; y0:=-0.1;v0:=-0.75;  h:=0.005; ie:=0;

  tmin:=10000;deltat:=300;


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
k0y:=(k1y+2*k2y+2*k3y+k4y)/6;
k0u:=(k1u+2*k2u+2*k3u+k4u)/6;
k0v:=(k1v+2*k2v+2*k3v+k4v)/6;

x:=x0+k0x*h;
y:=y0+k0y*h;
u:=u0+k0u*h;
v:=v0+k0v*h;
t:=t0+h;



if (t>=tmin) then
      begin
      
      
      writeln('x=',x,'u=',u,'y=',y,'v=',v);

      writeln(result,' ',t:9:5,' ',x:9:5,' ',u:9:5,' ',y:9:5,' ',v:9:5);

    end;

x0:=x;
y0:=y;
u0:=u;
v0:=v;
t0:=t;

 until t>(tmin+deltat);


 close(result);
readln;
end.