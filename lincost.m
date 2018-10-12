function S = lincost(X,theta,Y,lambda)
    R=(X*theta)-Y;
    R=R.^2;
    R=(1/(2*length(Y)))*R;
    S=sum(R);
    S=S+lambda*(theta'*theta);
end