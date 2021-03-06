clf;

in_to_ft = 1/12;
ft_to_m = 0.3048;
in_to_m = in_to_ft*ft_to_m;

FIELD_W = (26 + 11.25/12)*ft_to_m;
FIELD_H = (52 + 5.25/12)*ft_to_m;

x0 = 5.58 * ft_to_m;
y0 = 16.21875 * ft_to_m;

figure(1);
hold on;

% initialization lines
line([-FIELD_W/2, FIELD_W/2], [y0, y0]);
line([-FIELD_W/2, FIELD_W/2], [-y0, -y0]);

% rendez-vous
line([43.75*in_to_m, 112.88*in_to_m], [116.00*in_to_m, -51.06*in_to_m]);
line([-116.00*in_to_m, 51.06*in_to_m], [43.75*in_to_m, 112.88*in_to_m]);
line([-43.75*in_to_m, -112.88*in_to_m], [-116.00*in_to_m, 51.06*in_to_m]);
line([116.00*in_to_m, -51.06*in_to_m], [-43.75*in_to_m, -112.88*in_to_m]);

% trench run balls
ball_1 = [x0 + 66.91*in_to_m, y0 - 122.63*in_to_m];
ball_2 = [x0 + 66.91*in_to_m, y0 - 158.63*in_to_m];
ball_3 = [x0 + 66.91*in_to_m, y0 - 194.63*in_to_m];

viscircles(ball_1, 3.5*in_to_m, "Color", "y");
viscircles(ball_2, 3.5*in_to_m, "Color", "y");
viscircles(ball_3, 3.5*in_to_m, "Color", "y");

viscircles(-[x0 + 66.91*in_to_m, y0 - 122.63*in_to_m], 3.5*in_to_m, "Color", "y");
viscircles(-[x0 + 66.91*in_to_m, y0 - 158.63*in_to_m], 3.5*in_to_m, "Color", "y");
viscircles(-[x0 + 66.91*in_to_m, y0 - 194.63*in_to_m], 3.5*in_to_m, "Color", "y");

viscircles([x0 - 191.43*in_to_m, y0 - 130.36*in_to_m], 3.5*in_to_m, "Color", "y");
viscircles([-3.639058000000000, y0 - 130.36*in_to_m], 3.5*in_to_m, "Color", "y");

viscircles(-[x0 - 191.43*in_to_m, y0 - 130.36*in_to_m], 3.5*in_to_m, "Color", "y");
viscircles(-[-3.639058000000000, y0 - 130.36*in_to_m], 3.5*in_to_m, "Color", "y");

angle = pi/4;
R = [
    cos(angle), -sin(angle);
    sin(angle), cos(angle);
];

% robot
ts = [0, 7, 8, 9];
tq = 0:0.1:9;
xs = [x0, ball_1(1), ball_2(1), ball_3(1)];
ys = [y0, ball_1(2), ball_2(2), ball_3(2)];

angle0 = 3*pi/2 + angle;
spline = R'*spline(ts, R*[xs; ys], tq);
%y_spline = spline(ts, [-2, ys, 0], tq);

plot(x0, y0, "g*");
plot(spline(1,:), spline(2,:), "k");
axis([-FIELD_W/2, FIELD_W/2, -FIELD_H/2, FIELD_H/2]);
daspect([1, 1, 1]);
hold off;