#!/usr/bin/env nextflow
nextflow.enable.dsl = 2

include { QC }          from './subworkflows/qc_workflow.nf'
include { TRIM_FILTER } from './subworkflows/trim_filter_workflow.nf'
include { ASSEMBLY }    from './subworkflows/assembly_workflow.nf'
include { POLISH }      from './subworkflows/polish_workflow.nf'
include { ANNOTATION }  from './subworkflows/annotation_workflow.nf'

workflow {
    reads_ch = Channel.fromPath(params.reads)

    qc = QC(reads_ch)
    trimmed = TRIM_FILTER(qc.cleaned_reads)
    assembly = ASSEMBLY(trimmed.filtered_reads)
    polished = POLISH(assembly.contigs, trimmed.filtered_reads)
    ANNOTATION(polished.polished_contigs)
}
