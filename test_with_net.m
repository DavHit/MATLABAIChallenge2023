% 2023.07.25

% verify if the net is working properly


predict_array = net.predict(input(1:18278,:));

for j=1:18278
    output(j,2)=output(j,2)/times;
    output(j,3)=output(j,3)*times_b;
    predict_array_18(j,2)=predict_array_18(j,2)/times;
    predict_array_18(j,3)=predict_array_18(j,3)*times_b;
end
