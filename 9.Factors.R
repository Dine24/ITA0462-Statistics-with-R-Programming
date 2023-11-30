print_factors=function(n){
  print(paste("The factors of",n,"are:"))
  for(i in 1:n){
    if((n%%i)==0){
      print(i)
    }
  }
}
print_factors(4)
print_factors(7)