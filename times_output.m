%make input and output array

totalrows=0;
prevrows=0;

times=5;
times_b=21;
for i=1:204
    % place where we saved out reference movement data.
    mydata=readtable(['/Users/mac/Documents/MATLAB/AI/1. Original Data/ex' num2str(i) '.csv']);
    [numRows,numCols] = size(mydata);
    totalrows=totalrows+numRows;
    start=prevrows+1;

    output_table(start:totalrows,1:3)=mydata(1:numRows,7:9);
    inputstart=start;
    time=0;
    for j=1:numRows
       input(inputstart,1:3)=array2(i,1:3);
       input(inputstart,4)=time;
       inputstart=inputstart+1;
       time=time+0.1;
    end
    prevrows=totalrows;
end

output=table2array(output_table);
for j=1:18278
    output(j,2)=output(j,2)*times;
    output(j,3)=output(j,3)/times_b;
end

%divide to train & test set
input_train=input(1:11962,:);
input_test=input(11963:18278,:);
output_test=output(11963:18278,:);
output_train=output(1:11962,:);