function [ Errors ] = backpropagationErrors( Weights, Target, Output, layerOutputs, nLayers, beta)
deltaNextLayer = dTransferFunction(beta, Output).*(Target - Output);
Errors{1,nLayers} = deltaNextLayer; % Last Layer delta.
for i=nLayers-1:-1:1
    s = sum(Weights{1,i+1}(1:end-1,:)*deltaNextLayer, 2);
    dd = dTransferFunction(beta, layerOutputs{1,i}(:,:))';
    delta = dd.*s;
    Errors{1, i}=delta;
    
end
end

