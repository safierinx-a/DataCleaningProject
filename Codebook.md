## Codebook for run_analysis.R  
#Process  
*Load Data and assign column names
*Subset Data in accordance to required features  
*Merge Training data and Testing Data
*Form tidy dataset

#Variables Used  
*activityLabels: Labels for the different activities during which data was recorded  
*desc: Merged vector consisting of the corresponding activity labels for each reading  
*features: List of all variables measured  
*featuresWanted: List of features we used, i.e. only the mean and standard deviation values  
*measurements: List of feature names from subset of features corresponding to featuresWanted  
*mer: Merged readings  
*mer_lab: Merged Labels  
*merged: Final merged data frame  
*subj: Subject for whom the reading was taken  
*temp: Temporary data frame  
*test: Data frame of test readings  
*test_desc:vector consisting of the corresponding activity labels for each reading  
*test_lab: Activity labels for the test set's readings  
*test_sub: Subjects of test set's readings  
*tidy: Tidied data frame  
*train: Data frame of readings from the training set  
*train_lab: Activity labels corresponding to the training set readings  
*train_sub: Subjects corresponding to the training set's readings  

