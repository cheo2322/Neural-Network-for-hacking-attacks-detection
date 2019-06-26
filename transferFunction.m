function [ y ] = transferFunction(beta, h)
y = 1 ./ (1 + exp(-beta.*h));
end

