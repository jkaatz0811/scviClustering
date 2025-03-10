# Evaluation of clustering in scVI latent space on Zebrafish embryogenesis dataset
This repository provides Jupyter notebooks and scripts with the necessary code to reproduce the computations, results and visualizations in the corresponding thesis.\
It includes the preperation of the Zebrafish embryogenesis dataset[^dataset] from Farrell et al. to include only the gastrulation stage from 3.3 to 12 hpf, the construction of metacells[^metacells] with the original algorithm, the scVI[^scvi] latent space construction followed by a k-means clustering to generate clusters that will be compared to the metacells, the introduction of two metrics to evaluate the quality of the scVI clustering and the visualizations.

## Prerequisites
Since some packages required to run the provided code are dependent on older versions of standard packages like `numpy`, setting up a new conda environment is strongly recommended.\
Also the `metacell` package natively runs only on Linux and MacOS.

1. An interface to execute Jupyter notebooks

2. R environment including
    - [`Seurat`](https://github.com/satijalab/seurat)
    - [`anndata`](https://github.com/scverse/anndata)
      - functional [`reticulate`](https://github.com/rstudio/reticulate) installation is required since `anndata` is a python package

3. Python installation including
     - [`anndata`](https://github.com/scverse/anndata)
     - [`Matplotlib`](https://github.com/matplotlib/matplotlib)
     - [`metacells`](https://github.com/tanaylab/metacells)
       - requires [`numpy`](https://github.com/numpy/numpy) version 2.1 or lower
     - [`scvi-tools`](https://github.com/scverse/scvi-tools)
       - may only work with python version 3.10 or lower
     - [`umap-learn`](https://github.com/lmcinnes/umap)
     - [`Scanpy`](https://github.com/scverse/scanpy)

## Cloning repository
You can clone this repository with 
```
git clone https://github.com/jkaatz0811/scviClustering.git
```

## Data availability
To obtain the [Daniocell](https://daniocell.nichd.nih.gov/) seurat object from the Farrell Lab at NICHD use
```
cd data
wget https://daniocell.nichd.nih.gov/assets/obj-download/Daniocell2023_SeuratV4.rds
```

## Available notebooks
### Prepairing the data
- To create the h5ad anndata objects that are required for the remaining notebooks, execute [import_daniocell_gastrulation_data](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/import_daniocell/import_daniocell_gastrulation_data.ipynb)
- The basic construction of the metacell anndata object can be found in the [metacell_construction_daniocell2023](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/metacell_construction/metacell_construction_daniocell2023.ipynb) notebook
- The steps to construct the scVI latent space can be executed and reviewed in [scVI_selectedGenes](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/scVI/scVI_selectedGenes.ipynb)

### Run the evaluations
- The comparison with reference to the scRNA-seq gene expression of the metacells and the scVI clustering can be found in [scvi_mc_scRNAseqCorrelation](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/scvi_mc_scRNAseqCorrelation.ipynb)
- The gene overdispersion evaluation is examined in the [overdispersion](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/overdispersion.ipynb) notebook
- Basic visualizations regarding the scRNA-seq, the metacells and the scVI clustering datasets can be found in [dataExploration](https://github.com/jkaatz0811/scviClustering/blob/main/notebooks/dataExploration.ipynb)
- The two evaluation metrics with a partially shuffled scVI clustering dataset are provided in the [notebooks](https://github.com/jkaatz0811/scviClustering/tree/main/notebooks) folder

# Acknowledgement
The work on the notebooks and scripts to convert the Daniocell seurat into an anndata object as well as the code to compute the metacells have been provided by Dr. Markus Mittnenzweig and the [Mittnenzweig Lab](https://www.mdc-berlin.de/mittnenzweig) at the [Berlin Institute for Medical Systems Biology of the Max Delbrück Center (MDC-BIMSB)](https://www.mdc-berlin.de/).

# References
[^dataset]: Sur, Abhinav et al. “Single-cell analysis of shared signatures and transcriptional diversity during zebrafish development.” Developmental cell vol. 58,24 (2023): 3028-3047.e12. doi:[10.1016/j.devcel.2023.11.001](https://doi.org/10.1016/j.devcel.2023.11.001)
[^metacells]: Ben-Kiki, O., Bercovich, A., Lifshitz, A. et al. Metacell-2: a divide-and-conquer metacell algorithm for scalable scRNA-seq analysis. Genome Biol 23, 100 (2022). [10.1186/s13059-022-02667-1](https://doi.org/10.1186/s13059-022-02667-1)
[^scvi]: Gayoso, A., Lopez, R., Xing, G. et al. A Python library for probabilistic analysis of single-cell omics data. Nat Biotechnol 40, 163–166 (2022). [10.1038/s41587-021-01206-w](https://doi.org/10.1038/s41587-021-01206-w)

