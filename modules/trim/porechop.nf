process porechop {
    tag "Porechop trimming"
    publishDir "${params.outdir}/trim/porechop", mode: 'copy'

    input:
    path reads

    output:
    path "trimmed.fastq", emit: trimmed_reads

    script:
    """
    porechop -i ${reads} -o trimmed.fastq --threads ${task.cpus}
    """
}
