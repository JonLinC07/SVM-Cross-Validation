function [ F1, F2, F3, F4, F5 ] = getFolds( Matrix )
    
    K = 5; %Numero de folds 
    classRow = length(Matrix(1, :)); %Renglon en donde se encuentran las clases
    vectorClass = unique(Matrix(:, classRow)); %Vector de clases
    %Inicialización de los Folds con un renglon en ceros
    F1 = zeros(1, classRow);
    F2 = zeros(1, classRow);
    F3 = zeros(1, classRow);
    F4 = zeros(1, classRow);
    F5 = zeros(1, classRow);
    
    for c = 1 : length(vectorClass) %De 1 hasta la longitud del vector de clases
        currentClass = Matrix(Matrix(:, classRow) == vectorClass(c), :); %Matriz de la clase c
        lenF = round(length(currentClass) / K); %Numero de registros que almacenara cada Fold 
        %Dividiendo la clase actual en 5 partes diferentes
        part1 = currentClass(1 : lenF, :);
        part2 = currentClass(lenF+1 : lenF*2, :);
        part3 = currentClass((lenF*2)+1 : lenF*3, :);
        part4 = currentClass((lenF*3)+1 : lenF*4, :);
        part5 = currentClass((lenF*4)+1 : length(currentClass), :);
        %Asignandole cada parte de la clase a cada Fold
        F1 = vertcat(F1, part1);
        F2 = vertcat(F2, part2);
        F3 = vertcat(F3, part3);
        F4 = vertcat(F4, part4);
        F5 = vertcat(F5, part5);
    end
        %Eliminando el primer renglon de cada clase (se inicializo en 0)
        F1(1, :) = [];
        F2(1, :) = [];
        F3(1, :) = [];
        F4(1, :) = [];
        F5(1, :) = [];
end
%Hardcode ON