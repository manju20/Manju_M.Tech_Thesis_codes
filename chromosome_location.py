# This program takes two files as input files one containing IDs of reads which are retrieved by RNAfold software (rnafold_id_new_705.txt) and another one containing chromosome #location of all reads (chrl_705.txt), compares them and gives chromosome location for our specific reads(RNAfold reads).


new =open("/home/ircb02/Desktop/chromosome location/chromosome_location_new_705","w")
fh=open("/home/ircb02/Desktop/chromosome location/rnafold_id_new_705.txt","r+")
target=open("/home/ircb02/Desktop/chromosome location/chrl_705.txt","r+")

for line in fh.read().split():		
	for line1 in target:
		id=line1
		if line in line1:
			print id
			new.write(id)
			break
	target.seek(0)
		
