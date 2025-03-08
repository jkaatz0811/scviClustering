library(anndata)
library(Matrix)
library(Seurat)
library(data.table)

# Function to convert normalized counts to UMI matrix and save as AnnData
convert_to_anndata <- function(seurat_obj, output_path = NULL,cells_subset = NULL) {
  # Extract raw counts from the Seurat object
  raw_counts <- seurat_obj@assays$RNA@data
  cell_metadata <- seurat_obj@meta.data
  
  if(!is.null(cells_subset)) {
    raw_counts <- raw_counts[,cells_subset]
    cell_metadata <- cell_metadata[cells_subset,]
  }
  # Invert the log normalization
  counts_tmp <- expm1(raw_counts)

  # Scale counts by column minimum
  mat = mat2triplet(counts_tmp)
  dt = data.table(j = mat$j, value = mat$x)
  dt_new = dt[, .(min_value = min(value)), by = j]

  counts_tmp <- t(t(counts_tmp) / dt_new$min_value)

  # Compute and print maximal rounding error
  rounded_counts <- round(counts_tmp)
  rounding_error <- max(abs(rounded_counts - counts_tmp))
  print(paste("Maximal rounding error:", rounding_error))

  # Create AnnData object
  adata <- AnnData(X = t(rounded_counts), obs = cell_metadata)

  # Save AnnData object
  if(!is.null(output_path)) {
        adata$write_h5ad(output_path)
        print(paste("AnnData saved to:", output_path))
  }

  return(adata)
}

# Example usage
# daniocell <- LoadYourSeuratObjectHere()  # Load your Seurat object
# convert_to_anndata(daniocell, "output_path.h5ad")
