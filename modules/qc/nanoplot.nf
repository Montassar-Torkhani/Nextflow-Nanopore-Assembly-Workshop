process nanoplot {
    tag "NanoPlot QC"
    publishDir "${params.outdir}/qc/nanoplot", mode: 'copy'

    input:
    path reads

    output:
    path "*.html", emit: nanoplot_html
    // path "*.zip",  emit: nanoplot_zip

    script:
    """
    NanoPlot --fastq ${reads} \
             --outdir ./ \
             --loglength --N50 \
             --plots hex dot kde \
             --threads ${task.cpus}
    """
}
