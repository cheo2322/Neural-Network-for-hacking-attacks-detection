function [  Input, Output, Target, layerOutputs ] = valoresIOTBackpropagation( Data, Weights, i, nLayers, beta)
% Data: matrix includes the inputs and desired outputs.
% Weights: Is a cell array where each cell contains the weights of any
% given layer, with size 1xnLayers.
% i: The pattern index to be evaluated.
% nLayers : Is the number of layers.
Input = Data(i,1:end-1);
Target = Data(i, end);
wl1 = Weights{1,1}(:,:);
Output = evaluateLayer(Input, wl1, beta);
layerOutputs{1,1} = Output;
for i=2:nLayers
   wl = Weights{1,i}(:,:);
   Output = evaluateLayer(Output, wl, beta); 
   layerOutputs{1,i} = Output;
end
end

