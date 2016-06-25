# This program is used for retrieving chromosome locations, minimum folding energies of Tasi RNA in case of my project.

open(OH, '<' ,"/home/ircb02/Desktop/m.tech_manju/folding_with location_NEW/chromosome_location_of_novel_new/tasi_srr_id.txt");
while(<OH>)
{
	$str = $_;
	chomp($str);
	open(OF, '<' ,"/home/ircb02/Desktop/m.tech_manju/folding_with location_NEW/chromosome_location_of_novel_new/output_merged_file_containing_chrl_mfe.txt");
	LAST: while(<OF>)
	{
		@words = split /\t+/ ,$_;
		$word = $words[0];
		if( $word  eq $str )
		{
			 print "$_";
			 last LAST;	
		}
	}
}
