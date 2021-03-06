% The Weighted Degree Position String kernel (Weighted Degree kernel with shifts).
% 
% The WD-shift kernel of order d compares two sequences X and
% Y of length L by summing all contributions of k-mer matches of
% lengths k in 1...d, weighted by coefficients beta_k
% allowing for a positional tolerance of up to shift s.
% 

size_cache=10;

addpath('tools');
fm_train_dna=load_matrix('../data/fm_train_dna.dat');
fm_test_dna=load_matrix('../data/fm_test_dna.dat');

% Weighted Degree Position String
disp('WeightedDegreePositionString');

degree=20;

sg('set_kernel', 'WEIGHTEDDEGREEPOS', 'CHAR', size_cache, degree);

sg('set_features', 'TRAIN', fm_train_dna, 'DNA');
km=sg('get_kernel_matrix', 'TRAIN');

sg('set_features', 'TEST', fm_test_dna, 'DNA');
km=sg('get_kernel_matrix', 'TEST');
