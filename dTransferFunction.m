function [ y ] = dTransferFunction( beta, x )
y = beta*exp(-beta.*x) ./ (1 + exp(-beta.*x)).^2;
end

