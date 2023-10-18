# Databricks notebook source
# MAGIC %md
# MAGIC Delete all .csv files in the working directory

# COMMAND ----------

csv_files <- fs::dir_ls(regexp="[.]csv")
fs::file_delete(csv_files)