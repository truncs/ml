function decisionTreeWithInformationGain(output_samples, attribs, default, indexes, attribute_class)
  if size(indexes, 1) == 0
	disp(strcat('tree node:1 ',default));
	return;
  end
  indexes;
  new_output_samples = output_samples(indexes);
  
	p = sum(new_output_samples == 2);
	n = sum(new_output_samples == 1);
  
  if size(new_output_samples, 1) == 0
	disp(strcat('tree node:2 ',default));
  elseif n == 0
	disp('tree node: auto');
  elseif p  == 0
	disp('tree node3: noauto');
  elseif  size(fieldnames(attribs),1) == 0
	if n >= p
	  disp('tree node4 : noauto');
	else
	  disp('tree node5 : auto');
	end;
  else
	count_root = [p  n];
	[root_gain,dont_care] = informationGain(count_root);
%indexes;
	%attribute_class
	[x,attribute,counts] = chooseAttribute(output_samples, attribs,attribute_class, root_gain,indexes);
	disp(strcat('tree node: ',attribute));
	counts
	%x
	for i = 1:size(fieldnames(x),1)
	  %disp
	  %x
	  temp = getfield(x, fieldnames(x){i});
	  new_attributes = rmfield(attribs, attribute);
	  new_attribute_class = rmfield(attribute_class, attribute);
	  %temp;
	  decisionTreeWithInformationGain(output_samples, new_attributes,'noauto', temp, new_attribute_class);
	end
	
  end
	


  end
	  
	
