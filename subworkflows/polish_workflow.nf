nextflow.enable.dsl = 2

include { racon } from '../modules/polish/racon.nf'

workflow POLISH {
    take:
        contigs
        reads

    main:
        final_polished = racon(contigs, reads)

    emit:
        polished_contigs = final_polished.polished_contigs
}

