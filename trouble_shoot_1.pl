open(R,"group_sample_new.txt");
while(<R>){
	chomp;
	@a=split;
	$sample{$a[0]}=$a[1];
    print $sample{$a[0]};
	print "\n";
	}

