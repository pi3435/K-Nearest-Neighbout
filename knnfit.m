function [class] = knnfit(dataset,newdata,k)
%Input:dataset: has the form like this
%class1    class2    class3 
%feature1  feature1  feature1
%feature2  feature2  feature2
%newdata:[feature1; feature2; feature3]
%Output:class name of newdata.

%create a matrix to compute the distance.
[row,col] = size(dataset);
ze = zeros(1,col);
dis = [dataset; ze];
for i = 1:col
    dis(row+1,i) = dist(dataset(2:row,i)',newdata);
end

%Sort the distance.
for i=1:col-1
    for j=i+1:col
        if dis(row+1,i)>dis(row+1,j)
             t=dis(:,j);
             dis(:,j)=dis(:,i);
             dis(:,i)=t;
        end
    end 
end
first_k = dis(1,1:k);

%Calculate the number;
tab = tabulate(first_k);
[~,loc] = max(tab(:,2)); 
class = tab(loc,1);

end

