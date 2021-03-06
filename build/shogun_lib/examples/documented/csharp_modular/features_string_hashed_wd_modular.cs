// This creates a HashedWDFeatures object, i.e. an approximation to the Weighted
// Degree kernel feature space via hashes. These features can be particularly fast
// in linear SVM solvers.

using System;

public class features_string_hashed_wd_modular {
	public static void Main() {
		modshogun.init_shogun_with_defaults();
		int order = 3;
		int start_order = 1;
		int hash_bits = 2;

		int from_order = order;
		StringByteFeatures f = new StringByteFeatures(EAlphabet.RAWDNA);
		HashedWDFeatures y = new HashedWDFeatures(f,start_order,order,from_order,hash_bits);

		modshogun.exit_shogun();
	}
}