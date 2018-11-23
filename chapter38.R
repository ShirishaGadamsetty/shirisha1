#CREATE PASSWORD GENERATOR APP WITH R

#R Function - Password Generator

password.generator <- function(len, n){
  dummydt=data.frame(matrix(ncol=0,nrow=n))
  num <- 1:9
  spcl <- c("!",  "#", "$", "%", "&", "(", ")", "*",  "+", "-", "/", ":",
            ";", "<", "=", ">", "?", "@", "[", "^", "_", "{", "|", "}", "~")
  comb <- c(num, spcl, letters, LETTERS)
  p <- c(rep(0.035, 9), rep(0.015, 25), rep(0.025, 52))
  password<-replicate(nrow(dummydt),paste0(sample(comb, len, TRUE, prob = p), collapse = ""))
  dummydt$password<-password
  return(dummydt)
}
PasswrdFile = password.generator(len = 8, n = 100)
