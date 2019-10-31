# Project: Can you recognize the emotion from an image of a face? 
<img src="figs/CE.jpg" alt="Compound Emotions" width="500"/>
(Image source: https://www.pnas.org/content/111/15/E1454)

### [Full Project Description](doc/project3_desc.md)

Term: Fall 2019

+ Section 2, Team 3
+ Team members
	+ Lihao Xiao
	+ Tongyu Wang
	+ Tiantian Chu
	+ Zian Zhou
	+ Sam Unger

+ Project summary: In this project, we created a classification engine for facial emotion recognition.
+ The aim of this project is to improve the baseline model of image classification, which uses boosted decision stumps model.
+ The improved model is a multilayer perceptron neural network, which improved the performance compared to the client’s base model.
+ In the feature selection stage, we chose to use the parawise distance of the 79 fiducal points. As a result, each image would have 1332 features to represent each time.
+ In the model selection stage, we compared and evaluated SVM, Random Forest,  and multilayer perceptron methods.
+ Following are the results:
	+ Boosted decision stumps model achieved approximatelty 40% accuracy
	+ SVM achieved 43% accuracy
	+ Random Forest model achieved an accuracy rate of 46.6%
	+ Multilayer perceptron neural model achieved 48.8% accuracy
	
+ Thus, we chose the Multilayer perceptron neural model as our improved model. 

**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members contributed equally in all stages of this project. All team members approve our work presented in this GitHub repository including this contribution statement. 

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
