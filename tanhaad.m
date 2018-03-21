function [ out ] = tanhaad( in, stepCount )
  % TANHAAD: approximate anti-anti-derivative of tanh function
  %
  % stepCount is the number of grains used to approximate. Most accurate when
  % greater than 10000. Higher stepCount will result in higher computation cost
  out = (spence(-exp(-2*in), stepCount) - in.*(in + 2*log(exp(-2*in) + 1) - 2*log(cosh(in))))/2;
end  % end tanhaad
