function [ Normalized ] = getNormalized( Matrix )
%Funcion para normalizar Features
    Rows = length(Matrix(:, 1)); 
    Columns = length(Matrix(1, :));
    Normalized = zeros(size(Matrix)); 
    
    for c = 1 : Columns
            small = min(Matrix(:, c)); %Valor minimo de la columna c
            maximum = max(Matrix(:, c)); %Valor maimo de la columna c
        for r = 1 : Rows
            Normalized(r, c) = (Matrix(r, c) - small) / (maximum - small); %Normalización
        end
    end
end