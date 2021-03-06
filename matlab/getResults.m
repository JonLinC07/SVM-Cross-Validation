function Results = getResults( trueLabels, predictedLabels )

    allValues = horzcat(trueLabels, predictedLabels);
    trueValues = horzcat(trueLabels(trueLabels == predictedLabels, :),...
        predictedLabels(trueLabels == predictedLabels, :)); %Matriz con todos los valores 
    
    truePositives = sum(trueLabels == predictedLabels); %Calculo de los vedaderos positivos 
    Results(1) = truePositives; %Inizializa en ceros la mariz 
    %Matriz temporal que guarda todos los errores 
    temporalMatrix = horzcat(trueLabels(trueLabels ~= predictedLabels, :),...
        predictedLabels(trueLabels ~= predictedLabels, :));
    
    falsePositive = sum(temporalMatrix(:, 2) == 4); %Calculo de los falsos positivos 
    falseNegative = sum(temporalMatrix(:, 2) == 2); %Calculo de los falsos negativos 
    %Guarda todos los resultados 
    Results = vertcat(Results, falsePositive, falseNegative);
   
    %Matriz con los resultados de la clase benignos (2)
%     valuesBen = allValues(allValues(:, 1) == 2, :); 

    %Concatena en el cuarto renglon la suma de los aciertos y en 5to guarda 
    %el porcentaje de acierto 
    Results = vertcat(Results, sum(trueValues(:, 2) == 2),...
        sum(trueValues(:, 2) == 2) / sum(allValues(:, 1) == 2));
    
    %Matriz con los resultados de la clase malignos (4)
%     valuesMal = allValues(allValues(:, 1) == 4, :); 

    %Concatena en el 6to renglon el numero total de acierto de los tumores
    %benignos de la clase 4 y en el 7mo guarda el porcentaje de acierto
    Results = vertcat(Results, sum(trueValues(:, 2) == 4),...
        sum(trueValues(:, 2) == 4) / sum(allValues(:, 1) == 4));
end