function [error_train_facs,error_test_facs] = plot_frac_vs_error()
  clear;
  data4=load('data.txt');
  % Randomizing Data
  data2=randomize_data(data4);
  % Frac = 0.3 for validation and training data
  frac=0.7; % Fraction of Validation Data
  validate_data=data2(1:int16(frac*size(data2,1)),:); % 70% Validation data   
  test_data=data2(int16(frac*size(data2,1))+1:int16(size(data2,1)),:); % 30% Test data 
  
  Y_test=test_data(:,9); % Age 
  X_test=[ones(size(test_data,1),1),test_data(:,1:8)]; % Attribute
  
  
  % remaining 1-frac
  test_data=data2(int16(frac*size(data2,1))+1:int16(size(data2,1)),:); % 30% Test data 

  
  lambda=5; % For this value of lambda
  % DATA ALREADY RANDOMLY SHUFFLED TEST BY PREVIOUS FUNCTION
  
  error_train_facs=zeros(50,2);
  error_test_facs=zeros(50,2);
  
  for counter=1:50,
    frac_split=rand(1,1);
    training_data=data2(1:int16(frac_split*size(data2,1)),:);  % 20% Training data
    error_train_facs(counter,1)=frac_split;
    error_test_facs(counter,1)=frac_split;

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
    learn_rate=0.02;
     % With Increaing Lambda Our Error Reduction in calculation Decreses 
    [theta,J_history]=mylinridgereg(X,theta,Y,learn_rate,lambda);

    % Train Data Error

    train_cals=mylinridgeregeval(X,theta);
    train_error=meansquarederr(Y,train_cals);

    % Test_Data Error
 
    cals=mylinridgeregeval(X_test,theta);
    test_error=meansquarederr(Y_test,cals);
    
    error_train_facs(counter,2)=train_error;
    error_test_facs(counter,2)=test_error;
  end
  figure;
  plot(error_train_facs(:,1),error_train_facs(:,2),'ro');
  title("Variation of Test and Train Error with Fraction of Test Data");
  xlabel('Fraction of training set');
  ylabel('Error [O for Training set Error X for Test set Error ]');
  hold on;
  plot(error_test_facs(:,1),error_test_facs(:,2),'gx');
  hold off;
end

