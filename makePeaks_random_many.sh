chr_name="chr10"
echo "starting with parameters: ${chr_name}"

for N in "10k"
do
	mkdir ${N}/${chr_name}
	for histone in "E003-H3K4me1" "E003-H3K4me3" "E003-H3K9me3" "E003-H3K27me3" "E003-H3K36me3"
	do
		echo "N=${N}, histone=${histone}:"
		bedtools multicov -bams ${histone}_s.bam -bed ${N}/plus_${chr_name}_random_many.bed > ${N}/${chr_name}/plus_${chr_name}_${histone}_random_many.peaks
		echo "1 Done"
		echo $'\a'
	done
done