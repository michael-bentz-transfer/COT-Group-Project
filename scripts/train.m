function [ x, y, W, numTrained ] = train(filename, trainPercent)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% first column should be classes, others are features
Data = dlmread(filename);

if (nargin < 2)
    trainPercent = 100;
end

% TODO: choose a random sample from A of size numToTrain
yRaw = Data(:,1);
xRaw = Data(:,2:end);

[numInstances, numFeatures] = size(xRaw);

numToTrain = round((trainPercent / 100) * numInstances);

classes = [];
for i = 1:numInstances
    if ~ismember(yRaw(i), classes)
        classes = [classes; yRaw(i)];
    end
end

numClasses = length(classes);

% create actual y matrix
y = zeros(numInstances, numClasses);
for i = 1:numInstances
    class = yRaw(i);
    y(i, class) = 1;
end

% create actual x matrix by scaling per column
% this will scale between zero and one?
maxX = max(xRaw,[],1);
minX = min(xRaw,[],1);
x = bsxfun(@times, bsxfun(@minus, xRaw, minX), 1./abs(maxX - minX));

% use equation 5 to compute W

% do each sum independently
left = zeros(numFeatures);
right = zeros(numFeatures, numClasses);
for i = 1:numToTrain
    x_i = x(i,:)';
    y_i = y(i, :)';
    
    left = left + x_i * x_i';
    right = right + x_i * y_i';
end

% TODO: make sure that left sum is invertible; if not, add some mu * eye()
W = inv(left) * right;
numTrained = numToTrain;

end

