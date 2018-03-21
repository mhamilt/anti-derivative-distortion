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
