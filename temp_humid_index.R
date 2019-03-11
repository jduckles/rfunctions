# THI - Temperature Humidity Index


# 0.8T+[RH x (T-14.4)]+46.4 

compute_thi <- function(temp_c,humid_pct) {
 return (0.8 * temp_c + (humid_pct/100 * ( temp_c - 14.4) ) + 46.4)
}


plot_thi <- function(temp = 25:45,
                     humid = seq(25, 100, by = 5)) {
  crosses <- crossing(temp, humid)
  
  o <- crosses %>% mutate(thi = compute_thi(temp, humid))
  
  ggplot(o, aes(x = humid, y = temp)) +
    geom_contour(aes(z = thi)) +
    scale_y_reverse() +
    geom_label_contour(aes(z = thi))
}



