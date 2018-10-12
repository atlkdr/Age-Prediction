function [cost,grad] = total_cost(X,Y,theta)
    % Cost and Gradient Calculated For given theta
    hypo=sigmod(X*theta);
    cost=logcost(hypo,Y);
    grad=gradient(X,Y,hypo);
end
