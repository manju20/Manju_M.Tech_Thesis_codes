#This program takes two input files, one containing known miRNA(known_mir.txt) and other one containing all BLAST information(OUTPUT_MERGE_blast.txt), compares them and gives #BLAST information for common miRNA as output(known_matched_srr_blast_new.txt)
#during comparision it matches family name like miR66, ignores prefix and suffix (zma-miR66-3p) 


open(OH, '<' ,"/home/Pritish/Desktop/manju_mtech_new/program_folder_novel_fetch/known_mir.txt");

open(OF, '>' ,"/home/Pritish/Desktop/manju_mtech_new/program_folder_novel_fetch/known_matched_srr_blast_new.txt");
close(OF);
 while ($substr = <OH>) 
{
 	 chomp($substr);	
	 open(FH,'<',"/home/Pritish/Desktop/manju_mtech_new/program_folder_novel_fetch/OUTPUT_MERGE_blast.txt");
	 while($str = <FH>)
	 {
		
		
			 			
			@words = split /	/, $str;
			@word = split /-/, $words[1];
			$word[1] =~ s/\D+\z//;
			
                        
			if($word[1] eq $substr)			
			{
				open(OF, '>>' ,"/home/Pritish/Desktop/manju_mtech_new/program_folder_novel_fetch/known_matched_srr_blast_new.txt");
				print OF  $str;
			}
			@words = ();	
			@word = ();
			
	
		
	 }
	 close(FH);
}
close(OH);
closedir(DIR);
