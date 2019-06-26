%load('NData.mat');
load('NewData.mat');
data = NData(:,1:end-1)';
autoenc = trainAutoencoder(data, 19, 'MaxEpochs', 1200, 'L2WeightRegularization',0.00001);
Enc = encode(autoenc, data);
%Dec = decode(autoenc, Enc);
Data = predict(autoenc, data);
mse(data-Data)
%Data = [Data' NData(:,end)];

for i=1:size(Data,2)
    subplot(2,1,1)
    plot(data(:,i), 'b');
    hold on
    plot(Data(:,i), 'r');
    hold off
    axis([0 80 0 1]);
    
    subplot(2,1,2)  
    plot(Enc(:,i), 'go');
    axis([0 20 0 1]);
    %plot(Dec(i,:));
    
    pause(0.05);
end