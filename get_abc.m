
%save fitting model's a,b,c in array2 

% have 204 sets

array2=zeros(204,3);


for i=1:204
    % place where we saved our original PointCloud Data files.
    pc = pcread(['/Users/mac/Documents/MATLAB/AI/2. Original Data_TerrainPointCloud/soilPC' num2str(i) '.ply']);
    
    % rotate view
    rotationAngles = [-18 0 0];
    translation = [-0.2 0 0];
    tform = rigidtform3d(rotationAngles,translation);
    ptconverted = pctransform(pc,tform);
    roi = [-0.05 0.00 -0.5 -0.3 -0.8 -0.25];
    in = findPointsInROI(ptconverted,roi);

    ptCloudIn = select(ptconverted,in); 

    cnt=ptCloudIn.Count;
    
    ydata=ptCloudIn.Location(1:cnt,2);
    zdata=ptCloudIn.Location(1:cnt,3);

    % fitting
    quadraticModel = fittype('a*x^2 + b*x + c', 'coefficients', {'a', 'b', 'c'});
    fittedModel = fit(zdata, ydata, quadraticModel);
    a=fittedModel.a;
    b=fittedModel.b;
    c=fittedModel.c;

    %array=[a b c];
    array2(i,1)=a;
    array2(i,2)=b;
    array2(i,3)=c;
  
end
