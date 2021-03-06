% In this example a two-class linear support vector machine classifier is trained
% on a toy data set and the trained classifier is used to predict labels of test
% examples. As training algorithm the OCAS solver is used with the SVM
% regularization parameter C=0.9 and the bias term in the classification rule
% switched off and the precision parameter epsilon=1e-5 (duality gap).
% 
% For more details on the OCAS solver see
%  V. Franc, S. Sonnenburg. Optimized Cutting Plane Algorithm for Large-Scale Risk
%  Minimization.The Journal of Machine Learning Research, vol. 10,
%  pp. 2157--2192. October 2009. 
% 

init_shogun

addpath('tools');
label_train_twoclass=load_matrix('../data/label_train_twoclass.dat');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');

% svm ocas
disp('SVMOcas')

realfeat=RealFeatures(fm_train_real);
feats_train=SparseRealFeatures();
feats_train.obtain_from_simple(realfeat);
realfeat=RealFeatures(fm_test_real);
feats_test=SparseRealFeatures();
feats_test.obtain_from_simple(realfeat);

C=0.9;
epsilon=1e-5;
num_threads=1;
labels=BinaryLabels(label_train_twoclass);

svm=SVMOcas(C, feats_train, labels);
svm.set_epsilon(epsilon);
svm.parallel.set_num_threads(num_threads);
svm.set_bias_enabled(false);
svm.train();

svm.set_features(feats_test);
svm.apply().get_labels();

