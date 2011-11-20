% Load data from the dat files
% Since the first n columns indicate the 
% actual data points and the last term 
% indicates the output value, we will 
% split the matrices.

test_trans = dlmread('optdigits_tra_trans.dat');
test_trans_input = test_trans(:, 1:64);
test_trans_output = test_trans(:, 65);

trial_trans = dlmread('optdigits_trial_trans.dat');
trial_trans_input = trial_trans(:,1:64);
trial_trans_output = trial_trans(:,65);

test = dlmread('optdigits_tra.dat');
test_input = test(:, 1:1024);
test_output = test(:, 1025);

trial = dlmread('optdigits_trial.dat');
trial_input = trial(:,1:1024);
trial_output = trial(:,1025);

