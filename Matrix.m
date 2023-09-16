
%%general case rotation matrix: I
x = 1;%%modify para
y = 0;%%modify para
z = 0;%%modify para
w = 35/180*pi;%%modify para
%%G = genI(x,y,z,w);

%%pass throught the point for the general rotation matrix 
xPass = 2;%%modify para
yPass = 4;%%modify para
zPass = -5;%%modify para
%%F = passI(xPass,yPass,zPass,G);

%%InverseT
aTb = [1 0 0 2
       0 0.8192 -0.5736 4
       0 0.5736 0.8192 -5
       0 0 0 1];
InvT(aTb);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%function Definition%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%general case rotation matrix I
function I = genI(x,y,z,w)
u = (x^2+y^2+z^2)^0.5;
mx = x/u;

my = y/u;
mz = z/u;
I = [(mx)^2*(1-cos(w))+cos(w) (mx*my)*(1-cos(w))-mz*(sin(w)) (mx*mz)*(1-cos(w))+my*(sin(w))
     (mx*my)*(1-cos(w))+mz*(sin(w)) (my)^2*(1-cos(w))+cos(w) (my*mz)*(1-cos(w))-mx*(sin(w))
     (mx*mz)*(1-cos(w))-my*(sin(w)) (my*mz)*(1-cos(w))+mx*(sin(w)) (mz)^2*(1-cos(w))+cos(w)];
 disp("general case rotation matrix I = ");
disp(I); 
end

%%pass throught the point for the general rotation matrix 
function TPass = passI(xPass,yPass,zPass,I)
Jtrans = [1 0 0 xPass
     0 1 0 yPass
     0 0 1 zPass
     0 0 0 1];
Jback = [1 0 0 -xPass
     0 1 0 -yPass
     0 0 1 -zPass
     0 0 0 1];
 I(end+1, :) = 0;
 I(:, end+1) = [0 0 0 1];%%add (0 0 0) point poistion
 TPass  = Jtrans * I * Jback;
 disp("pass throught the point for the general rotation matrix TResult = ");
 disp(TPass);
end

%%InverseT
function InvT = InvT(T) 
R_inT  = T(1:3,1:3);
R_t =transpose(R_inT);
disp(R_t);
Point = T(1:3,4);
disp(Point);
PointRotate = -R_t*Point;
disp(PointRotate);
InvT = R_t;
InvT(end+1, :) = 0;
InvT(4,end+1) = [1];
InvT(1:3,end) = [PointRotate];
disp("InverseT = ");
disp(InvT);
end