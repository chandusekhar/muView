// In this example we demonstrate how to use SVMs in a domain adaptation
// scenario. Here, we assume that we have two problem domains, one with
// an abundance of training data (source domain) and one with only a few
// training examples (target domain). These domains are assumed to be
// different but related enough to transfer information between them.
// Thus, we first train an SVM on the source domain and then subsequently
// pass this previously trained SVM object to the DASVM, that we train
// on the target domain. The DASVM internally computes a custom linear term
// (for the underlying quadratic program of the dual formulation of the SVM)
// based on the support vectors of the source SVM and the training examples
// of the target SVM. Finally, it can be used for prediction just as any other
// SVM object.
// 

import org.shogun.*;
import org.jblas.*;
import static org.shogun.EAlphabet.DNA;

import static org.shogun.BinaryLabels.obtain_from_generic;

public class classifier_domainadaptationsvm_modular {
	static {
		System.loadLibrary("modshogun");
	}

	public static void main(String argv[]) {
		modshogun.init_shogun_with_defaults();
		int degree = 3;
		int C = 1;

		String[] fm_train_dna = {"CGCACGTACGTAGCTCGAT",
		      "CGACGTAGTCGTAGTCGTA",
		      "CGACGGGGGGGGGGTCGTA",
		      "CGACCTAGTCGTAGTCGTA",
		      "CGACCACAGTTATATAGTA",
		      "CGACGTAGTCGTAGTCGTA",
		      "CGACGTAGTTTTTTTCGTA",
		      "CGACGTAGTCGTAGCCCCA",
		      "CAAAAAAAAAAAAAAAATA",
		      "CGACGGGGGGGGGGGCGTA"};
		String[] fm_test_dna = {"AGCACGTACGTAGCTCGAT",
		      "AGACGTAGTCGTAGTCGTA",
		      "CAACGGGGGGGGGGTCGTA",
		      "CGACCTAGTCGTAGTCGTA",
		      "CGAACACAGTTATATAGTA",
		      "CGACCTAGTCGTAGTCGTA",
		      "CGACGTGGGGTTTTTCGTA",
		      "CGACGTAGTCCCAGCCCCA",
		      "CAAAAAAAAAAAACCAATA",
		      "CGACGGCCGGGGGGGCGTA"};

		StringCharFeatures feats_train = new StringCharFeatures(fm_train_dna, DNA);
		StringCharFeatures feats_test = new StringCharFeatures(fm_test_dna, DNA);

		WeightedDegreeStringKernel kernel = new WeightedDegreeStringKernel(feats_train, feats_train, degree);
		double label_train_dna[][] = {{-1,-1,-1,-1,-1,1,1,1,1,1}};
		BinaryLabels labels = new BinaryLabels(new DoubleMatrix(label_train_dna));

		SVMLight svm = new SVMLight(C, kernel, labels);
		svm.train();

		DomainAdaptationSVM dasvm = new DomainAdaptationSVM(C, kernel, labels, svm, 1.0);
		dasvm.train();

		DoubleMatrix out = obtain_from_generic(dasvm.apply(feats_test)).get_labels();
		modshogun.exit_shogun();
	}
}