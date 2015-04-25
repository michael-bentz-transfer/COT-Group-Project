function [ W, minX, maxX ] = train(filename, numToTrain)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% first column should be classes, others are features
A = dlmread(filename);

% TODO: randomize 

yRaw = A(1:numToTrain,1);
xRaw = A(1:numToTrain,2:end);

[numInstances, numFeatures] = size(xRaw);

classes = [];
for i = 1:numInstances
    if ~ismember(yRaw(i), classes)
        classes = [classes; yRaw(i)];
    end
end

% create actual y matrix
y = zeros(150, length(classes));
for i = 1:numInstances
    class = yRaw(i);
    y(i, class) = 1;
end

% create actual x matrix by scaling per column
% this will scale between zero and one?
maxX = max(xRaw,[],1);
minX = min(xRaw,[],1);
bsxfun(@times, bsxfun(@minus, xRaw, minX), 1./abs(maxX - minX))

% use equation 5 to compute W
left = zeros(numFeatures);
% for i = 1:numToTrain


end

