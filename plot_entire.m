% plot original(reference) trajectory of the bucket and save


totalrows=0;
prevrows=0;
for i=1:204

    mydata=readtable(['/Users/mac/Documents/MATLAB/AI/1. Original Data/ex' num2str(i) '.csv']);
    [numRows,numCols] = size(mydata);
    totalrows=totalrows+numRows;
    start=prevrows+1;
    output_plot_array=readtable(['/Users/mac/Documents/MATLAB/AI/output.csv']);
    output_plot=table2array(output_plot_array);
    x=output_plot(start:totalrows,1);
    y=output_plot(start:totalrows,2);
    angle=output_plot(start:totalrows,3)*2*pi/360;
    u=cos(angle);
    v=sin(angle);

    prevrows=totalrows;
    quiver(x,y,u,v,0.5)
    figure1=quiver(x,y,u,v,0.5);
    savefig(['figure/fig' num2str(i) '_output.fig']);
end