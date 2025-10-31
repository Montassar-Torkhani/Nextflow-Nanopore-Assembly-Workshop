process prokka {
    tag "Prokka annotation"
    
    publishDir "${params.outdir}/annotation/prokka", mode: 'copy'

    input:
    path assembly

    output:
    path "prokka_results/*", emit: annotation_files
    path "prokka_results/*.gff", emit: gff
    path "prokka_results/*.gbk", emit: genbank
    path "prokka_results/*.faa", emit: proteins
    path "prokka_results/*.ffn", emit: genes

    script:
    """
    prokka --outdir prokka_results \
           --prefix annotated_genome \
           --cpus ${task.cpus} \
           --force \
           ${assembly}
    """
}
