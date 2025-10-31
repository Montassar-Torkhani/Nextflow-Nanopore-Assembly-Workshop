process fastqc {
    tag "FastQC"
    publishDir "${params.outdir}/qc/fastqc", mode: 'copy'

    input:
    path reads

    output:
    path "*.html", emit: fastqc_html
    path "*.zip",  emit: fastqc_zip

    script:
    """
    fastqc ${reads} -o ./ --threads ${task.cpus}
    """
}
