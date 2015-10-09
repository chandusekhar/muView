# This example shows how to compute the Manhatten Distance.

from tools.load import LoadMatrix
lm=LoadMatrix()

traindat = lm.load_numbers('../data/fm_train_real.dat')
testdat = lm.load_numbers('../data/fm_test_real.dat')

parameter_list = [[traindat,testdat],[traindat,testdat]]

def distance_manhatten_modular (fm_train_real=traindat,fm_test_real=testdat):

	from shogun.Features import RealFeatures
	from shogun.Distance import ManhattanMetric

	feats_train=RealFeatures(fm_train_real)
	feats_test=RealFeatures(fm_test_real)

	distance=ManhattanMetric(feats_train, feats_train)

	dm_train=distance.get_distance_matrix()
	distance.init(feats_train, feats_test)
	dm_test=distance.get_distance_matrix()

	return distance,dm_train,dm_test

if __name__=='__main__':
	print('ManhattanMetric')
	distance_manhatten_modular(*parameter_list[0])


