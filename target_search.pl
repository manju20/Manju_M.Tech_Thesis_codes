# This program is used for retrieving target information, responsible for phosphate deficiency.

open(OH, '<' ,"/home/ircb02/Desktop/target folder/output_manju.txt");

open(OF, '>' ,"/home/ircb02/Desktop/target folder/final_target_new.txt");
close(OF);
while ($substr = <OH>) 
{
 	 chomp($substr);	
	 open(FH,'<',"/home/ircb02/Desktop/target folder/target_input_new.txt");
	 while($str = <FH>)
	 {
		
		
			 			
			@words = split /	/, $str;
			
                        
			if($words[1] eq $substr)			
			{
								
				open(OF, '>>' ,"/home/ircb02/Desktop/target folder/final_target_new.txt");
				print OF  $str;
			}
			@words = ();	
			
			
	
		
	 }
	 close(FH);
}
close(OH);
closedir(DIR);
