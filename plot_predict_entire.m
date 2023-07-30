% plot predicted trajectory of the bucket and save it.

totalrows=0;
prevrows=0;
for i=1:204

    mydata=readtable(['/Users/mac/Documents/MATLAB/AI/1. Original Data/ex' num2str(i) '.csv']);
    [numRows,numCols] = size(mydata);
    totalrows=totalrows+numRows;
    start=prevrows+1;


    predict_array_20_table=readtable('/Users/mac/Documents/MATLAB/AI/predict_array_20.csv');
    predict_array_20=table2array(predict_array_20_table);
    x_p=predict_array_20(start:totalrows,1);
    y_p=predict_array_20(start:totalrows,2);
    angle_p=predict_array_20(start:totalrows,3)*2*pi/360;
    u_p=cos(angle_p);
    v_p=sin(angle_p);

    prevrows=totalrows;
    quiver(x_p,y_p,u_p,v_p,0.5) 
    figure2=quiver(x_p,y_p,u_p,v_p,0.5);
    savefig(['figure/fig' num2str(i) '_predict.fig']);
end