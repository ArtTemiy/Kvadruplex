chr_name="chr10"
echo "starting with parameters: ${chr_name}"
for N in "10k"
do
	for histone in "E003-H3K4me1" "E003-H3K4me3" "E003-H3K9me3" "E003-H3K27me3" "E003-H3K36me3"
	do
		echo "N=${N}, histone=${histone}:"
		bedtools multicov -bams ${histone}_s.bam -bed ${N}/plus_${chr_name}_random.bed > ${N}/plus_${chr_name}_${histone}_random.peaks
		echo "0 Done"
	done
done

# samtools sort E003-H3K27me3.bam -o E003-H3K27me3_s.bam
# echo "ok"
# samtools sort E003-H3K36me3.bam -o E003-H3K36me3_s.bam
# echo "ok"
# samtools sort E003-H3K4me1.bam -o E003-H3K4me1_s.bam
# echo "ok"
# samtools sort E003-H3K4me3.bam -o E003-H3K4me3_s.bam
# echo "ok"
# samtools sort E003-H3K9me3.bam -o E003-H3K9me3_s.bam
# echo "ok"
# echo "---"

# samtools index E003-H3K27me3_s.bam
# echo "ok"
# samtools index E003-H3K36me3_s.bam
# echo "ok"
# samtools index E003-H3K4me1_s.bam
# echo "ok"
# samtools index E003-H3K4me3_s.bam
# echo "ok"
# samtools index E003-H3K9me3_s.bam
# echo "ok"