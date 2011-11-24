function [knn_index] = knn(Y, x, k)

% This function calculates the 
% euclidean distance of x (vector)
% with each row of Y (Y is a matrix
% where each row corresponds to the 
% vector of point. The function returns
% the index of k nearest neighbor of x.

% Initialize the output array
  knn_index = zeros(k,1);
  
% Intialize a temp array to hold the 
% the euclidean distance
  C = zeros(size(Y,2),1);

% replicate the input matrix
% to vectorize the matrix operations  
  X = repmat(x,size(Y,1),1);

% the required values are 
% along the diag of square of temp
  temp = X - Y;
  C = sqrt(diag(temp*temp'));

% calculate the 3 nearest neighbor
  for i=1:k
	[value,min_index] = min(C);
	knn_index(i) = min_index;
	C(min_index) = NaN;
  end
	
  