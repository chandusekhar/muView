% SimpleLocalityImprovedString kernel, is a ``simplified'' and better performing version of the Locality improved kernel.

size_cache=10;

addpath('tools');
fm_train_dna=load_matrix('../data/fm_train_dna.dat');
fm_test_dna=load_matrix('../data/fm_test_dna.dat');

% Simple Locality Improved String
disp('SimpleLocalityImprovedString');

length=5;
inner_degree=5;
outer_degree=inner_degree+2;

sg('set_kernel', 'SLIK', 'CHAR', size_cache, length, inner_degree, outer_degree);

sg('set_features', 'TRAIN', fm_train_dna, 'DNA');
km=sg('get_kernel_matrix', 'TRAIN');

sg('set_features', 'TEST', fm_test_dna, 'DNA');
km=sg('get_kernel_matrix', 'TEST');
