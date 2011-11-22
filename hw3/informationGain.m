% Calculate the information gain based on the number of positive and negative values of each 
% class 
% The counts matrix is expected to have the  number of positive and 
% and negative sample per row for each class 
% For ex. Class 1 will have have the [p n] on row 1 and so on

function[gain] = informationGain(counts)

  % Initialize gain
  gain = 0;

  % Total number of samples in all the class 
  total_samples = sum(sum(counts));

  for i=1:size(counts,1)
	class_sum = sum(counts(i,:));
	p_factor = counts(i,1) / class_sum;
	n_factor = counts(i,2) / class_sum;
	
	% Hack so that octave doesn't return NaN if any of the *_factor values are zero

	if (p_factor != 0 && n_factor != 0)
	  gain += (class_sum / total_samples) * ( - p_factor * log2(p_factor) - n_factor*log2(n_factor));
	elseif(p_factor != 0 && n_factor == 0)
	  gain += (class_sum / total_samples) * ( - p_factor * log2(p_factor));
	elseif(p_factor == 0 && n_factor != 0)
	  gain += (class_sum / total_samples) * ( n_factor * log2(n_factor));
	end
  end

end