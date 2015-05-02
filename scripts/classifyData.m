function [] = classifyData(file, trainPercent)

[x, y, W, numTrained] = train(file, trainPercent);

[numInstances, numFeatures] = size(x);
[~, numClasses] = size(y);
numClassified = numInstances - numTrained;
yPredicted = zeros(numClassified, numClasses);
fprintf('size(yPredicted\n');
size(yPredicted)

numCorrect = 0;

% data is now already scaled
% we trained on the first 1 though numToTrain, so start
% predictions on numToTrain + 1 through numInstances
for i = numTrained + 1 : numInstances
    predictionVector = (W' * x(i,:)')';
    [maxCol, colIndex] = max(predictionVector);
    yPredicted(i - numTrained,colIndex) = 1;
    
    [~, actualIndex] = max(y(i,:));
    if (colIndex == actualIndex)
        numCorrect = numCorrect + 1;
    end
end

yPredicted
fprintf('Predicted %d correctly of %d -- %f %%\n', numCorrect, numClassified, numCorrect/numClassified);
end