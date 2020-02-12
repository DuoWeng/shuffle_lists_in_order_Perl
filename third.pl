#!/usr/bin/perl
use strict;
use warnings;
sub myshuffle
{ 
	my ($one_ref, $two_ref, $three_ref,$couter) = @_;
	# If all characters of str1 and str2 have been included in output string
	# print the output string 
	my @array1 = @{$one_ref};
	my @array2 = @{$two_ref};
	my @outcome = @{$three_ref};
	if (scalar @array1 == 0 && scalar @array2 == 0) 
	  {print ("@outcome\n");}
	# If some characters of str1 are not included, then concatenate 
        # the first character from the remaining characters and recur for rest 
	if (scalar @array1 != 0) 
	{ 	
		$outcome[$couter] = $array1[0];
		my @tempt = @array1;
		shift(@tempt);
		myshuffle (\@tempt, \@array2, \@outcome, $couter+1); 
	} 

	# If some characters of str2 are not included, then concatenate 
        #the first character from the remaining characters and recur for rest
	if (scalar @array2 != 0) 
	{ 
		$outcome[$couter] = $array2[0];
		my @tempt = @array2;
		shift(@tempt);
		myshuffle(\@array1, \@tempt, \@outcome, $couter+1); 
	} 
} 
	
print "Please input the first list:\n";
my @array1 = split(/\s+/,<STDIN>);
print "Please input the second list:\n";
my @array2 = split(/\s+/,<STDIN>);
my @outcome = ();
myshuffle (\@array1, \@array2, \@outcome,0);
