process racon {
    tag "Racon polishing"
    publishDir "${params.outdir ?: 'results'}/polish/racon", mode: 'copy'

    input:
    path contigs
    path reads

    output:
    path "racon_polished.fasta", emit: polished_contigs

    script:
    """
    echo " Running Minimap2 alignment..."
    minimap2 -t ${task.cpus} -x map-ont ${contigs} ${reads} > alignments.paf

    echo " Running Racon polishing..."
    racon -t ${task.cpus} ${reads} alignments.paf ${contigs} > racon_polished.fasta

    echo " Racon polishing complete!"
    """
}

