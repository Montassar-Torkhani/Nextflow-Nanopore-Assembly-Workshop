process pilon {
    tag "Pilon polishing"

    publishDir "${params.outdir}/polish/pilon", mode: 'copy'

    input:
    path contigs
    path illumina_bam

    output:
    path "pilon_polished.fasta", emit: polished_contigs

    script:
    """
    java -Xmx16G -jar ${params.pilon_jar} \
         --genome ${contigs} \
         --frags ${illumina_bam} \
         --output pilon_polished \
         --threads ${task.cpus}
    """
}

