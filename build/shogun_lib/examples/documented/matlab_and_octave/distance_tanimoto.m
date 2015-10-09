% An approach as applied below, which shows the processing of input data
% from a file becomes a crucial factor for writing your own sample applications.
% This approach is just one example of what can be done using the distance
% functions provided by shogun.
% 
% First, you need to determine what type your data will be, because this
% will determine the distance function you can use.
% 
% This example loads two stored matrices of real values (feature type 'REAL')
% from different files and initializes the distance to 'TANIMOTO'.
% Each column of the matrices corresponds to one data point.
% 
% The target 'TRAIN' for 'set_features' controls the processing of the given
% data points, where a pairwise distance (extended Jaccard coefficient)
% matrix is computed by 'get_distance_matrix'.
% 
% The resulting distance matrix can be reaccessed by 'get_distance_matrix' and
% target 'TRAIN'.
% 
% The target 'TEST' for 'set_features' controls the processing of the given
% data points 'TRAIN' and 'TEST', where a pairwise distance (extended
% Jaccard coefficient) matrix between these two data sets is computed by
% 'get_distance_matrix'.
% 
% The resulting distance matrix can be reaccessed by 'get_distance_matrix'
% and target 'TEST'. The 'TRAIN' distance matrix ceased to exist. 
% 
% For more details see doc/classshogun_1_1CTanimotoDistance.html.
% 
% Obviously, using the Tanimoto distance/coefficient is not limited to
% this showcase example.

addpath('tools');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');

% Tanimoto Metric
disp('TanimotoDistance');
sg('set_distance', 'TANIMOTO', 'REAL');

sg('set_features', 'TRAIN', fm_train_real);
dm=sg('get_distance_matrix', 'TRAIN');

sg('set_features', 'TEST', fm_test_real);;
dm=sg('get_distance_matrix', 'TEST');
