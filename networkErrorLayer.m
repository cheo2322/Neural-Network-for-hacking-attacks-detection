function [R] = networkErrorLayer(Data, Weights, nLayers, beta)
inputs = [Data(:,1:end-1), -1*ones(size(Data,1),1)];
layer = transferFunction(beta, inputs*Weights{1,1}(:,:));
for i=2:nLayers
    layer = transferFunction(beta, [layer, -1*ones(size(layer,1),1)]*Weights{1,i}(:,:));
end
R = Data(:,end) - round(layer);
end