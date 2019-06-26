load('NewData');
load('Enc6E3.mat');
testSet = [Enc' NData(:,end)];

load('Weights.mat')
Weights = testWeights;

%% Parameters
LR = 0.1;
nLayers = 3;
nInputs = size(testSet, 2)-1;
Layers = [nInputs 7 1];
beta = 1;

%%

testError = networkError(testSet, Weights, nLayers, beta);
disp('Network error over test set ')
disp(testError)