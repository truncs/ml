function decisionTreeWithInformationGain(output_samples, attribs, default, indexes, attribute_class)
  if size(indexes, 1) == 0
	disp(strcat('tree node: ',default));
	return;
  end
  new_output_samples = output_samples(indexes);
  
  p = sum(new_output_samples == 2);
  n = sum(new_output_samples == 1);
  
  if size(new_output_samples, 1) == 0
	disp(strcat('tree node: ',default));
  elseif n == 0
	disp('auto');
  elseif p  == 0
	disp('tree node: noauto');
  elseif  size(fieldnames(attribs),1) == 0
	if n >= p
	  disp('tree node : noauto');
	else
	  disp('tree node : auto');
	end;
  else
	[count_root, dont_care] = partitionAndCount(new_output_samples, new_output_samples, [1;2], 'root');
	count_root = sum(count_root)
	root_gain = informationGain(count_root)
	%indexes
	attribute_class
	[x,attribute] = chooseAttribute(output_samples, attribs,attribute_class, root_gain,indexes);
	disp(strcat('tree node: ',attribute));
	%x
	for i = 1:size(fieldnames(x),1)
	  temp = getfield(x, fieldnames(x){i});
	  new_attributes = rmfield(attribs, attribute);
	  new_attribute_class = rmfield(attribute_class, attribute);
	  temp
	  decisionTreeWithInformationGain(output_samples, new_attributes,'noauto', temp, new_attribute_class);
	end
	
  end
	


  end
	  
	