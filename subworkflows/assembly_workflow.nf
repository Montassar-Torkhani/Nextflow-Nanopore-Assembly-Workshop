nextflow.enable.dsl = 2

include { flye } from '../modules/assembly/flye.nf'

workflow ASSEMBLY {
    take:
        reads

    main:
        assembly = flye(reads)

    emit:
        contigs = assembly.contigs
}
