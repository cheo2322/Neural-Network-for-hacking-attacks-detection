load('FlowDuration.mat')
plot(FlowDuration);
m = min(FlowDuration);
M = max(FlowDuration);
axis([0 length(FlowDuration) m M]);
% disp(max(FlowDuration));
% minF = min(FlowDuration);
% disp(minF);
% 
% for i=2:length(FlowDuration)
%     %if FlowDuration(i) == minF
%     if isnan(FlowDuration(i))
%         disp('TK');
%     end
% end
hold on
NM = nanmean(FlowDuration);
plot((0:length(FlowDuration)), NM, 'r*')

figure
Mm = M-m;
matriz = [];
for i=1:length(FlowDuration)
    matriz(i) = (FlowDuration(i)-m)/Mm;
end
plot(matriz)
axis([0 length(matriz) 0 1])