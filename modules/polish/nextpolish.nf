process nextpolish {
    tag "NextPolish final polishing"
    
    // Output folder for NextPolish results
    publishDir "${params.outdir}/polish/nextpolish", mode: 'copy'

    input:
    path contigs
    path reads

    output:
    path "nextpolish_final.fasta", emit: polished_contigs

    script:
    """
    nextpolish run -g ${contigs} -r ${reads} -o nextpolish_final.fasta -p ${task.cpus}
    """
}
