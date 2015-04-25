numToTrain = 50;
[x, y, W, minX, maxX] = train('../datasets/iris-number-classes-rand.data', numToTrain);

[numInstances, numFeatures] = size(x);
[~, numClasses] = size(y);
yPredicted = zeros(numInstances - numToTrain, numClasses);

W
x

% data is now already scaled
for i = 1:numInstances
    yPredicted(i,:) = (W' * x(i,:)')';
end

yPredicted