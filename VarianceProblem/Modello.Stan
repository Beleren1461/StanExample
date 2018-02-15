data{
  int N;
  real Y[N];
  real <lower=0> sigma_0;
  real <lower=0> sigma;
  
}parameters{
  
  real theta;

}model{
  
  theta~ normal(0,sigma_0);
  for(i in 1:N) Y ~ normal(theta,sigma);
  
}

