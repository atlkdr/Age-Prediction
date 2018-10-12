function [lambdas,errors_test,errors_train] = variation_with_lambda(X,theta,Y,learn_rate,X_test,Y_test)
  iteration_limit=10;
  lambdas=zeros(iteration_limit,1);
  errors_test=zeros(iteration_limit,1);
  errors_train=zeros(iteration_limit,1);
  for i=1:iteration_limit,
    lambdas(i,1)=i*5;  
    [theta2,J_history]=mylinridgereg(X,theta,Y,learn_rate,i*5);  % For Every Lambda perform Linear Ridged Regression
     % Test Data Error Calculation
     test_cals=mylinridgeregeval(X_test,theta2);
     test_error=meansquarederr(Y_test,test_cals);
     errors_test(i,1)=test_error;
     
     train_cals=mylinridgeregeval(X,theta2);
     train_error=meansquarederr(Y,train_cals);
     errors_train(i,1)=train_error;
   end
   figure;
   plot(lambdas',errors_test');
   title("Variation of test and train Error with lambda");
   xlabel('Value of Lambda/Penalizing Term');
   ylabel('Red for Training set Error Blue for Test set Error');
   hold on;
   plot(lambdas',errors_train');
   hold off;
 end





