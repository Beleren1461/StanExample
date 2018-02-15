data{
  int N;
  real Y[N];
  real <lower=0> sd_theta;
  real <lower=0> sd_0;
  
}parameters{
  
  real theta;

}model{
  
  theta~ normal(0,sd_theta);
  for(i in 1:N) Y ~ normal(theta,sd_0);
  
}

