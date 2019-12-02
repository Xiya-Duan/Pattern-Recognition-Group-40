f = @(x,y) -1/4*x.^2+2*x +3/8*y.^2+1/8*y-49/8+log(0.15)-log(0.7)+0.5*log(2);
fimplicit(f,[-10 20 -10 20]);
xlabel('x');
ylabel('y');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
