# Evaluation of clustering in scVI latent space on Zebrafish embryogenesis dataset
This repository provides Jupyter notebooks and scripts with the necessary code to reproduce the computations, results and visualizations in the corresponding thesis.\
It includes the preperation of the Zebrafish embryogenesis dataset from Farrell et al. [?] to include only the gastrulation stage from 3.3 to 12 hpf, the construction of metacells [?] with the original algorithm, the scVI [?] latent space construction followed by a k-means clustering to generate clusters that will be compared to the metacells, the introduction of two metrics to evaluate the quality of the scVI clustering and the visualizations for the thesis.

## Prerequisites
Since some packages required to run the provided code are dependent on older versions of standard packages like `numpy`, setting up a new conda environment is strongly recommended.\
Also the `metacell` package natively runs only on Linux and MacOS.

1. Some plattform to execute Jupyter notebooks (e.g. Anaconda[?])

2. R installation including
    - `Seurat` [?]
    - `anndata` [?]
      - functional `reticulate` installation is required since `anndata` is a python package

3. Python installation including
     - `anndata`
     - `Matplotlib`
     - `IPython` (version < 9.0)
     - `metacells`
       - requires `numpy` version 2.1 or lower

## Cloning repository
You can clone this repository with 
```
git clone https://github.com/jkaatz0811/scviClustering.git
```

## Data availability
To obtain the seurat object from the Farrell Lab[link] at NICHD[link] use
```
cd data
wget https://daniocell.nichd.nih.gov/assets/obj-download/Daniocell2023_SeuratV4.rds
```
