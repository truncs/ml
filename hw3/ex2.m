% Decision trees 

attribute_class.stability = [1;2];
attribute_class.error = [1;2;3;4];
attribute_class.sign = [1;2];
attribute_class.wind = [1;2];
attribute_class.magnitude = [1;2;3;4];
attribute_class.visibility = [1;2];


input_data = dlmread('shuttle_ext_unique.dat');
output_class = input_data(:,1);

attribute_values.stability = input_data(:,2);
attribute_values.error = input_data(:,3);
attribute_values.sign = input_data(:,4);
attribute_values.wind = input_data(:,5);
attribute_values.magnitude = input_data(:,6);
attribute_values.visibility = input_data(:,7);


decisionTreeWithInformationGain(output_class, attribute_values, 'noauto', [1:size(output_class,1)], attribute_class);



