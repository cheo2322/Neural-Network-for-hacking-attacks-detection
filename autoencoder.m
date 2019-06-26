function [Data] = autoencoder(data)
%autoenc = trainAutoencoder(data, 11, 'MaxEpochs', 500);
autoenc = trainAutoencoder(data, 11, 'MaxEpochs', 500);
Data = predict(autoenc, data);
%for i=1:size(Data,1)
 %   plot(data(i,1:end-1), 'b');
  %  hold on
   % plot(Data(i,1:end-1), 'r');
%end
%figure;
%plot(data(55,:), 'b');
%hold on
%plot(Data(55,:), 'r');