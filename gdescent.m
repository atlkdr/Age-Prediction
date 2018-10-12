function [theta, J_history] = gdescent(X,theta,Y,learn_rate,lambda)
    m = length(Y); % number of training examples
    num_iters=2000;
    J_history = zeros(num_iters, 1);

    factor=(lambda*learn_rate)/m;
    
    for iter = 1:num_iters
        comp_matrix = repmat((X*theta-Y),1,size(X,2));	% size(X,2) denotes features 
        hold = (1/m)*sum(X.*comp_matrix);
        
        theta = theta*(1-factor);
        
        theta = (theta'-(learn_rate * hold))';  
        J_history(iter)=lincost(X,theta,Y,lambda);
    end
end