# Nextflow Nanopore Assembly Workshop

This is a **Nextflow pipeline** developed during the North African Workshop **Reproducible Bioinformatics with Nextflow: Applications in OMICS**. 

The pipeline performs quality control, trimming, assembly, polishing, and annotation of simulated Nanopore reads.

## 📁 Project Structure
```
project/
├── main.nf                          # Main workflow - start here
├── nextflow.config                  # Configuration settings
├── README.md                        # This file
│
├── modules/                         # Individual tools
│   ├── qc/
│   │   ├── nanoplot.nf             # Read quality plots
│   │   ├── fastqc.nf               # FastQC analysis
│   │   └── quast.nf                # Assembly quality check
│   ├── trim/
│   │   ├── porechop.nf             # Adapter trimming
│   │   └── filtlong.nf             # Read filtering
│   ├── assembly/
│   │   └── flye.nf                 # Genome assembly
│   ├── polish/
│   │   └── racon.nf                # Assembly polishing
│   └── annotation/
│       └── prokka.nf               # Gene annotation
│
├── subworkflows/                    # Workflow logic
│   ├── qc_workflow.nf              # QC steps
│   ├── trim_filter_workflow.nf     # Trimming and filtering
│   ├── assembly_workflow.nf        # Assembly
│   ├── polish_workflow.nf          # Polishing
│   ├── assembly_qc_workflow.nf     # Assembly QC
│   └── annotation_workflow.nf      # Annotation
│
├── data/
│   └── sim_nanopore_5x.fastq       # Test data (simulated reads)
│
├── results/                         # Output folder (created when run)
│
└── envs/
    └── environment.yml              # Conda environment setup
```

## Dependencies

This pipeline uses **Conda** for reproducibility. 
The environment file is located at: `envs/environment.yml`

To create the environment:
```bash
conda env create -f envs/environment.yml
```

To activate the environment:
```bash
conda activate nf
```

## Usage

Run the pipeline using the Conda profile:
```bash
nextflow run main.nf -profile conda
```

## Nextflow Version

This pipeline was tested with:
```
N E X T F L O W   ~  version 24.10.6
```

## Input Data

The pipeline uses a simulated Nanopore dataset located in:
```
data/sim_nanopore_5x.fastq
```

## Acknowledgments

**Nextflow Ambassador in Tunisia:**
[**Dr. Houcemeddine Othman**](https://github.com/hothman) 
& [**Mr. Firas Zemzem**](https://github.com/Zemzemfiras1) 

**Workshop Coordinator:**
Dr. Fatma Guerfali

Special thanks to all workshop participants.
