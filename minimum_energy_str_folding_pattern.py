#This program takes RNAfold generated files which have fold extension in their names and then fetch minimum energy, sequences and secondary structure folding pattern for each #file (srr_id).

import os
import operator
import re
i=0
target = open("/home/Pritish/Desktop/new715", 'w');
for filename in os.listdir("/home/Pritish/Desktop/unique_715"):
	if 'fold' in filename:
		fh= open(filename,"r")
		i= i+1	
		y= 0
		nolist= list()
		target.write(">" + filename)
		target.write("\t")
		for line in fh:
			string= line.rstrip("\n")
			y= y+1
			if y==1:
			
                        	target.write(line.rstrip())
				target.write("\t")	
			
			if 3>=y>=2:
				nolist.append(reduce(operator.add, re.findall(r'-?\d+\.*\d*',string)))
			elif(y==4):
				no=re.findall(r'-?\d+\.*\d*',string)
				del no[1]
				nolist.append(reduce(operator.add, no))
		
		nolist= map(float, nolist)			
		
		
		fh.seek(0)
		final=str (min(nolist))
		print(final)
		for line in fh:
			if final in line:
				special1 = '[ '
				special2 = ']'
				special3 = '['
				
    				line = str(line)
    				new_line = str.replace(line,special1,'')
				new_line = str.replace(new_line,special2,'')
				new_line = str.replace(new_line,special3,'')
				
    				target.write(new_line)

                    		print new_line
				break
		
		print (filename)
		
