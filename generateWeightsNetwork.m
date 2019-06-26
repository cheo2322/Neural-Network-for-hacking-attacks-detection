function [ Weights, nLayers ] = generateWeightsNetwork( Layers, nInputs )
% Layers: a row vector which indicates the number of neurons per layer.
% nInputs: the number of inputs of the network.
% Weights: cell array of the weight matrices per layer.
nLayers = length(Layers);
Weights{1,1} = generateWeightsLayer(Layers(1), nInputs);
nInputs = Layers(1);
for i=2:nLayers
   Weights{1,i} = generateWeightsLayer(Layers(i), nInputs);
   nInputs = Layers(i);
end
end

