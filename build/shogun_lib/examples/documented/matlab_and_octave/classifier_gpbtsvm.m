% In this example a two-class support vector machine classifier is trained on a
% toy data set and the trained classifier is used to predict labels of test
% examples. As training algorithm Gradient Projection Decomposition Technique
% (GPDT) is used with SVM regularization parameter C=1.2 and a Gaussian
% kernel of width 2.1 and 10MB of kernel cache. 
% 
% For more details on GPDT solver see http://dm.unife.it/gpdt 
%  
%    

% Explicit examples on how to use the different classifiers

size_cache=10;
C=1.2;
use_bias=false;
epsilon=1e-5;
width=2.1;
max_train_time=60;

addpath('tools');
label_train_twoclass=load_matrix('../data/label_train_twoclass.dat');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');

% GPBTSVM
disp('GPBTSVM');

sg('set_kernel', 'GAUSSIAN', 'REAL', size_cache, width);
sg('set_features', 'TRAIN', fm_train_real);
sg('set_labels', 'TRAIN', label_train_twoclass);
sg('new_classifier', 'GPBTSVM');
sg('svm_epsilon', epsilon);
sg('svm_use_bias', use_bias);
sg('c', C);

sg('train_classifier');

sg('set_features', 'TEST', fm_test_real);
result=sg('classify');

