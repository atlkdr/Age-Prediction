function [X_2,theta_2] = tuple_form(X)
  % Convering and Forming Tuples by comparing each value
  X_2=zeros(size(X,1),size(X,2)+2);
  theta_2=zeros(size(X_2,2),1);
  for i=1:size(X,1),
    if X(i,2)==0,
      X_2(i,:)=[X(i,1),[0,0,1],X(i,2:8)];
    end
    if X(i,2)==1,
      X_2(i,:)=[X(i,1),[0,1,0],X(i,2:8)];
    end
    if X(i,2)==2,
      X_2(i,:)=[X(i,1),[1,0,0],X(i,2:8)];
    end
  end
end

