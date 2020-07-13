chr_name="chr10"
echo "starting with parameters: ${chr_name}"

for N in "5k"
do
	mkdir ${N}
	mkdir ${N}/${chr_name}
	for histone in "E003-H3K4me1" "E003-H3K4me3" "E003-H3K9me3" "E003-H3K27me3" "E003-H3K36me3"
	do
		echo "N=${N}, histone=${histone}:"
		bedtools multicov -bams ${histone}_s.bam -bed ${N}/plus_${chr_name}.bed > ${N}/${chr_name}/plus_${chr_name}_${histone}.peaks
		echo "0 Done"
		bedtools multicov -bams ${histone}_s.bam -bed ${N}/plus_${chr_name}_random.bed > ${N}/${chr_name}/plus_${chr_name}_${histone}_random.peaks
		echo "1 Done"
		# echo $'\a'
	done
done