


while (TRUE) {
  x <- sample(1:100, 1)
  write.table(x,'teste.txt', append = FALSE)
  Sys.sleep(5)
}

