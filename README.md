# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Spring 2021

+ Project 3 Team 4
+ Team members
	+ Ai, Haosheng ha2583@columbia.edu
	+ Pan, Yushi yp2560@columbia.edu
	+ Shu, Chuyun cs3894@columbia.edu
	+ Xing, Yuqi yx2666@columbia.edu
	+ Yuan, Serena sy2657@columbia.edu

+ Project summary: In this project, we created a classification engine for facial emotion recognition. We used Gradient Boosting Machine (GBM) as our baseline model on 3000 facial images with the extracted features to recognized the emotion from new facial images. Our group gives six typical machine learn algorithms (PCA+LDA, Random Forest(unweighted), Random Forest(weighted), SVM(kernel = polynomial, linear, radial, sigmoid), Elastic Net, KNN and xgboost). We trained different models on the given data set, found the optimized parameters through cross-validation and compared them by mean error, auc, training time and testing time. We found xgboost model improves the baseline model the most.

	
**Contribution statement**: All team members approve our work presented in this GitHub repository including this contributions statement. 

Pan, Yushi: Presenter. Cross validated and implemented the baseline model. Implemented PCA to the features, chose the best number of principal components, and used those features to implement the LDA model. Contributed and organized presentation slides. Combined works from group members and organized the main.rmd file.

Xing, Yuqi: constructed Random Forest model(unweight) and Random Forest model with weight, tuning the hyperparameter, cross validation. I participated in every stages of project's discussion and write the README file.

Ai, Haosheng:

Shu, Chunyun: constructed K Nearest Neighborhood model tuning the hyperparameter and cross validation (see doc folder).

Yuan, Serna:


Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
