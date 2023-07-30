%2023.07.25
%trainnetwork with train and test 

[numRows,numCols]=size(input);
inputSize=numRows;
numFeatures = 1;
numObservations = 16;
sequenceLength = 64;
numHiddenUnits = 64;
numhiddenlayer1=32;
numhiddenlayer2=32;
numhiddenlayer3=3;


final_layers = [ ...
    featureInputLayer(numCols)
    flattenLayer
    gruLayer(numHiddenUnits)
    flattenLayer
    fullyConnectedLayer(numhiddenlayer1)
    reluLayer
    fullyConnectedLayer(numhiddenlayer2)
    reluLayer
    fullyConnectedLayer(numhiddenlayer3)
    regressionLayer];

    options = trainingOptions('adam', ...
    'MaxEpochs',5,...
    'MiniBatchSize',10, ...
    'InitialLearnRate',0.01, ...
    ValidationData={input_test,output_test}, ...
    ValidationFrequency=30,...
    Verbose=false, ...
    Plots='training-progress');


lgraph = layerGraph(final_layers);

%plot(lgraph)
net=trainNetwork(input,output,final_layers,options);