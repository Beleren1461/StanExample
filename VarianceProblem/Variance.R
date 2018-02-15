library(rstan)
library(shinystan)

theta_0=23 # True mean of generator process
sd_0=10 # True standard deviation of generator process

Y <- rnorm(40,theta_0,sd_0) # generate the data

# url of the model
model.url <- ""

# compile the model
modello.compiled <- rstan::stan_model(file = model.url,model_name = "Test")

# run the sampler
Stan.sample <- rstan::sampling(modello.compiled,
                               data=list(Y=Y,N=length(Y)),
                               iter=1000,
                               warmup=100,
                               algorithm="NUTS")


# extract a list of values
Stan.values <- extract(Stan.sample)
# puth them into dataframe
esempio <- data.frame(theta=Stan.values[["theta"]],logPos=Stan.values[["lp__"]])


##### result of the book: First 


