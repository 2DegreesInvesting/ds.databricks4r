
# Overview

## Workspace

- Add a folder: Home \> Add \> Folder
- Add an R file: Home \> Add \> file.R
- Connect to a running cluster.
- Run

``` r
print("Hello world")
```

- Note the Output and Terminal tabs
- Home \> Add \> Notebook

``` r
print("Hello world")
```

- Add a markdown chunk

<!-- -->

    %md
    # Demo

    Hello world.

LIMITATIONS AND SURPRISES

- Editing text is limited.

- Only a few file formats are supported. Try bad.sh

``` bash
# Fails
echo "hi"
```

- The file system’s structure doesn’t match Databricks UI.

``` bash
$ ls /Workspace
Repos  Shared  Users

# Fails
$ ls /Repos
```

<image width=700 src=https://github.com/2DegreesInvesting/ds.databricks4r/assets/5856545/e5064487-bd68-4a9a-956f-f35ebb99481b>

## Catalog

Read a .csv file from the file system.

``` r
path <- "/databricks-datasets/Rdatasets/data-001/datasets.csv"
data <- readr::read_csv(path)
data
```

Read a parquet file from the Databricks Catalog.

<image width=700 src=https://github.com/2DegreesInvesting/ds.databricks4r/assets/5856545/a632de43-c83e-41be-9577-3b7c89019156>

``` r
path <- "raw.default.country"
data <- SparkR::tableToDF("raw.default.country")
data
```

LIMITATIONS AND SURPRISES

- SparkR is no longer on CRAN [(archived in 2021 for lack of
  maintenance)](https://cran.r-project.org/web/packages/SparkR/index.html).
  The sparklyr package seem like a good alternative but I failed to use
  it.

## Workflows

- Create a notebook that writes then deletes .csv files.

``` r
data <- cars
cols <- names(data)

for (i in seq_along(cols)) {
  path <- paste0(cols[i], ".csv")
  message("Writing ", path, " in ", getwd())
  readr::write_csv(data[i], path)
  
  Sys.sleep(5)
}
```

- Create a workflow, run and view the workflow.

## Overview clusters and RStudio

- Create a new cluster with RStudio (new-ish, Runtime ML, no auto
  termination).
- Try to use it to run a previous file. Note it takes time to start.
- Setup RStudio: Compute \> click on cluster \> Apps \> Set up RStudio.

LIMITATIONS AND SURPRISES

- Starting a cluster takes minutes.
- RStudio lacks `sudo`.
- RStudio requires no auto-termination.
- RStudio fails to read from the Databricks Catalog.

## Overview GitHub connection

…
