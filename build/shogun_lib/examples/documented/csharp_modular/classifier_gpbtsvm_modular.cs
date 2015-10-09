// In this example a two-class support vector machine classifier is trained on a
// toy data set and the trained classifier is then used to predict labels of test
// examples. As training algorithm Gradient Projection Decomposition Technique
// (GPDT) is used with SVM regularization parameter C=1 and a Gaussian
// kernel of width 2.1. The solver returns an epsilon-precise (epsilon=1e-5) solution. 
// 
// For more details on GPDT solver see http://dm.unife.it/gpdt . 
// 

using System;

public class classifier_gpbtsvm_modular {
	public static void Main() {
		modshogun.init_shogun_with_defaults();
		double width = 2.1;
		double epsilon = 1e-5;
		double C = 1.0;

		double[,] traindata_real = Load.load_numbers("../data/fm_train_real.dat");
		double[,] testdata_real = Load.load_numbers("../data/fm_test_real.dat");

		double[] trainlab = Load.load_labels("../data/label_train_twoclass.dat");

		RealFeatures feats_train = new RealFeatures();
		feats_train.set_feature_matrix(traindata_real);
		RealFeatures feats_test = new RealFeatures();
		feats_test.set_feature_matrix(testdata_real);

		GaussianKernel kernel = new GaussianKernel(feats_train, feats_train, width);

		BinaryLabels labels = new BinaryLabels(trainlab);

		GPBTSVM svm = new GPBTSVM(C, kernel, labels);
		svm.set_epsilon(epsilon);
		svm.train();
		kernel.init(feats_train, feats_test);
		double[] out_labels = BinaryLabels.obtain_from_generic(svm.apply()).get_labels();

		foreach(double item in out_labels) {
			Console.Write(item);
		}

		modshogun.exit_shogun();
	}
}
