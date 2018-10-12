
% GENERAL LINEAR RIGDE RIGRESSION 
clear;

% Reading and Randomizing Data
data4=load('data.txt');



% Randomizing Data
data2=randomize_data(data4);

% Forming Training , Test and Validation Data 

% DATA ALREADY RANDOMLY SHUFFLED TEST BY PREVIOUS FUNCTION
training_data=data2(1:int16(0.2*size(data2,1)),:);  % 20% Training data

% Frac = 0.3
frac=0.7; % Fraction of Validation Data
validate_data=data2(1:int16(frac*size(data2,1)),:); % 70% Validation data   

% remaining 1-frac
test_data=data2(int16(frac*size(data2,1))+1:int16(size(data2,1)),:); % 30% Test data 

% Now Data stands for data assignmend as Training Data , To simply variable
data=training_data;

Y=data(:,9); % Age Component

% standardize the independent variables Except The last Feature
for i=2:7,
    data(:,i)=(data(:,i)-mean(data(:,i)))/std(data(:,i)); 
end
    
n=length(Y);
X=[ones(n,1),data(:,1:8)]; % Attribute / Feature Matrix
theta=zeros(9,1);


% THIS FUNCTION CONVERTS M/F/I TO 3 DIMENSIONAL TUPLE
[X,theta]=tuple_form(X);

initial_train_error=meansquarederr(Y,mylinridgeregeval(X,theta));
learn_rate=0.02;
lambda=45; % With Increaing Lambda Our Error Reduction in calculation Decreses 

[theta,J_history]=mylinridgereg(X,theta,Y,learn_rate,lambda);

% Train Data Error

train_cals=mylinridgeregeval(X,theta);
final_train_error=meansquarederr(Y,train_cals);

% Validation_Data_Error

Y_valid=validate_data(:,9); % Age 
X_valid=[ones(size(validate_data,1),1),validate_data(:,1:8)]; % Attribute

[X_valid,junk]=tuple_form(X_valid);
valid_cals=mylinridgeregeval(X_valid,theta);
valid_error=meansquarederr(Y_valid,valid_cals);

% Test_Data Error
Y_test=test_data(:,9); % Age 
X_test=[ones(size(test_data,1),1),test_data(:,1:8)]; % Attribute
[X_test,junk]=tuple_form(X_test);
cals=mylinridgeregeval(X_test,theta);
test_error=meansquarederr(Y_test,cals);

% Optimal solution :-> Less Erro , Less COmplexity of curve
fprintf("ANALYSIS_COMPLETE_FOR_GIVEN_LAMDA_ALPHA:\n");
fprintf("Lambda= %d , Learning Rate = %d \n",lambda,learn_rate);
fprintf("Initial_training_error = %d\n",initial_train_error);
fprintf("Final_training_error = %d\n",final_train_error);
fprintf("Validation_set_error = %d\n",valid_error);
fprintf("Test_ser_error = %d\n",test_error);


% Plotting the variation of lambda or complexity of hypothesis with error
% theta_initial=zeros(9,1);
% learn_rate=0.03;
% [lambdas,errors_test,errors_train]=variation_with_lambda(X,theta_initial,Y,learn_rate,X_test,Y_test);

