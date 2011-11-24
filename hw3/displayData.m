function displayData(data, width)
  counter = size(data,1) / width;
  disp_data = [];
  start_index =1;
  end_index = 4;
  for i=1:counter
	a_1 = data(start_index,:);
	a_2 = data(start_index+1,:);
	a_3 = data(start_index+2,:);
	a_4 = data(start_index+3,:);
	disp_data = [disp_data;reshape(a_1, 32, 32)',reshape(a_2, 32, 32)',reshape(a_3, 32, 32)',reshape(a_4, 32, 32)'];
	start_index += 4;
  end
  imagesc(disp_data);
  axis image off;
end

