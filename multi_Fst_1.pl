#!/perl-w
#@SQ	SN:scaffold_950	LN:5583
#JAPONICA vs. OXYSEPALA
##length
#contigs	loc	ref	cb.ab1	cb.ab11	cb.ab3	cb.ab8	cl..an4	cl.yal1	cl.yal2	cl.yal3	cp.ap11	cp.ap13	cp.ap14	cp.ap9	cp.ycp1	cp.ycp2	cx.ac15	cx.ac33	cx.ycc1	hp.yzp1	jb.ab13	jb.ab19	jb.ab21	jb.ab28	jl.ada	jl.adb	jl.aja	jl.ajb	jl.alb	jp.af2	jp.ap31	jp.ap34	jp.yjp1	jp.yjp2	jx.ac53	jx.ac57

@group=glob("*.new.group");
$m=0;
for($g1=0;$g1<@group-1;$g1++){
	for($g2=$g1+1;$g2<@group;$g2++){

		$v[$m]=$group[$g1]."\t".$group[$g2];
		$m++;
	}
}

for($i=0;$i<$m;$i=$j+1){$commond=();
$j=$i+5;$n=$i;
  while($n<=$j){
  	if($v[$n]){@d=split/\t/,$v[$n];
  $commond=$commond."perl Fst_gene_hudson1992.pl $d[0] $d[1] & ";}
$n++;
  }
    chop($commond);
  chop($commond);
  print "$commond\n";
 system($commond);
}











