#this program takes two fasta files as input , compares them and gives output files containing common and different sequences between them.


opendir my $dh, conserved_known or die "Could not open '$dir' for reading '$!'\n";
while (my $thing = readdir $dh)
{
                    if ($thing eq '.' or $thing eq '..' or $thing =~ /\~$/)
                    {
                               next;
                    }
  push(@array, $thing);
}
 @array = sort(@array);
 for( $i = 0 ; $i < @array-1 ; $i++)
{
	for($j = $i +1 ; $j<@array; $j++)
	{
        	%hash=();
		open($fh1 ,'<',"/home/ircb02/Desktop/conserved_known/$array[$i]");
 		while (<$fh1>)
 		{
        		$id = $_;
        		$seq = <$fh1>;
        		push(@{ $hash{$seq} }, $id);
 		}
		close($fh1);
	        
		open($fh2 ,'<',"/home/ircb02/Desktop/conserved_known/$array[$j]");
                while (<$fh2>)
                {
                        $id = $_;
                        $seq = <$fh2>;
                        push(@{ $hash{$seq} }, $id);
                }
         	close($fh2);
		
		
		foreach $string (keys %hash)
		{
  			push ( @array1 ,  @{$hash{$string}});
  			$k = @array1;
  			if ( $k > 1)
  			{
        			open($fh3 ,'>>',"/home/ircb02/Desktop/output/same/$array[$i].'_'.$array[$j].text");
				for( $k = 0 ; $k < @array1 ; $k++ )
        			{
        			        print $fh3 $array1[$k].$string;
        			}
 			}
			else
			{
				 open($fh3 ,'>>',"/home/ircb02/Desktop/output/diff/$array[$i].'_'.$array[$j].text");
				 for( $k = 0 ; $k < @array1 ; $k++ )
                                 {
                                        print $fh3 $array1[$k].$string;
                                 }

			}
 			@array1=();
			close($fh3);
		}

		


	}
}                   
