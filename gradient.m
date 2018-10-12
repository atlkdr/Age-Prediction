function grad = gradient(X,Y,hypo)
    m = length(Y); % number of training examples
    comp_matrix = repmat(hypo-Y,1,size(X,2));	% size(X,2) denotes features 
    hold = sum(X.*comp_matrix);
    grad = hold';  
end