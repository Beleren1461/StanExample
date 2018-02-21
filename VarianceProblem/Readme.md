# Problem: verify the calculus of the variance

My problem is calculate the variance of posterior distribution of theta parameter, with known variance of the data process generator, and the prior parameter.

The true model that generate the data is:

$Y \sim \mathcal{N}(\theta=23,\sigma=10)$

The prior distribution is:

$\theta \sim \mathcal{N}(\mu_0,\sigma_0)$

and the likelihood

$Y \sim \mathcal{N}(\theta,\sigma=10)$

The Bayesian [theory](https://en.wikipedia.org/wiki/Conjugate_prior) said that the posterior mean and variance, if the prior distribution and the likelihood are normal, are equal to:

$\mathbb{E}(\beta |Y, \mu_0,\sigma_0,\sigma)=\left(\frac{1}{\sigma^2_0}+\frac{n}{\sigma^2}\right)^{-1}\left(\frac{\mu_0}{\sigma^2_0}+\frac{\hat{\mu}}{\sigma^2}\right)$

$\mathbb{V}ar(\beta |Y, \mu_0,\sigma_0,\sigma)=\left(\frac{1}{\sigma^2_0}+\frac{n}{\sigma^2}\right)^{-1}$

where:

$\hat{\mu}=\sum_{i=1}^n y_i$


In the script called [Variance.R](https://raw.githubusercontent.com/Beleren1461/StanExample/master/VarianceProblem/Variance.R), i try to demonstrate this assumption with Stan software.

In this image it is possible to see like the histogram, that rapresent the sample extracted from Stan simulation, it aproximates very well the the normal posterior distribution drawn in red.

![][Posterior]

[Posterior]: https://raw.githubusercontent.com/Beleren1461/StanExample/Variance_Problem/VarianceProblem/Posterior%20distribution.png