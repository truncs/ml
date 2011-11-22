function [ret_x, ret_attribute] = chooseAttribute(output_samples, attribs, attribute_classes,root_gain,indexes)
  ret_x = struct();
  ret_attribute = 0;
  gain = 0;
  new_output_samples = output_samples(indexes);
  
  for i=1:size(fieldnames(attribs),1)
	attribute = fieldnames(attribs){i};
%	attribs
	attribute
	attribute_values = getfield(attribs,attribute);
	attribute_class = getfield(attribute_classes, attribute);
	attribute_values  = attribute_values(indexes);
	attribute_class
	[counts,x] = partitionAndCount(new_output_samples, attribute_values, attribute_class, attribute);
	
	remainder = informationGain(counts)
	attribute_gain = root_gain - remainder
	
	if attribute_gain > gain
	  gain = attribute_gain;
	  ret_attribute = fieldnames(attribs){i};
	 % disp(ret_attribute)
	  ret_x = x;
	  
	end

  end