#!/usr/bin/perl -w

$file1 = "demo/omim/morbidmap.txt";
$file2 = "demo/omim/omim_disease_gene.txt";
open F,$file1 or die $!;
open O,">".$file2 or die $!;
while(<F>){
	chomp;
	if(/^#/){
		next;
	}
	@a = split "\t";
	@gene = split ",",$a[1];
	@disease = split ";",$a[0];
	foreach $gene (@gene){
		foreach $disease (@disease){
			$gene =~ s/\s//g;
			$disease =~ s/^\s//g;
			if($gene =~ /\S/ && $disease =~ /(\d\d\d\d\d\d)/){
				$omim_id = $1;
				print O $omim_id."|".$disease."\t".$gene."\n";
			}
		}
	}
}
close F;

