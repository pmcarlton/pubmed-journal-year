#!/usr/bin/perl

#pubmed-journal-year, to show the history of a search term across all journals.

#02013.01.11 19:10 Peter M. Carlton (pcarlton@icems.kyoto-u.ac.jp)
#Licensed under CC attribution-sharealike http://creativecommons.org/licenses/by-sa/3.0/

#Attribution:
#based on the code from:
#Sample Applications of the E-utilities, by Eric Sayers, PhD.
#https://www.ncbi.nlm.nih.gov/books/NBK25498/
#NCBI

use strict;
use LWP::Simple;

my $db = 'pubmed';
my $query = shift;

#assemble the esearch URL
my $base = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
my $url = $base . "esearch.fcgi?db=$db&term=$query&usehistory=y";
#print $url;

#post the esearch URL
my $output = get($url);

#parse WebEnv and QueryKey
my $web = $1 if ($output =~ /<WebEnv>(\S+)<\/WebEnv>/);
my $key = $1 if ($output =~ /<QueryKey>(\d+)<\/QueryKey>/);
my $count = $1 if ($output =~ /<Count>(\d+)<\/Count>/);
print "$count records\n";

#print $output;
### include this code for ESearch-ESummary
#assemble the esummary URL
#$url = $base . "esummary.fcgi?db=$db&query_key=$key&WebEnv=$web";

#post the esummary URL
#$docsums = get($url);
#print "$docsums";

### include this code for ESearch-EFetch
#assemble the efetch URL
open OUT,">/tmp/query-entrez.txt";
my $retmax=500;
for (my $retstart=0; $retstart <=$count; $retstart += $retmax) {
$url = $base . "efetch.fcgi?db=$db&query_key=$key&WebEnv=$web";
$url .= "&rettype=medline&retmode=text&retstart=$retstart&retmax=$retmax";
#$url .= "&rettype=medline&retmode=text&retmax=500";
#$url .= "&rettype=abstract&retmode=text";
#post the efetch URL
my $data = get($url);
#print $url,"\n";
print OUT "$data";
}
close OUT;


my $fname="/tmp/query-entrez.txt";
my $jrt; my $yr; my $minyr=9999; my $maxyr=-9999;
my $maxpb=0; my $tmpy; my %db;
my $padlen=20;
my $minpubfordot=1;my $firsttier=0.2;my $secondtier=0.5; my $minsum=20;

open IN,$fname;
while (my $line=(<IN>)){
  if($line =~ /^DP/) {
    my @da=split(" ",$line);
    $yr=$da[2];
    $minyr=$yr if $yr < $minyr;
    $maxyr=$yr if $yr > $maxyr;
  }
} close IN;

open IN,$fname;
while (my $line=(<IN>)){
  if($line =~ /^DP/) {
    my @da=split(" ",$line);
    $yr=$da[2];
  }
  if($line =~ /^TA/) {
    my @ta=split(" ",$line);
    splice(@ta,0,2);
    $jrt = join("_",@ta);
${db{$jrt}}[$yr-$minyr]++; # this is the magic line: increments year-indexed arrays within a journal-title-indexed hash!
$tmpy=${db{$jrt}}[$yr-$minyr];
if($tmpy > $maxpb) {$maxpb=$tmpy;}
}
}
close IN;

$secondtier *= $maxpb;$secondtier=int($secondtier+1);
$firsttier *= $maxpb;$firsttier=int($firsttier+1);

if($firsttier == $minpubfordot) {$firsttier+=1;}
if($secondtier == $firsttier) {$secondtier+=1;}

#Printing out.
my @allentries;
foreach $key (sort keys %db) {
my $theentry;
my $keyname=pack("A$padlen",$key);
$keyname .= "|";
  my $sum=0;
  foreach my $ind(0..($maxyr-$minyr)) {
    my $tyr=${db{$key}}[$ind];
    $sum+=$tyr;
    if ($tyr >= ($secondtier)) {$keyname .= "O";}
    elsif ($tyr >= ($firsttier)) {$keyname .= "o";}
    elsif ($tyr >= ($minpubfordot)) {$keyname .= ".";}
    else {$keyname .= " ";}
  }
  $theentry.=$sum."\t".$keyname."|\n";
  push @allentries,$theentry;
}
@allentries = sort {$a <=> $b} @allentries;
print join("",@allentries);
my $secondtiermin1 = $secondtier-1;
my $firsttiermin1 = $firsttier-1;
print "# Showing from $minyr to $maxyr; ";
print ". for $minpubfordot to $firsttiermin1; ";
print "o for $firsttier to $secondtiermin1; ";
print "O for $secondtier to $maxpb\n";
