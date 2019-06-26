function [R] = updateWeights(Errors, Weights, Input, nLayers, LayerOutputs, LR)
dW = LR*[Input, -1]'*Errors{1,1}(:,:)';
Weights{1,1}(:,:) = Weights{1,1}(:,:) + dW;
for i=2:nLayers
    dW = LR*[LayerOutputs{1,i-1}(:,:), -1]'*Errors{1,i}(:,:)';
    Weights{1,i}(:,:) = Weights{1,i}(:,:) + dW;
end
R = Weights;
end