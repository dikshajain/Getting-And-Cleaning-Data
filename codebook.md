CodeBook:
1. Variable names obtained from given dataset:
subject_train: training set subjects
subject_test: test set subjects
X_test: test set Xs
y_test: test set Ys
X_train:training set Xs
y_train:training set Ys
total_X:training set and test set Xs combined
total_Y:training set and test set Ys combined

2. Variables obtained from Transformations:
required_measurements: extracted std dev and mean features
required_total_X: extracted Xs for std dev and mean features
cleanfeaturenames: removing "()" from feature names to obtain cleaned names
required_clean_feature_measurements: extracting only those names corresponding to mean and std deviation
total_subjects: training set and test set subjects combined
act_group:total factors in activity column in total_X dataset
baseData:molten total_X dataset
secondDataSet: final small dataset which has mean of different features corresponding to each subject and activity
