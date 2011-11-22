% Given the output class samples, the input class 
% values and the input class samples for that class
% returns the number of position and negative samples
% for each class on per row of the output matrix
% For ex 
% if the output_class = [1;2;1]
% input_class = [1;2;3]
% training = [1;2;3]
% this function should return 
% [0 1;1 0; 0 1]
% Note: There should be a one-to-one correspondence
% between the input samples and the output samples
% Note 2: This function assumes that you are doing a 
% binary classification and 1 stands for negative example
% and 2 stands for positive.

function[positive_negative_count,x] = partitionAndCount(output_samples, input_samples,input_classes, attribute)
  
% Initialize the returned matrix
  positive_negative_count = zeros(size(input_classes,1), 2);
  x = struct();
  
  for i=1:size(input_classes,1)

	% Parition the input set based on the inptut class value 
	partition_indexes = find(input_samples == input_classes(i));

	% Get the corresponding output class values
	temp = output_samples(partition_indexes);

	% Get the number of the positive and the negative samples
	p = sum(temp == 2);
	n = sum(temp == 1);
	x = setfield(x, strcat(attribute, num2str(i)), partition_indexes);
	%temp
	positive_negative_count(i,:) = [p n];
	
  end

end