echo "##gff-version 3" > genes.gff

for i in {1..20}
do
    gene_start=$((i*10000))
    gene_end=$((gene_start+2999))

    echo -e "XMC_0$i\tExample\tgene\t$gene_start\t$gene_end\t.\t+\t.\tID=gene$i;Name=GENE$i" >> genes.gff

    echo -e "XMC_0$i\tExample\tmRNA\t$gene_start\t$gene_end\t.\t+\t.\tID=tx$i;Parent=gene$i" >> genes.gff

    exon1_start=$gene_start
    exon1_end=$((gene_start+499))

    exon2_start=$((gene_start+1000))
    exon2_end=$((gene_start+1499))

    exon3_start=$((gene_start+2500))
    exon3_end=$gene_end

    echo -e "XMC_0$i\tExample\texon\t$exon1_start\t$exon1_end\t.\t+\t.\tParent=tx$i" >> genes.gff
    echo -e "XMC_0$i\tExample\texon\t$exon2_start\t$exon2_end\t.\t+\t.\tParent=tx$i" >> genes.gff
    echo -e "XMC_0$i\tExample\texon\t$exon3_start\t$exon3_end\t.\t+\t.\tParent=tx$i" >> genes.gff

    echo -e "XMC_0$i\tExample\tCDS\t$exon1_start\t$exon1_end\t.\t+\t0\tParent=tx$i" >> genes.gff
    echo -e "XMC_0$i\tExample\tCDS\t$exon2_start\t$exon2_end\t.\t+\t1\tParent=tx$i" >> genes.gff
    echo -e "XMC_0$i\tExample\tCDS\t$exon3_start\t$exon3_end\t.\t+\t2\tParent=tx$i" >> genes.gff
done
