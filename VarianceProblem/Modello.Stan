data{
  int N;
  real Y[N];
}parameters{
  
  real theta;

}model{
  
  theta~ normal(0,100);
  for(i in 1:N) Y ~ normal(theta,10);
  
}

