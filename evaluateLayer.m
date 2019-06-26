function [ Output ] = evaluateLayer( Input, Weights, beta )
% Input: a row vector of the inputs of the layer, it does not include the -1.
% Weights: a weight matrix the columns represent the weights of each
% neuron.
Output = transferFunction(beta, [Input, -1]*Weights);
end

