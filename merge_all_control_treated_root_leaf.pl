# This program is used for merging all control and treatment files.


opendir(DIR, "/home/Pritish/Desktop/novel target_SRRID/") or die "Could not open dirname\n";
open(OH, '>>' ,"/home/Pritish/Desktop/OUTPUT_MERGE1.txt");
while ($filename = readdir(DIR)) 
{
 	 if($filename eq'.' or $filename eq '..')
	 { 	
		next;
	 }		
	 open(FH,'<',"/home/Pritish/Desktop/novel target_SRRID/$filename");
	 while(<FH>)
	 {
		
		print OH $_;
		
	 }
	 close(FH);
}
close(OH);
closedir(DIR);
