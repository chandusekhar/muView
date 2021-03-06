// This example shows usage of the Perceptron algorithm for training a two-class
// linear classifier, i.e.  y = sign( <x,w>+b). The Perceptron algorithm works by
// iteratively passing though the training examples and applying the update rule on
// those examples which are misclassified by the current classifier. The Perceptron
// update rule reads
// 
//   w(t+1) = w(t) + alpha * y_t * x_t
//   b(t+1) = b(t) + alpha * y_t
// 
// where (x_t,y_t) is feature vector and label (must be +1/-1) of the misclassified example
//       (w(t),b(t)) are the current parameters of the linear classifier
//       (w(t+1),b(t+1)) are the new parameters of the linear classifier
//       alpha is the learning rate; in this examples alpha=1
// 
// The Perceptron algorithm iterates until all training examples are correctly
// classified or the prescribed maximal number of iterations, in this example
// max_iter=1000, is reached.

using System;

public class classifier_perceptron_modular {
	public static void Main() {
		modshogun.init_shogun_with_defaults();
		double learn_rate = 1.0;
		int max_iter = 1000;

		double[,] traindata_real = Load.load_numbers("../data/fm_train_real.dat");
		double[,] testdata_real = Load.load_numbers("../data/fm_test_real.dat");

		// already tried double[][]
		double[] trainlab = Load.load_labels("../data/label_train_twoclass.dat");

		RealFeatures feats_train = new RealFeatures();
		feats_train.set_feature_matrix(traindata_real);
		RealFeatures feats_test = new RealFeatures();
		feats_test.set_feature_matrix(testdata_real);

		BinaryLabels labels = new BinaryLabels(trainlab);

		Perceptron perceptron = new Perceptron(feats_train, labels);
		perceptron.set_learn_rate(learn_rate);
		perceptron.set_max_iter(max_iter);
		perceptron.train();

		perceptron.set_features(feats_test);
		//  already tried double[][]
		double[] out_labels = BinaryLabels.obtain_from_generic(perceptron.apply()).get_labels();
		
		foreach (double item in out_labels)
		    Console.Write(item);

		modshogun.exit_shogun();
	}
}

