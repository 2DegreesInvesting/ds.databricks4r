ANALYST WORKFLOWS

* Connect to GitHub, clone repositories, and pull code.

> It's fairly easy. Databricks installs an app on GitHub that enables the secure connection.

* Write R code in a notebook and .R file, then export it to .Rmd or .R.

> Note that importing .Rmd files converts them to simpler notebooks. Compared to writing code in an IDE, writing in notebooks or .R file on Databricks feels limited.

* Notice the limitations to work with Git.

> The support for Git from Databricks seems limited to mostly pulling code, with minimal if any ability to do anything else. Databricks nudges users to work with Git outsied of Databricks.

* Read data from the Databricks Catalog.

> This is easy with R, Python and SQL. For example:

```r
%r
library(SparkR, warn.conflicts=FALSE)

df <- tableToDF("raw.default.country")
display(df)
```

* Read data from the Azure Storage

> It's reasonably easy via the AzureStor package, and in RStudio if we can use the Connections panel.

* Run a script as a job

> This seems to be where Datab*ricks shines. You can create and schedule jobs,
typically from the Databricks UI.

* Use RStudio on the cloud

> Databricks ML runtime comes with RStudio server. Setting it up is easy, but
it's incompatible with auto-termination and sudo is dissabled.

* Connect to spark from RStudio.

> So far I failed to do this.

DEVELOPER WORKFLOWS

* Run Docker Container from a Specific Image.

> It's not encouraged but it seems possible. Databricks provides images to base the custom images from.

* Install new software.

> Libraries with sudo Privileges: I have not found a way to get environments with sudo. Databricks manages libraries installation in its own way.

* Develop an R package.

> Create, Test, and Check an R Package: Databricks does not offer an IDE. It's
good for running code but not for developing it.
