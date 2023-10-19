
# Databricks for RStudio users

The goal of this series is to help R users understand if and how they
can do in Databricks the things they already do elsewhere – mainly un
RStudio and the Terminal.

At the end of this series you’ll be able to do things like this:

- Add folders, .R files and notebooks to your Workspace.
- Connect to an existing cluster.
- Work with Git and GitHub.
- Create a dataframe from a .csv file in the file system.
- Create a spark dataframe from a table in the Databricks Catalog.
- Create and run jobs.
- Create a cluster with RStudio installed in it.
- Understand the limitations and suprises in all of the above.

## Who is the audience?

Analysts and developers used to working with R from the RStudio IDE.

## Why is this important?

Databricks allows you to work with data at scale from a simple
interface. With that simple interface you can do powerful things, but
not all the things you typically do in RStudio, and not in the way
you’re used to. For example, it changes the way you install some
software, read, and manipulate data. Recognizing the intended use of
Databricks is crucial to avoid mistakes and friction.

## Syllabus

### Workspace

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

FRICTION

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

FRICTION \### Catalog

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

FRICTION

- SparkR is no longer on CRAN [(archived in 2021 for lack of
  maintenance)](https://cran.r-project.org/web/packages/SparkR/index.html).
- The sparklyr package seem like a good alternative but I failed to use
  it.
- Code written for R dataframes may not work for [spark
  dataframes](https://spark.apache.org/docs/latest/sparkr.html#sparkdataframe-operations).
- The [sparklyr
  package](https://spark.rstudio.com/deployment/databricks-cluster.html)
  may help but I failed to configure and use it.

FRICTION \### Compute

- Create a new cluster with RStudio (new-ish, Runtime ML, no auto
  termination).
- Try to use it to run a previous file. Note it takes time to start.
- Setup RStudio: Compute \> click on cluster \> Apps \> Set up RStudio.
- Read data from an Azure storage container via a SAS token.

<img width=700 src=https://github.com/2DegreesInvesting/tiltIndicator/assets/5856545/f8aa5a3e-ebff-48e6-87eb-889f477c8831>

``` r
library(AzureStor)

# usethis::edit_r_environ()
# User delegation key with all 10 permissions
# AZURE_CONTAINER_SAS_TEST_MAURO="paste the SAS token here"
url <- "https://storagetiltdevelop.blob.core.windows.net/test-mauro"
sas <- Sys.getenv("AZURE_CONTAINER_SAS_TEST_MAURO")
container <- blob_container(url, sas = sas)

storage_read_csv(container, "data/iris.csv")
```

FRICTION

- Starting a cluster takes minutes.
- RStudio lacks `sudo`.
- RStudio requires no auto-termination.
- RStudio fails to read from the Databricks Catalog.
- RStudio won’t persist when restarting the cluster.

## Resources

- YouTube [playlist](https://bit.ly/ds-incubator-videos).
- [What is
  Databricks](https://docs.databricks.com/en/introduction/index.html).

## Thanks

Tanks Sven for patiently answering my questions.
