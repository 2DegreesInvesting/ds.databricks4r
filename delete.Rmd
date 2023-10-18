Delete .csv files.

```{r}
csv_files <- fs::dir_ls(regexp="[.]csv")
fs::file_delete(csv_files)
```

