data{
  int N;
  real Y[N];
  real <lower=0> sigma_0;
  real <lower=0> sigma;
  
}parameters{
  
  real theta;

}model{
  
  theta~ normal(0,sigma_0);
  Y ~ normal(theta,sigma);
  
}

