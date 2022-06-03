## ----setup, warning= FALSE----------------------------------------------------
library(epi2me2r)

## ----metadata combo example, message = FALSE, warning= FALSE------------------
epi2me.metadata <- read.csv(system.file("extdata", "example_metadata.csv", package = "epi2me2r"))
head(epi2me.metadata)

## ----amr phylo----------------------------------------------------------------
example.amr.dir <- system.file("extdata", "example_amr_data", package = "epi2me2r")

ps.amr.object <- amr_raw_to_phyloseq(path.to.amr.files = example.amr.dir,
                                     metadata = epi2me.metadata,
                                     coveragenumber = 80, 
                                     keepSNP = FALSE)

## ----amr mgs------------------------------------------------------------------
mgs.amr.object <- amr_raw_to_metagenomeseq(path.to.amr.files = example.amr.dir,
                                           metadata = epi2me.metadata,
                                           coveragenumber = 80, 
                                           keepSNP = FALSE)
mgs.amr.object

## ----wimp phylo, eval = FALSE-------------------------------------------------
#  example.wimp.dir <- system.file("extdata", "example_wimp_data", package = "epi2me2r")
#  
#  ps.wimp.object <- wimp_raw_to_phyloseq(path.to.wimp.files = example.wimp.dir,
#                                         metadata = epi2me.metadata,
#                                         keep.unclassified = FALSE,
#                                         keep.human = FALSE)

## ----wimp mgs, eval = FALSE---------------------------------------------------
#  mgs.wimp.object <- wimp_raw_to_metagenomeseq(path.to.wimp.files = example.wimp.dir,
#                                               metadata = epi2me.metadata,
#                                               keep.unclassified = FALSE,
#                                               keep.human = FALSE)

## ----amr read in--------------------------------------------------------------
amr.count.table <- read_in_amr_files(path.to.amr.files = example.amr.dir,
                                     coveragenumber = 80, 
                                     keepSNP = FALSE)
head(amr.count.table)

## ----amr tax read in----------------------------------------------------------
amr.taxonomy <- generate_amr_taxonomy(amr.count.table = amr.count.table,
                                         verbose = FALSE)
head(amr.taxonomy)

## ----wimp read in-------------------------------------------------------------
example.wimp.dir <- system.file("extdata", "example_wimp_data", package = "epi2me2r")

wimp.count.table <- read_in_wimp_files(path.to.wimp.files = example.wimp.dir)
head(wimp.count.table)

## ----wimp tax, eval=FALSE-----------------------------------------------------
#  wimp.taxonomy <- generate_wimp_taxonomy(wimp.count.table = wimp.count.table)

## ----amr read, eval=FALSE-----------------------------------------------------
#  amr.read.classification <- amr_read_taxonomy(path.to.amr.files = example.amr.dir,
#                                               path.to.wimp.files = example.wimp.dir)

