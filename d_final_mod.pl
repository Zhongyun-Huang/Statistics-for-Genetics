#!/perl-w
open(L,"group_p.txt");
while(<L>){
	chomp;
	#Aromatic	LOC_Os06g11400.1	166.666666666667	672
  # 0         1                    2             3
  @l=split;
  $syn{$l[0]."\t".$l[1]}=$l[2];
  $non_syn{$l[0]."\t".$l[1]}=$l[3]-$l[2];
  
	}
	
open(R,"group_sample_new.txt");
while(<R>){
	chomp;
	@a=split;
	$sample{$a[0]}=$a[1];

	}
	
open(R,"merge.fra.pi");
while(<R>){
chomp;
if(/contig/){
  @name=split/\t/,$_;
  #print @name; #ZH test
  #print "\n";

  }
else{
	@pi=split/\t/,$_;
	for($i=5;$i<@pi;$i++){
		if(!($name[$i])){next;}
		if($name[$i]=~/(.*)\.\w+\.\w+/){$name=$1};
			if($name[$i]=~/(.*)\.new/){$g_name=$1};
		$pi{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=$pi[$i];
		$loc{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=1;
		$loc2{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]}=1;
        $length{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=$pi[1];
		
		   if($name[$i]=~/\.sny/){
   		    	   		$length{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=$syn{$g_name."\t".$pi[2]};
   		    	
   		    	   	}
   		    	   	if($name[$i]=~/\.nonsny/){
   		    	   		$length{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=$non_syn{$g_name."\t".$pi[2]};
   		    	   		}
   		    	   	if($name[$i]=~/\.silent/){
   		    	   		$length{$pi[0]."\t".$pi[1]."\t".$pi[2]."\t".$pi[3]."\t".$pi[4]."\t".$name}=$pi[1]-$non_syn{$g_name."\t".$pi[2]};
   		    	   		}
	}}}
		close(R);
 open(R,"merge_count.txt");
while(<R>){
chomp;
if(/contig/){
  @name=split/\t/,$_;
  

  }
else{
	@theta=split/\t/,$_;
	for($i=5;$i<@theta;$i++){
		if(!($name[$i])){next;}
		if($name[$i]=~/(.*)/){$name=$1};
		if($name[$i]=~/(.*)\.new/){$g_name=$1};
		$theta{$theta[0]."\t".$theta[1]."\t".$theta[2]."\t".$theta[3]."\t".$theta[4]."\t".$name}=$theta[$i];
 
		
		}
			
			        }}
close(R);
			      

foreach(sort keys %loc){

  
	$loc=$_;
	@g=split/\t/,$loc;
	$g=$g[-1];
	#print $g; #ZH test
	#print $sample; #ZH test
	
   $a1=0;$a2=0;
   #print $sample{$g}; #ZH test
   #print $g; #ZH test
   #print "\n"; #ZH test
for($t=1;$t<$sample{$g};$t++){
$a1=$a1+1/$t;}
for($t=1;$t<$sample{$g};$t++){
$a2=$a2+1/($t*$t);}
$sample=$sample{$g};
print $sample{$g};$sample{$a[0]};
}



#####################
# $b1=($sample+1)/(3*($sample-1));
# $b2=2*($sample*$sample+$sample+3)/(9 * $sample*($sample-1)); #illegal division by zero at d_final.pl
# $c1=$b1-1/$a1;
# $c2=$b2-($sample+2)/($a1*$sample)+$a2/($a1*$a1);
# $e1=$c1/$a1;
# $e2=$c2/($a1*$a1+$a2);

# if($theta{$_} eq "NA" ){$d{$_}="NA"}


# else{$s=$theta{$_};
# $check=$e1*$s+$e2*$s*($s-1); 
	# if($check==0){$d{$_}="NA2";next;}

# $d=($pi{$_}*$length{$_}-$s/$a1)/sqrt($e1*$s+$e2*$s*($s-1));


# $d{$_}=$d;	
# }}

########head#################
# foreach(sort keys %loc2){
	# $loc=$_;
	# @g=split/\t/,$loc;
	# $l=$g[2];
	
	# print "contigs\ttype\tgene\tstart\tend";
	# foreach(sort keys %d){
		# $loc2=$_;
	# @g=split/\t/,$loc2;
	# if($g[2] eq "$l"){
	# print "\t$g[-1]";
	# }			
	# } 
# last;}
	# print "\n";
#######################################
# foreach(sort keys %loc2){
	# $loc=$_;
	# @g=split/\t/,$loc;
	# $l=$g[2];
	
	# print "$g[0]\t$g[1]\t$g[2]\t$g[3]\t$g[4]";
	# foreach(sort keys %d){
		# $loc2=$_;
	# @g=split/\t/,$loc2;
	
		# if($g[2] eq $l){
		# print "\t$d{$loc2}";
			
			# }
		# }
	# print "\n";
	
	
	
	# }


	
	
	