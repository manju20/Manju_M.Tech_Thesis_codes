# This program is used for retrieving aligned sequences of Tasi RNA in my project.


open(FH , '<', "/home/ircb02/Desktop/m.tech_manju/folding_with location_NEW/chromosome_location_of_novel_new/OUTPUT_tasi_MERGE1.txt");
while(<FH>)
{
	@words = split /	/,$_;
	$seq_id = $words[0];
	$start = $words[4];
	$end = $words[2];
	
  	open(NR , '<', "/home/ircb02/Desktop/m.tech_manju/folding_with location_NEW/chromosome_location_of_novel_new/tasi_chrl_mfe.txt");
	LINE : while($line = <NR>)
	{
		@texts = split /	/,$line;
		
		if( $texts[0] eq $seq_id )
		{
			$substr = substr $texts[4] , $start-1 , $end  ;	
			$len = length($substr);		
			my $x = 18 + int(rand(21 - 18));	
			if($len != $x)
			{
				
				$diff_bet_last_end = (length($texts[4]) - $len);
			        $seq_to_add = $x-$len;
				if($diff_bet_last_end >= $seq_to_add)
				{
					$extra_seq = 	substr $texts[4] , $end+1 ,$seq_to_add  ;
					
				}
				else
				{
					
					$extra_seq = 	substr $texts[4] , 0 ,$seq_to_add ;
				}
				$substr	= $substr.$extra_seq;	
			}	
			print $texts[0]."\t".$substr."\n" ;
			last LINE;
		}
		
	}
	close(NR);
}
close(FH);
