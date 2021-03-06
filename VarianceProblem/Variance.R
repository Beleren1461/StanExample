library(rstan)
library(shinystan)
library(ggplot2)
library(latex2exp)

theta_0=23 # True mean of generator process
sigma.T=10 # True standard deviation of generator process

sigma_0 <- 100 # stadard deviation of prior distribution


Y <- rnorm(40,theta_0,sigma.T) # generate the data
N=length(Y)


# url of the model 
model.url <- "https://raw.githubusercontent.com/Beleren1461/StanExample/Variance_Problem/VarianceProblem/Modello.Stan"

# compile the model
modello.compiled <- rstan::stan_model(file = model.url,model_name = "Test")

# run the sampler
Stan.sample <- rstan::sampling(modello.compiled,
                               data=list(Y=Y,
                                         N=N,
                                         sigma_0=sigma_0,
                                         sigma=sigma.T),
                               iter=100000,
                               warmup=1000,
                               algorithm="NUTS")


# extract a list of values
Stan.values <- extract(Stan.sample)
# puth them into dataframe
example <- data.frame(theta=Stan.values[["theta"]],logPos=Stan.values[["lp__"]])

Sample.sd <- sd(example$theta)
Sample.mean <- mean(example$theta)

##### result https://en.wikipedia.org/wiki/Conjugate_prior 

Posterior.sd <- sqrt((1/sigma_0^2+N/sigma.T^2)^-1)
Posterior.mean <- Posterior.sd^2*(0/sigma_0^2+sum(Y)/sigma.T^2)

gg <- ggplot(data = example,aes(x=theta))
gg+
  stat_function(fun = dnorm,args = list(mean = Posterior.mean,sd = Posterior.sd),colour="red",size=1.5)+ 
  labs(x=TeX("$\\theta$"),y=TeX("$\\pi(\\theta | Y)$")) + 
  geom_histogram(aes(y=(..count../sum(..count..))*1),bins=16,alpha=0.7)