#!/perl -w
#!/perl

open(W,">group_sample_new.txt");
open(R,"region_snp.txt")||die $!; #by ZH instead of R, 'region_snp_nonheter.txt"#
$n=0;
while (<R>) {
	if ($n==0) {$n++;
		chomp;
		@a=split;
		for (my $x = 3; $x < @a; $x++) {
			if ($a[$x]=~/(.*)_\w+/) {
				$ha{$1}++;
			}
		}
		foreach (sort keys %ha) {
			print W "$_.new\t$ha{$_}\n";
			print W "$_.new.nonsny\t$ha{$_}\n";
			print W "$_.new.silent\t$ha{$_}\n";
			print W "$_.new.sny\t$ha{$_}\n";
		}

	}
}
close(R);
close(W);