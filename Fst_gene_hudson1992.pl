#!/perl-w


open(R,"header.txt");
while(<R>){
	chomp;
	if(/SN:(\w+)\s+LN:(\d+)/){
		$ln{$1}=$2;
		$scaffold{$1}=1;}}
			close(R);
######

$output=$ARGV[0]."-".$ARGV[1].".hudson1992.fst";
		open(W,">$output");
	
open(R,"$ARGV[0]");

while(<R>){if(/contigs/){next;}
	
	chomp;
	@a=split;


	$info{$a[0]."\t".$a[1]}=$_;
		}
close(R);

######split loc
foreach(sort keys %scaffold){%Fst={};$ht=0;$hs1=0;$hs2=0;
    	%ID={};
	%start={};
	%en={};
	%s={};%group1={};%group2={};
	$in=1;$scaff=$_;
	open(R1,"new_cover_region.txt");
	
	while(<R1>){
		chomp;
		
	
		@gff=split;
	if($gff[0] ne $scaff){next;}
	$ID_name{$in}=$gff[1];
	$gene_name{$in}=$gff[-1];
	$ID{$in}=$gff[0];
	$start{$in}=$gff[2];
	$en{$in}=$gff[3];
	$lengt{$in}=$gff[3]-$gff[2]+1;
	$in++	
		
	}
	close(R1);
	open(R2,"$ARGV[0]");
	while(<R2>){
	if(/contigs/){next;}
	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	$group1{$snp[1]}=$_;
		
   }
   close(R2);
open(R2,"$ARGV[1]");
	while(<R2>){
	if(/contigs/){next;}
	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	$group2{$snp[1]}=$_;
		
   }
   close(R2);
   $m=$in-1;
   $n=1;
   foreach(sort {$a<=>$b} keys %group1){
   	if($_>$en{$m}){last;}
   	
   	if($_<$start{$n}){next;}
   	while($_>$en{$n}){
  $ht=0;$hs1=0;$hs2=0;
   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
 
 		if($info{$scaff."\t".$_}){
 			#$info=$info{$scaff."\t".$_};
 			#if($info=~/(.*\w)/){$info=$1}
 			
 			
 			# @b=split/\t/,$info;
 			if($group1{$_}=~/(.*\w)/){$group1{$_}=$1}
 			if($group2{$_}=~/(.*\w)/){$group2{$_}=$1}
 			
 		
 			@g1=split/\t/,$group1{$_};
 		    @g2=split/\t/,$group2{$_};
 			  $hs_count1=0;$hs_count2=0;$ht_count=0;
 				for($t=3;$t<@g1;$t++){
	                for($e=3;$e<@g2;$e++){
                    if(($g1[$t] ne "N") and ($g2[$e] ne "N") and ($g1[$t] ne $g2[$e])){$ht++;}
                 $ht_count++;
                      }}

         for($o=3;$o<@g1;$o++){
	                for($u=$o+1;$u<@g1;$u++){
                    if(($g1[$o] ne "N" ) and ($g1[$u] ne "N") and ($g1[$o] ne $g1[$u])){$hs1++;}
                 $hs_count1++;
                      }}
 			   for($z=3;$z<@g2;$z++){
	                for($r=$z+1;$r<@g2;$r++){
                     if(($g2[$z] ne "N") and ($g2[$r] ne "N") and ($g2[$r] ne $g2[$z])){$hs2++;}
                 $hs_count2++;
                      }}	
 	
 		if($ht==0 |$hs1==0 or  $hs2==0 or $ht_count==0 or $hs_count1==0 or $hs_count2==0){$Fst{$n}="NA";}
 	 	    elsif($ht ne "0"){$Fst{$n}=1-($hs1/$hs_count1+$hs2/$hs_count2)/(2*($ht/$ht_count));
			}
 		
 		}
 		   #######################
 		   
 		    }
 

 		}
 			
 	
 		foreach(sort {$a<=>$b} keys %Fst){
 			if(!($Fst{$_})){next;}
 		 print W "$scaff\t$ID_name{$_}\t$Fst{$_}\t$gene_name{$_}\t$start{$_}\t$en{$_}\n";  
   	}
 	
 		}
 		
 	
 		
  ##################################
  
   		
   		
  ################################## 	