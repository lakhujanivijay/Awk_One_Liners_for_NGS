# Awk_One_Liners

# Give a 2 column, tab separated list of read no. and read length
zcat whatever.fastq.gz | paste - - - - | awk '{print NR " " (length($3))}'


# Count total reads in fastq file
zcat whatever.fastq.gz | wc -l | awk '{print $1/4}' 

# Change extension of multiple files at once.
# In below example, the extension changes from *.scafSeq to *.fa
for f in *.scafSeq; do mv "$f" "$(basename "$f" .scafSeq).fa"; done


# get A T G C counts for all sequences from a multi fasta file
echo -e "seq_id\tA\tU\tG\tC"; while read line; do echo $line | grep ">" | sed 's/>//g'; for i in A U G C;do echo $line | grep -v ">" | grep -o $i | wc -l | grep -v "^0"; done; done < test.fa | paste - - - - -
