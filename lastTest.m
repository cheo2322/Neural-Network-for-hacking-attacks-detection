%function [R] = lastTest(Data, Weights, nLayers, beta)
load('autoenc.mat');
%load('testSet.mat');
load('LastTest.mat');
data = NData;
load('testWeights1.mat');
load('NewData.mat');
%load('CompressedD.mat');

%data = NData';

nLayers = 3;
nInputs = 19;
Layers = [nInputs 11 1];

Non = [];
good = 0;
falseP = 0;
falseN = 0;
wtf = 0;

% for j=1:size(NData,1)
%     c = NData(j, 1:end-1);
%    %inputs = [encode(autoenc, c'); NData(j,end)]';
%    inputs = [encode(autoenc, c'); -1]';
%    %inputs = [Data(:,1:end-1), -1*ones(size(Data,1),1)];
%    layer = transferFunction(1, inputs*testWeights{1,1}(:,:));
%    for i=2:nLayers
%        layer = transferFunction(1, [layer, 1*ones(size(layer,1),1)]*testWeights{1,i}(:,:));
%    end
%    
%    layer1 = round(layer);
%    
%    if (layer1 == NData(j,end))
%        good = good+1;
%    elseif (layer1 == 0 && NData(j,end) == 1)
%        falseN = falseN+1;
%        Non = [Non; j 0 layer];
%    elseif (layer1 == 1 && NData(j,end) == 0)
%        falseP = falseP+1;
%        Non = [Non; j 1 layer];
%    else
%        wtf = wtf+1;
%    end   
% %R = (1/size(Data, 1))*sum((Data(:,end) - layer).^2);
%    
% end

%Encoder = encode(autoenc, NData(:,1:end-1)');

%testError = networkError([Encoder' NData(:,end)], testWeights, 3, 1);
%Enc = encode(autoenc, data);
%Data = predict(autoenc, data);
%mse(data-Data)

%matrix = [];
tic
Encode = encode(autoenc, [NData(:,1:end-1); data(:,1:end-1)]');
Encode = Encode(:, size(NData,1)+1:end);

for i = 1:size(data,1)
    %Encode = encode(autoenc, [NData(:,1:end-1); data(i,1:end-1)]');
    %value = networkErrorLayer([Encode(:,end)' NData(i,end)], testWeights, 3, 1);
    
    value = networkErrorLayer([Encode(:,i)' NData(i,end)], testWeights, 3, 1);
 
    if value == 0
        good = good+1;
    elseif value == -1
        falseP = falseP+1;
        Non = [Non; i 1 value];
    elseif value == 1
        falseN = falseN+1;
        Non = [Non; i 0 value];
    else
        wtf = wtf+1;
    end         
end
toc
% testSet = [Enc' NData(:,end)];
% for i = 1:size(testSet,1)
%     value = networkErrorLayer(testSet(i,:), testWeights, 3, 1);
%     if value == 0
%         good = good+1;
%     elseif value == -1
%         falseP = falseP+1;
%         Non = [Non; i 1 value];
%     elseif value == 1
%         falseN = falseN+1;
%         Non = [Non; i 0 value];
%     else
%         wtf = wtf+1;
%     end         
% end


s = strcat('good = ', int2str(good), ' falseN = ', int2str(falseN), ' falseP = ', int2str(falseP));
   disp(s);
