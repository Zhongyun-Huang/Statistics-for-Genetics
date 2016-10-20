#!/perl-w
open(R,"region_snp.txt");
while(<R>){
chomp;
if(/contig/  ){ s/_species\d+/_species/ge;
	              s/_group\d+//ge;
                s/-s\w+//ge;
                @a=split;
                for($i=3;$i<@a;$i++){
                   $g{$a[$i]}=1;
                	$h{$i}=$a[$i];
                	}
                }
 
}
close(R);
foreach(sort keys %g){
	$file=$_.".group";$name=$_;
	open(W,">$file");
	open(R,"filter_merge_unmap_group.txt");
	while(<R>){
		chomp;
		@a=split;
		print W "$a[0]\t$a[1]\t$a[2]";
		for($i=3;$i<@a;$i++){
               if($h{$i} eq $name){print W "\t$a[$i]"}    
                	}
                	print W "\n";
		
		}
	close(R);close(W);
	}