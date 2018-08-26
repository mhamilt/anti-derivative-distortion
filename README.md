# anti-derivative-distortion
Code relating to integrating clipping functions and using finite difference to suppress aliasing

# Contents

## antiDerivativePlot.m
This script will plot a tanh function against the anti-anti-derivate function at increasing number of discrete steps. The output can be found below.

## Spence.m
An approximation of integrating spence's function in MATLAB. The function takes the form `spence(x, steps)` for an array x where steps is the number of grid points used in the approximation. The integral is approximated by summing the a rectangular and triangular area underneath the function `x` between discrete steps.

### integral appoximation
<img style="display: block;margin-left: auto;margin-right: auto;width: 25%;" src="https://github.com/mhamilt/anti-derivative-distortion/blob/master/images/integral_approximation.png">

## tanhaad.m
The operation of performing the anti-anti-derivative on a tanh function. This is essentially a second order finite difference operation.

# Output plots

### Output
<img src="https://github.com/mhamilt/anti-derivative-distortion/blob/master/images/antiDivFull.png" width="50%" height="50%">

### Divergence
<img src="https://github.com/mhamilt/anti-derivative-distortion/blob/master/images/antiDivDiverge.png" width="50%" height="50%">

## Matlab script notes
Earlier versions of MATLAB take umbrage with defining functions in the same file as a script. Should you encounter any problems, cut and paste the functions at the end of scripts into a separate document.

### Version Notes
All Matlab scripts written on macOS MATLAB 9.1.0.441655 (R2016b)
