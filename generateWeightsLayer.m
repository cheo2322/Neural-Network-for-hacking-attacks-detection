function [ layerWeights ] = generateWeightsLayer( nNeurons, nInputs )
layerWeights = rand(nInputs + 1, nNeurons);
end

