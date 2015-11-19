int xP1 = 100;
int yP1 = 100;

int len = 50;

int xP2 = 100;
int yP2 = yP1 - len;

int segmentCount = 5;

float angle = 360 / segmentCount;

size(640, 360);
noSmooth();
background(0);
stroke(153);

line(xP1, yP1, xP2, yP2);

/*
Winkel = Drehwinkel in Grad (0-360)
X = alte X-Koordinate
Y = alte Y-Koordinate
Xn = neue X-Koordinate
Yn = neue y-Koordinate
Xc = X-Koordinate des Zentrums
Yc = Y-Koordinate des Zentrums
u und d Hilfsvariablen (typ extended)

u:= Winkel * Pi/180 + arctan2(Y-Yc,X-Xc);
d:= sqrt((X-Xc)*(X-Xc) + (Y-Yc)*(Y-Yc));
xn:=round(Xc+d*cos(u));
yn:=round(Yc+d*sin(u));
*/

float u = angle * PI / 180 + atan2(yP2-yP1,xP2-xP1);
float d = sqrt((xP2-xP1)*(xP2-xP1) + (yP2-yP1)*(yP2-yP1));
float xP3 = round(xP1 + d*cos(u));
float yP3 = round(yP1 + d*sin(u));

line(xP1, yP1, xP3, yP3);

line(xP2, yP2, xP3, yP3);