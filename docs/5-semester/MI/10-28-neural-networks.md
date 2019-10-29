---
title: "Learning: Neural Network"
course: MI
session: 28.10
date: 28-10-19
---

# Learning: Neural Networks

[Tensorflow Playground]([https://playground.tensorflow.org](https://playground.tensorflow.org/))

$$
\newcommand{\derr}[1]{\frac{\part}{\part {#1}}}
$$


## Linear Regression and Classification

**Linear Regression:** The problem of fitting a linear function to a set of training examples, in which the input and target features are numeric.

$$
\begin{align*}
\hat Y^{\overline w}(e) &= w_0+w_1 * X_1(e)+\dots +w_n * X_n(e)\\
&= \sum^n_{i=0}w_i*X_i(e)
\end{align*}
$$
where $\overline w=\langle w_0,w_1,\dots,w_n\rangle$ is a tuple of weights.

To make $w_0$ not be a special case, new feature $X_0$ is always 1.



Suppose $E$ is a set of examples. The sum-of-squares error on $E$ for $Y$ is:

$$
\begin{align*}
error(E,\overline w) &= \sum_{e\in E}\left( Y(e)-\hat Y^{\overline w}(e) \right)^2 \\
&= \sum_{e\in E}\left( Y(e)- \sum^n_{i=0}w_i*X_i(e) \right)^2
\end{align*}
$$

The weights that minimize the error can be computed analytically. A more general approach, is to compute the weights iteratively.



### Gradient Descent

An iterative method for finding the minimum of a function.

* Starts with an initial set of weights
* In each step, it decreases each weight in proportion to its partial derivative.

$$
w_i:=w_i-\eta *\frac{\partial}{\partial w_i}error(E, \overline w)
$$

where $\eta$, the gradient descent step size, is called the **learning rate**.

* Given as the input to the learning algorithm



#### Linear Learner

![image-20191029162308821](images/10-28-neural-networks/image-20191029162308821.png)

* Termination is usually after some number of steps, when the error is small or when the changes get small. 



Not strictly implementing gradient descent.

Weights change while it iterates through the examples (**Incremental gradient descent**)

If examples are selected at random, its called **stochastic gradient descent**

**Batched gradient descent** updates the weights after a batch of examples.

* If batch is equal to all examples, its equivalent to gradient descent.



### Squashed Linear Functions

Consider binary classification. (domain of target is $\{0,1\}$)

The use of a linear function does not work well for such classification tasks; a learner should never make a prediction of greater than 1 or less than 0. 

A **squashed linear function** is of the form:

![image-20191029162929133](images/10-28-neural-networks/image-20191029162929133.png)

where $f$, an **activation function**, is a function from the real line $[-\infty,\infty]$ into some subset of the real line, such as $[0,1]$

* A prediction based on a squashed linear function is a **linear classifier**.
* A simple activation function is the **step function, ** $step_0(x)$, defined by:

$$
step_0(x)= 
\left \{ \begin{array}\
	1 & \text{if } x \geq0 \\
	0 & \text{if } x < 0
\end{array} \right .
$$



One differentiable activation function is the **sigmoid** or **logistic function**:

 ![img](images/10-28-neural-networks/x393.png) 


$$
sigmoid(x)=\frac{1}{1+e^{-x}}
$$
This function squashes the real line into the interval $(0,1)$

* Appropriate for classification
* Differentiable
    * $\frac{d}{dx}sigmoid(x)=sigmoid(x)*(1-sigmoid(x))$



The problem of determining weights for the sigmoid of a linear function that minimize an error on a set of examples is called **logistic regression**

To optimize the **log loss** error for logistic regression, minimize the negative log-likelihood:

![image-20191029163920907](images/10-28-neural-networks/image-20191029163920907.png)

where $\delta(e)=Y(e)-\hat Y^{\overline w}(e)$



The $Linear\_learner$ algorithm can be modified to carry out logistic regression to minimize log loss.

![image-20191029164114662](images/10-28-neural-networks/image-20191029164114662.png)



[Example 7.11](https://artint.info/2e/html/ArtInt2e.Ch7.S3.SS2.html#Ch7.Thmciexamplered11 )



### Linearly Separable

Consider each input feature as a dimension.

If there are $n$ features, there will be $n$ dimensions.

A **hyperplane** in an $n$-dimensional space is a set of points that all satisfies a constraint that some linear function of the variable is zero.

The hyperplane forms a $(n-1)$-dimensional space.

* In 2D that's a line
* In 3D that's a plane

A classification is **linearly separable** if there exists a hyperplane where the classification is true on one side of the hyperplane and false on the other side.



Figure 7.11: Linear separators for Boolean functions:

 ![img](images/10-28-neural-networks/x394.png) 

[Example 7.12 + 7.13](https://artint.info/2e/html/ArtInt2e.Ch7.S3.SS2.html#Ch7.Thmciexamplered12)



## Neural Networks

There are many different types of neural networks. The book considers **feed-forward neural networks**.

* Hierarchy consisting of linear functions interleaved with **activation functions**



Neural network can have multiple input and target features (real-valued)

* Discrete features can be transformed into [indicator variables](https://artint.info/2e/html/ArtInt2e.Ch7.S2.SS1.html#Ch7.S2.I2.i4) or [ordinal features](https://artint.info/2e/html/ArtInt2e.Ch7.S2.SS1.html#Ch7.S2.I2.i2).

* Inputs feed into layers of **hidden units**

    * Features never directly observed
    * A simple function of the units in a lower layer.

    

 ![img](images/10-28-neural-networks/x398.png) 

<center>Figure 7.16: A deep neural network.</center>



### Layers

Each layer of units is a function of the previous layer. Each example has a value for each unit. We consider 3 kinds of layers:

* An **input layer** consists of a unit for each input feature.

    * Gets its value for an example from the value for the corresponding input feature for that example.

* A **complete linear layer**, where each output $o_j$ is a linear function of the input values $v_i$ to the layer (and, as in [linear regression](https://artint.info/2e/html/ArtInt2e.Ch7.S3.SS2.html), an extra constant input that has value “1” is added) defined by:

    ​	$o_j=\sum_i w_{ji}v_i$

    for weights $w_{ji}$ that are learned. There is a weight for every input-output pair of the layer. in the diagram of Figure 7.16 there is a weight for every arc for the linear functions.

* An **activation layer**, where each output $o_i$ is a function of the corresponding input value;

    * thus $o_i=f(v_i)$ for activation function $f$.

    Typical activation functions are the 

    * $sigmoid: \quad f(x)=1/(1+e^{-x})$,  and the 
    * **rectified linear unit**       $ReLU:\quad f(x)=\max(0,x)$



For regression, where the prediction can be any real number, its typical for the last layer to be complete linear layer.

For binary classification, where the output values can be mapped to $\{0,1\}$ it is typical for the output to be a sigmoid function of its input

* We never want to predict a value greater or less than zero.



### Back-Propagation

**Back-propagation** implements stochastic gradient descent for all weights.

There are two properties of differentiation used in back-propagation:

* **Linear rule:** the derivative of a linear function is given by;

$$
\derr{w}(aw+b)=a
$$

* **Chain rule:** if $g$ is a function  of $w$ and function $f$, which does not depend on $w$, is applied to $g(w)$, then

$$
\derr w f(g(w))=f'(g(w))*\derr w g(w)
$$



Learning consists of two passes through the network for each example:

* Prediction: given the values on the inputs for each layer, compute a value for the outputs of the layer
* Back-propagation: go backwards through the layers to update all of the weights of the network.

