# This program takes two input files as input, (one is control file "zma_mature_700_701" and another one is treatment file "zma_mature_714", in case of my project) compares #them and gives unique miRNAs between them and their respective counts in each file.  


file_698=open("zma_mature_700_701","r+")
file_706=open("zma_mature_714","r+")

wordcount = {}
for line1 in file_698.read().split():
	wordcount[line1] = 0

file_698.seek(0)

for line1 in file_698.read().split():	
	if(line1 not in file_706.read().split()):
		wordcount[line1] += 1
	file_706.seek(0)

wordcount1 = {}
for line1 in file_706.read().split():
	wordcount1[line1] = 0	

file_706.seek(0)

for line1 in file_706.read().split():
	if(line1 not in file_698.read().split()):
		wordcount1[line1] += 1
	file_698.seek(0)

with open('diff_zma.txt', 'w') as file_comm:
	file_comm.write("miRNA"+"\t"+"SRR_700_701 count"+"\n")
	
	for k1,v1 in wordcount.items():	
		a=wordcount[k1]
		if(v1!=0):
			file_comm.write(k1 + "\t" + str(a)+"\n")

	file_comm.write("\n"+"mature_miRNA"+"\t"+"treated_4day_root(SRR_714) count"+"\n")
	

	for k1,v1 in wordcount1.items():	
		a=wordcount1[k1]
		if(v1!=0):
			file_comm.write(k1 + "\t" + str(a)+"\n")


