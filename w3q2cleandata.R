library('jpeg')
w3q2<-readJPEG("datacleanw3q2.jpg",native=T)
quantile(w3q2, probs = seq(0.3, 0.5, 0.8))