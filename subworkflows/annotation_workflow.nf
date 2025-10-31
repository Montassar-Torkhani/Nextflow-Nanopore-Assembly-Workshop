nextflow.enable.dsl = 2

include { prokka } from '../modules/annotation/prokka.nf'

workflow ANNOTATION {
    take:
        assembly

    main:
        annotation = prokka(assembly)

    emit:
        annotation_files = annotation.annotation_files
        gff = annotation.gff
        genbank = annotation.genbank
}
