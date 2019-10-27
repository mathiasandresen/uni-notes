---
title: Learning: Introduction and Decision Trees
date: 21-10-19
course: MI
session: 21.10
---

# Learning: Introduction and Decision Trees

Learning: The ability of an agent to improve its behavior based on experience, e.g.:

*  The range of behaviors is expanded; the agent can do more. 
*  The accuracy on tasks is improved; the agent can do things better. 
*  The speed is improved; the agent can do things faster. 



## Learning Issues

The following components are part of any learning problem:

* **Task**: The behavior or task that is being improved
* **Data:** The experiences that are used to improve performance in the task, usually in the form of a sequence of examples
* **Measure of improvement:** How the improvement is measured. Examples:
    * New skills that were not present initially
    * Increasing accuracy in prediction
    * Improved speed



Learning techniques face the following issues:

### Task

[7.1: Task](https://artint.info/2e/html/ArtInt2e.Ch7.S1.html#I2)

The most commonly studied learning task is **supervised learning:**

* Given some input features, some target features, and a set of **training examples** where the input features and target features are specified, predict the value of target features for new examples given their values on the input features.
    * This is called **classification** when the target features are discrete,
    * And **regression** when the target features are continuous.

Other learning tasks include:

* Unsupervised learning
    * Without defined targets
* Reinforced learning
    * Based on rewards and punishments
* Analytic learning
    * Learning to reason faster
* Inductive logic programming
    * Learning richer representation such as logic programs



### Feedback

[7.1: Feedback](https://artint.info/2e/html/ArtInt2e.Ch7.S1.html#I2.ix66)

Learning tasks can be characterized by the feedback given to the learner.

* **Supervised Learning**: What has to be learned is specified for each training example.
* **Unsupervised Learning:** No classifications are given, and the learner must discover categories and regularities in the data.

Feedback often falls between these extremes, such as:

* **Reinforcement Learning:** Feedback in terms of rewards and punishments occurs after a sequence of actions

    * This leads to the **credit assignment problem** of determining which actions were responsible for the rewards or punishments.

        

### Representation

[7.1: Representation](https://artint.info/2e/html/ArtInt2e.Ch7.S1.html#I2.ix67)

Experiences must affect the agents internal representation. This internal representation could be the raw experiences, but it is typically a compact representation that generalizes the data.

* The problem of inferring an internal representation based on examples is called **induction**.

* The problem of deriving consequences of a knowledge base is called **deduction**
* Hypothesizing what may be true about a particular case is called **abduction**



Two principles are at odds:

*  *The richer the representation, the more useful it is for subsequent problem solving*. 
*  *The richer the representation, the more difficult it is to learn*.



### Online and Offline

* **Online Learning:** Training examples arrive as the agent is acting.
* **Offline Learning:** All of the training examples are available to an agent before it needs to act.

An agent that learns online requires some representation of its previously seen examples before it has seen all of its examples. As new examples are observed, the agent must update its representation. 

**Active learning** is a form of online learning in which the agent acts to acquire useful examples from which to learn.



### Measuring Success

To know whether an agent has learned, we must define a measure of success. The measure is usually not how well the agent performs on the training data, but how well the agent performs for new data. 

Success in learning should not be judged on correctly classifying the training set, but  on being able to correctly classify unseen examples.

* Thus, the learner must **generalize:** go beyond the specific given examples to classify unseen examples.

To evaluate a learning procedure, we can divide the examples into **training examples** and **test examples**.



### Bias

The tendency to prefer one hypothesis over another is called a **bias**.

* Without a bias, an agent will not be able to make any predictions on unseen examples.
* What constitutes a good bias is an empirical question about which biases work best in practice.



### Learning as Search

Given a representation and a bias, the problem of learning can be reduced to one of search.

Unfortunately, the search spaces are typically prohibitively large for systematic search.

* The definition of the learning algorithm then becomes one of defining the search space, evaluation function and search method.



### Noise

In most real-world situations, the data are not perfect. 

There can be **noise** where the observed features are not adequate to predict the classification, **missing data** where the observations of some of the features for some or all of the examples are missing, and **errors** where some of the features have been assigned wrong values. 

One of the important properties of a learning algorithm is its ability to handle noisy data in all of its forms. 



### Interpolation and Extrapolation

**Interpolation:** Making a prediction between cases for which there are  data.

**Extrapolation:** Making a prediction that goes beyond the seen examples.

Extrapolation is usually much less accurate than interpolation.

