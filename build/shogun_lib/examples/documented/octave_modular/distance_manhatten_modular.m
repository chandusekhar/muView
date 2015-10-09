% This example shows how to compute the Manhatten Distance.

init_shogun

addpath('tools');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');

% manhattan metric
disp('ManhattanMetric')

feats_train=RealFeatures(fm_train_real);
feats_test=RealFeatures(fm_test_real);

distance=ManhattanMetric(feats_train, feats_train);

dm_train=distance.get_distance_matrix();
distance.init(feats_train, feats_test);
dm_test=distance.get_distance_matrix();
