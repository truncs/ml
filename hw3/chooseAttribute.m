function [ret_x, ret_attribute, ret_counts] = chooseAttribute(output_samples, attribs, attribute_classes,root_gain,indexes)
  ret_x = struct();
  ret_attribute = 0;
  gain = 0;
  max_gain_ratio = 0;
  ret_counts = 0;
%  new_output_samples = output_samples
  
  for i=1:size(fieldnames(attribs),1)
	attribute = fieldnames(attribs){i};
%	attribs
%	attribute
	attribute_values = getfield(attribs,attribute);
	attribute_class = getfield(attribute_classes, attribute);

	%attribute_class
	[counts,x] = partitionAndCount(output_samples, attribute_values, attribute_class, attribute, indexes);

	[remainder, intrinsic_value] = informationGain(counts);
	attribute_gain = root_gain - remainder;
	gain_ratio = attribute_gain / intrinsic_value;
	if gain_ratio > max_gain_ratio
	  max_gain_ratio = gain_ratio;
	  ret_attribute = fieldnames(attribs){i};
	  ret_counts = counts;
	 % disp(ret_attribute)
	  ret_x = x;
	  
	end

  end