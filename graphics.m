figure
subplot(2,2,1)
r1 = floor(rand*size(data,2));
plot(data(:,r1), 'b');
hold on
plot(Data(:,r1), 'r');
hold off
axis([1 78 0 1]);
title(strcat('Input: ', int2str(r1)));
legend('Original input', 'Prediction');

%subplot(8,2,3)
%plot(Enc(:,r1), 'go');
%axis([0 20 0 1]);
%title('Hidden layer output');

%
subplot(2,2,2)
r2 = floor(rand*size(data,2));
plot(data(:,r2), 'b');
hold on
plot(Data(:,r2), 'r');
hold off
axis([1 78 0 1]);
title(strcat('Input: ', int2str(r2)));

%subplot(8,2,4)
%plot(Enc(:,r1), 'go');
%axis([0 20 0 1]);
%title('Hidden layer output');

%
subplot(2,2,3)
r3 = floor(rand*size(data,2));
plot(data(:,r3), 'b');
hold on
plot(Data(:,r3), 'r');
hold off
axis([1 78 0 1]);
title(strcat('Input: ', int2str(r3)));

%
subplot(2,2,4)
r4 = floor(rand*size(data,2));
plot(data(:,r4), 'b');
hold on
plot(Data(:,r4), 'r');
hold off
axis([1 78 0 1]);
title(strcat('Input: ', int2str(r4)));

%%%%%%%%%
figure
subplot(2,2,1)
plot(Enc(:,r1), 'go');
axis([1 19 0 1]);
title(strcat('Input: ', int2str(r1)));

subplot(2,2,2)
plot(Enc(:,r2), 'go');
axis([1 19 0 1]);
title(strcat('Input: ', int2str(r2)));

%
subplot(2,2,3)
plot(Enc(:,r3), 'go');
axis([1 19 0 1]);
title(strcat('Input: ', int2str(r3)));

%
subplot(2,2,4)
r4 = floor(rand*size(data,2));
plot(Enc(:,r4), 'go');
axis([1 19 0 1]);
title(strcat('Input: ', int2str(r4)));