nextflow.enable.dsl = 2

include { nanoplot } from '../modules/qc/nanoplot.nf'
include { fastqc }   from '../modules/qc/fastqc.nf'

workflow QC {
    take:
        reads

    main:
        nanoplot(reads)
        if (params.fastqc) {
            fastqc(reads)
        }

    emit:
        cleaned_reads = reads
}
