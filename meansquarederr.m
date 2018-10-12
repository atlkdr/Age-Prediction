function S = meansquarederr(T,Tdash)
    R=T-Tdash;
    R=R.^2;
    R=(1/(2*length(T)))*R;
    S=sum(R);
end
