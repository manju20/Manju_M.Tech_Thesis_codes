# This program takes two input files as input, (one is control file "zma_mature_700_701" and another one is treatment file "zma_mature_714", in case of my project) compares #them and gives common miRNAs between them and their respective count in each file.  

with open('zma_mature_700_701', 'r') as file1:
   with open('zma_mature_714', 'r') as file2:
        same = set(file1).intersection(file2)

same.discard('\n')
same.discard('\n')
wordcount= {}

with open('some_output_file3.txt', 'w') as file_out:
    for line in same:
        file_out.write(line)

wordcount={}
file_698=open("zma_mature_700_701","r+")
file_709=open("zma_mature_714","r+")
file_out=open("some_output_file3.txt","r+")

for line1 in file_out.read().split():
	wordcount[line1] = 0
	for line2 in file_698.read().split():	
		if (line1 == line2):
			wordcount[line1] += 1
	file_698.seek(0)



file_out.seek(0)
wordcount1={}
for line1 in file_out.read().split():
	wordcount1[line1] = 0
	for line2 in file_709.read().split():	
		if (line1 == line2):
			wordcount1[line1] += 1
	file_709.seek(0)

with open('common_zma_mature_700_701_714.txt', 'w') as file_comm:
	file_comm.write("miRNA"+"\t"+"SRR_700_701 count"+"\t"+"SRR_714 count"+"\n")
	

	for k1,v1 in wordcount.items():	
		a=wordcount[k1]
		b=wordcount1[k1]
		file_comm.write(k1 + "\t" + str(a)+"\t"+str(b)+"\n")


