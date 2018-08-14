% This file deals with plotting the function tanh against its
% anti-derivative and anti-anti derivative expressions to visualise
% how each of these functions approximates the explicit function
lineWidth = 1.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set x axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
grainSize = .1;
minLimit = -2;
maxLimit = 2;
x = minLimit:grainSize:maxLimit;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clipping function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
explicit = tanh(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anti-derivative
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx = grainSize;
x0 = x(2:end);
x1 = x(1:end-1);
antiDerivative = (log(cosh(x0))-log(cosh(x1)))/dx;
adRange = x(1:end-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot to compare
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot (x,explicit, 'DisplayName', 'tanh(x)','LineWidth',lineWidth);
hold on
plot((x0+x1)/2, antiDerivative, 'DisplayName', 'anti-Derivative','LineWidth',lineWidth);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% approximate anti-anti-derivative and plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% FD steps
xx0 = x(3:end);
xx1 = x(2:end-1);
xx2 = x(1:end-2);

for i = 1:2:10
  stepNum = 1000*i;
  tag = sprintf('anti-anti-derivative: %d steps', stepNum);
  aaDerivative = (tanhaad(xx0, stepNum) - 2*tanhaad(xx1, stepNum) + tanhaad(xx2, stepNum))/(dx^2);
  plot(xx1, aaDerivative, 'DisplayName', tag,'LineWidth',lineWidth)
end

legend(gca,'show')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ out ] = tanhaad( in, stepCount )
  % TANHAAD: approximate anti-anti-derivative of tanh function
  %
  % stepCount is the number of grains used to approximate. Most accurate when
  % greater than 10000. Higher stepCount will result in higher computation cost
  out = (spence(-exp(-2*in), stepCount) - in.*(in + 2*log(exp(-2*in) + 1) - 2*log(cosh(in))))/2;
end  % end tanhaad

function out = spence(in, stepCount)
  % SPENCE: Spence's Function approximation
  %
  % For Li_2 (z), z = in
  %
  % stepCount is the number of grains used to approximate. Most accurate when
  % greater than 10000. Higher stepCount will result in higher computation cost
  for i = 1:length(in)

    % stepCount = 10000;
    du = abs(in(i)/stepCount);
    u = linspace(0,in(i),stepCount);
    totalArea = 0;
    y = log(1-u(2))/u(2);
    dy = log(1-u(2))/u(2)+1;

    triangleArea = dy*du*.5;
    rectArea = abs(y-abs(dy))*du;
    totalArea = totalArea + triangleArea + rectArea;

    for k = 3:(stepCount)

      y = log(1-u(k))/u(k);
      dy = log(1-u(k))/u(k)-log(1-u(k-1))/u(k-1);

      triangleArea = dy*du*.5;
      rectArea = (y-abs(dy))*du;
      totalArea = totalArea + triangleArea + rectArea;

    end

    out(i) = totalArea;
  end

end % end spence
