process flye {
    tag "Flye assembly"
    publishDir "${params.outdir}/assembly", mode: 'copy'

    input:
    path reads

    output:
    path "assembly.fasta", emit: contigs

    script:
    """
    flye --nano-raw ${reads} --out-dir ./flye_out --threads ${task.cpus}
    cp flye_out/assembly.fasta ./assembly.fasta
    """
}
