function individual_error_contribution()
% From PLOTS this composition is found to be a good choice fraction=0.05 lambda=50  
  
  fraction=0.05;
  lambda=50;
  data4=load('data.txt');
  data2=randomize_data(data4);
  training_data=data2(1:int16(fraction*size(data2,1)),:);  % 20% Training data

  % Frac = 0.3
  frac=0.7; 
  test_data=data2(int16(frac*size(data2,1))+1:int16(size(data2,1)),:); % 30% Test data 
  Y_test=test_data(:,9); % Age 
  X_test=[ones(size(test_data,1),1),test_data(:,1:8)]; % Attribute
  
  
  
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
  initial_train_error=meansquarederr(Y,mylinridgeregeval(X,theta));
  learn_rate=0.02;
  lambda=0; % With Increaing Lambda Our Error Reduction in calculation Decreses 

  [theta,J_history]=mylinridgereg(X,theta,Y,learn_rate,lambda);

  % Test_Data Error
 
  test_cals=mylinridgeregeval(X_test,theta);
  
  % Optimal solution :-> Less Erro , Less COmplexity of curve
  figure;
  plot(test_cals,Y_test,'gx');
  title("Individual Predicted to Actual Values for data");
  xlabel('Calculated/Predicted Value');
  ylabel('Actual Value');
  hold on;
  plot([5:30],[5:30],'--b');
  hold off;

end
