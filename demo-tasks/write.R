data <- cars
cols <- names(data)

for (i in seq_along(cols)) {
  path <- paste0(cols[i], ".csv")
  message("Writing ", path, " in ", getwd())
  readr::write_csv(data[i], path)
  
  Sys.sleep(5)
}
