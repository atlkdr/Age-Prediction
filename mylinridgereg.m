function [theta,J_history]=mylinridgereg(X,theta,Y,learn_rate,lambda)
  % Calling gradient Descent function 
  [theta,J_history]=gdescent(X,theta,Y,learn_rate,lambda);
end
