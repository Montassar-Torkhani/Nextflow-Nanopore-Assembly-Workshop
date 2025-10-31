process filtlong {
    tag "Filtlong filtering"
    publishDir "${params.outdir}/trim/filtlong", mode: 'copy'

    input:
    path reads

    output:
    path "filtered.fastq", emit: filtered_reads

    script:
    """
    filtlong --min_length 1000 --keep_percent 90 ${reads} > filtered.fastq
    """
}

