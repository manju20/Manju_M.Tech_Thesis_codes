#This program takes two input files, one containing novel miRNA(novel.txt) and other one containing all BLAST information(OUTPUT_MERGE_blast.txt), compares them and gives #BLAST information for common miRNA as output(novel_matched_srr_blast_new.txt)

open(OH, '<' ,"/home/Pritish/Desktop/program_folder_novel_fetch/novel.txt");

open(OF, '>' ,"/home/Pritish/Desktop/program_folder_novel_fetch/novel_matched_srr_blast_new.txt");
close(OF);
 while ($substr = <OH>) 
{
 	 chomp($substr);	
	 open(FH,'<',"/home/Pritish/Desktop/program_folder_novel_fetch/OUTPUT_MERGE_blast.txt");
	 while($str = <FH>)
	 {
		
		
			 			
			@words = split /	/, $str;
			@word = split /-/, $words[1];
			$word[1] =~ s/\D+\z//;
                        
			if($word[1] eq $substr)			
			{
				open(OF, '>>' ,"/home/Pritish/Desktop/program_folder_novel_fetch/novel_matched_srr_blast_new.txt");
				print OF  $str;
			}
			@words = ();	
			@word = ();
			
	
		
	 }
	 close(FH);
}
close(OH);
closedir(DIR);
