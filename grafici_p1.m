%% Risultati P1
%%                             16x16 SPAZIO entropia e media parti
%% counter e accuratezza
for z=1:5
    %in questa maniera prendo il counter di quella coppia di feature (
    %entropia e media_parti) tutti i rumori 
    vettore_counter(z) = DB(z).database(1).dimensione(1).dominio(5).immagini(3).matrice.counter;
    vettore_accuracy(z) = DB(z).database(1).dimensione(1).dominio(5).immagini(3).matrice.accuratezza;
end

media_counter = mean(vettore_counter);
media_accuracy = mean(vettore_accuracy);
std_counter = std(vettore_counter);
std_accuracy = std(vettore_accuracy);

%% recall e precision
%creiamo matrice con tutte le recall
for z= 1:5
    for i= 1:11
       matrice_recall(i,z) = DB(z).database(1).dimensione(1).dominio(5).immagini(3).matrice.recall(i).recall;
       matrice_precision(i,z) = DB(z).database(1).dimensione(1).dominio(5).immagini(3).matrice.precision(i).precision;
    end
end

media_recall = mean(matrice_recall,2);
media_precision = mean(matrice_precision,2);
std_recall = std(matrice_recall,0,2);
std_precision = std(matrice_precision,0,2);




%%                             32x32 SPAZIO entropia e media parti
%% counter e accuratezza
for z=1:5
    %in questa maniera prendo il counter di quella coppia di feature (
    %entropia e media_parti) tutti i rumori 
    vettore_counter_32s(z) = DB(z).database(2).dimensione(1).dominio(5).immagini(3).matrice.counter;
    vettore_accuracy_32s(z) = DB(z).database(2).dimensione(1).dominio(5).immagini(3).matrice.accuratezza;
end

media_counter_32s = mean(vettore_counter_32s);
media_accuracy_32s = mean(vettore_accuracy_32s);
std_counter_32s = std(vettore_counter_32s);
std_accuracy_32s = std(vettore_accuracy_32s);

%% recall e precision
%creiamo matrice con tutte le recall
for z= 1:5
    for i= 1:11
       matrice_recall_32s(i,z) = DB(z).database(2).dimensione(1).dominio(5).immagini(3).matrice.recall(i).recall;
       matrice_precision_32s(i,z) = DB(z).database(2).dimensione(1).dominio(5).immagini(3).matrice.precision(i).precision;
    end
end

media_recall_32s = mean(matrice_recall_32s,2);
media_precision_32s = mean(matrice_precision_32s,2);
std_recall_32s = std(matrice_recall_32s,0,2);
std_precision_32s = std(matrice_precision_32s,0,2);



%%                            16x16 FREQUENZA Simmetria e Entropia
%% counter e accuratezza
for z = 1 : 5 
   %migliore simmetria e entropia
    vettore_counter_16f(z) = DB(z).database(1).dimensione(2).dominio(5).immagini(5).matrice.counter;
    vettore_accuracy_16f(z) = DB(z).database(1).dimensione(2).dominio(5).immagini(5).matrice.accuratezza;
    for j = 1 : 11
        matrice_recall_16f(j,z) = DB(z).database(1).dimensione(2).dominio(5).immagini(5).matrice.recall(j).recall;
        matrice_precision_16f(j,z) = DB(z).database(1).dimensione(2).dominio(5).immagini(5).matrice.precision(j).precision;
    end
end

media_accuracy_16f = mean(vettore_accuracy_16f);
media_counter_16f = mean(vettore_counter_16f);
std_counter_16f = std(vettore_counter_16f);
std_accuracy_16f = std(vettore_accuracy_16f);

 media_recall_16f =  mean(matrice_recall_16f,2);
 std_recall_16f = std(matrice_recall_16f,0,2);    
 media_precision_16f = mean(matrice_precision_16f,2);
 std_precision_16f= std(matrice_precision_16f,0,2);


 
%%                            32x32 FREQUENZA Simmetria e Entropia

for z = 1 : 5 
   %migliore simmetria e entropia
    vettore_counter_32f(z) = DB(z).database(2).dimensione(2).dominio(5).immagini(5).matrice.counter;
    vettore_accuracy_32f(z) = DB(z).database(2).dimensione(2).dominio(5).immagini(5).matrice.accuratezza;
    for j = 1 : 11
        matrice_recall_32f(j,z) = DB(z).database(2).dimensione(2).dominio(5).immagini(5).matrice.recall(j).recall;
        matrice_precision_32f(j,z) = DB(z).database(2).dimensione(2).dominio(5).immagini(5).matrice.precision(j).precision;
    end
end

media_accuracy_32f = mean(vettore_accuracy_32f);
media_counter_32f = mean(vettore_counter_32f);
std_counter_32f = std(vettore_counter_32f);
std_accuracy_32f = std(vettore_accuracy_32f);

media_recall_32f =  mean(matrice_recall_32f,2);
std_recall_32f = std(matrice_recall_32f,0,2);    
media_precision_32f = mean(matrice_precision_32f,2);
std_precision_32f= std(matrice_precision_32f,0,2);


    



%grafici
% counter
x=1:1:4 
y=[media_counter media_counter_32s media_counter_16f media_counter_32f];
err = [std_counter std_counter_32s std_counter_16f std_counter_32f];
scatter(x,y,'o','b','LineWidth', 2)
hold on
errorbar(x,y,err,'.r')
grid on
xlim([0 5])
ylim([0 164])
title('N° etichette corrette per feature migliore')
ylabel('N° di etichette stimate correttamente')
legend({'Media','deviazione standard'})
xticks(0:1:5)
yticks(0:10:164)
xticklabels({' ','16x16 spazio e_ mp','32x32 spazio e_ mp','16x16 frequenza s_ e','32x32 frequenza s_ e'})
xtickangle(45)

%accuracy
x=1:1:4 
y=[media_accuracy media_accuracy_32s media_accuracy_16f media_accuracy_32f ];
err1 = [std_accuracy std_accuracy_32s std_accuracy_16f std_accuracy_32f];
scatter(x,y,'o','b','LineWidth', 2)
hold on
errorbar(x,y,err1,'.r')
grid on
xlim([0 5])
ylim([0 100])
title('Accuracy della feature migliore')
ylabel('Accuratezza [%]')
legend({'Media','deviazione standard'})
xticks(0:1:5)
yticks(0:10:100)
xticklabels({' ','16x16 spazio e_ mp','32x32 spazio e_ mp','16x16 frequenza s_ e', '32x32 frequenza s_ e' })
xtickangle(45)


%% 16x16 SPAZIO entropia e media parti
%recall per tutte e 11
x=1:1:11;
scatter(x,media_recall,'o','b','LineWidth', 2)
hold on
errorbar(x,media_recall,std_recall,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Recall della feature entropia e media parti')
ylabel('Recall')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%precision per tutte e 11
x=1:1:11;
scatter(x,media_precision,'o','b','LineWidth', 2)
hold on
errorbar(x,media_precision,std_precision,'o')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Precision della feature entropia e media parti')
ylabel('Precision')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%% 32x32 SPAZIO entropia e media parti
%recall per tutte e 11
x=1:1:11;
scatter(x,media_recall_32s,'o','b','LineWidth', 2)
hold on
errorbar(x,media_recall_32s,std_recall_32s,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Recall della feature entropia e media parti')
ylabel('Recall')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%precision per tutte e 11
x=1:1:11;
scatter(x,media_precision_32s,'o','b','LineWidth', 2)
hold on
errorbar(x,media_precision_32s,std_precision_32s,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Precision della feature entropia e media parti')
ylabel('Precision')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%% 16x16 FREQUENZA Simmetria e Entropia
%recall per tutte e 11
x=1:1:11;
scatter(x,media_recall_16f,'o','b','LineWidth', 2)
hold on
errorbar(x,media_recall_16f,std_recall_16f,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Recall della feature simmetria e entropia')
ylabel('Recall')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%precision per tutte e 11
x=1:1:11;
scatter(x,media_precision_16f,'o','b','LineWidth', 2)
hold on
errorbar(x,media_precision_16f,std_precision_16f,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Precision della feature simmetria e entropia')
ylabel('Precision')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%% 32x32 FREQUENZA Simmetria e Entropia
%recall per tutte e 11

x=1:1:11;
scatter(x,media_recall_32f,'o','b','LineWidth', 2)
hold on
errorbar(x,media_recall_32f,std_recall_32f,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Recall della feature simmetria e entropia')
ylabel('Recall')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)

%precision per tutte e 11

x=1:1:11;
scatter(x,media_precision_32f,'o','b','LineWidth', 2)
hold on
errorbar(x,media_precision_32f,std_precision_32f,'.r')
grid on
legend({'Media','deviazione standard'})
xlim([0 12])
title('Precision della feature simmetria e entropia')
ylabel('Precision')
xticks(0:1:12)
xticklabels({' ','glasses','happy','leftlight','noglasses','normal','rightlight','sad','sleepy',...
    'surprised','wink','centerlight',' '})
xtickangle(45)







