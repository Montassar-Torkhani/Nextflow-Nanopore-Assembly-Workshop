nextflow.enable.dsl = 2

include { porechop } from '../modules/trim/porechop.nf'
include { filtlong } from '../modules/trim/filtlong.nf'

workflow TRIM_FILTER {
    take:
        reads

    main:
        trimmed = porechop(reads)
        filtered = filtlong(trimmed.trimmed_reads)

    emit:
        filtered_reads = filtered.filtered_reads
}
