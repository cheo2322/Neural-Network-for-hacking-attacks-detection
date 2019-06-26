%% Data loading 
load('NewData.mat');
%load('NData');
data = NData;

%load('Enc6E3.mat');
load('CompressedD.mat');
data = [Enc' NData(:,end)];

trSetProportion = 0.7;
valSetProportion = 0.7;

idx = randperm(size(data, 1));
data = data(idx,:);
Data = data(1:floor(trSetProportion*end),:);

trainingData = Data(1:floor(valSetProportion*end),:);
validationData = Data(ceil(valSetProportion*end):end, :);
testSet = data(ceil(end*trSetProportion):end, :);

%% Parameters
LR = 0.1;
nLayers = 3;
nInputs = size(data,2)-1;
Layers = [nInputs 11 1];
beta = 1;
maxEpoc = 300;
errorHistory = [];
validErrHistory=[];

%% Network initialization
Weights = generateWeightsNetwork(Layers, nInputs);
Epoc = 1;
errorNet = networkError(trainingData, Weights, nLayers, beta);
errorHistory = [errorHistory, errorNet];
validationError = networkError(validationData, Weights, nLayers, beta);
validErrHistory=[validErrHistory, validationError];
weightsHistorical{1,1} = Weights;

%% Network training
while Epoc < maxEpoc 
    idx = randperm(size(trainingData,1));
    trainingData = trainingData(idx,:);
    for i=1:size(trainingData,1)
    [I,O,T, LOs] = valoresIOTBackpropagation(trainingData, Weights, i, nLayers, beta);
    errors = backpropagationErrors( Weights, T, O, LOs, nLayers, beta);
    Weights = updateWeights(errors, Weights, I, nLayers, LOs, LR);
    end
    %% Network error each epoch
    errorNet = networkError(trainingData, Weights, nLayers, beta);
    errorHistory = [errorHistory, errorNet];
    %% Network validation error each epoch
    validationError = networkError(validationData, Weights, nLayers, beta);
    validErrHistory=[validErrHistory, validationError];
    Epoc = Epoc + 1;
    disp(Epoc)
    weightsHistorical{1,Epoc} = Weights;
end
figure
plot([1:Epoc], errorHistory, 'b'); hold on;
plot([1:Epoc], validErrHistory, 'g')
legend('Training', 'Validation')
title('Training/validation errors by epochs')

%% Network validation
[~, testWeightInd] = min(validErrHistory); 
testWeights = weightsHistorical{1,testWeightInd};
testError = networkError(testSet, testWeights, nLayers, beta);
disp('Network error over test set ')
disp(testError)
