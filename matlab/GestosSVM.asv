load('WS N.mat');
%Normalizaciòn de la matriz
SamplesNorm = horzcat(getNormalized(SAMPLES), LABELS);
K = 5; %Numero de folds 
classRow = length(SamplesNorm(1, :)); %Renglon de las clases
% predictedTotalLabels = zeros(1);

%La funcion getFolds recibe la matriz de features con la ultima columna de
%las clases y devuelve 5 filds 
[Fold1, Fold2, Fold3, Fold4, Fold5] = getFolds(SamplesNorm);

%Entrenamiento del algoritmo. Los puntos de Training y Test se corrieron en
%5 ocaciones diferentes en el caso de cada una de ellas cambaindo los folds
%de Test y Training
Training = vertcat(Fold1, Fold2, Fold3, Fold4); %Concatena verticalmente todos los folds 
labelsTraining = Training(:, classRow); %Guarda la columna de las clases
Training(:, classRow) = []; %Se borro la columna de las clases
%c = cvpartition(labelsTraining, 'k', 5);

%Prueba del algoritmo 
Test = Fold5;
labelsTest = Test(:, classRow); %Guarda la columna de las clases 
Test(:, classRow) = []; %se borro la columna de las clases

Model = svmtrain(labelsTraining, Training, '-s 0'); %Creación del modelo de entrenamiento 
%Predicción del modelo de entrenamietno
[predicted_label, accuracy, prob_estimates] = svmpredict(labelsTest, Test, Model, '-b 0');

%La funcion getResults recibe eun vector de los valores reales de las
%clases y recibe el vector de predicción del svmpredict. El primer valor de
%results son los verdaderos positivos, el segundo son los falsos positivos
%y el ultimo guarda los falsos negativos
results = getResults(trueLabels, predictedLabels);
Precision = (results(1) / results(1)+results(2))^-1;
Recall = (results(1) / results(1)+results(3))^-1;
F_Score = ((Recall+Precision) / 2)^-1; 

% trueTotalLabels = vertcat(Fold1(:, classRow), Fold2(:, classRow), Fold3(:, classRow),...
%      Fold4(:, classRow), Fold5(:, classRow));
%predictedTotalLabels = vertcat(predictedTotalLabels, predicted_label);
% predictedTotalLabels(1) = [];






