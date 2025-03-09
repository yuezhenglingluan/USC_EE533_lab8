#!/usr/bin/perl
use strict;
use warnings;

my $HI_REG = "0x200020c"; # PIPLINE_RDATA_REG_HI
my $LO_REG = "0x2000210"; # PIPLINE_RDATA_REG_LO

sub regread {
    my ($addr) = @_;
    my $cmd = sprintf("regread %s", $addr);
    my @out = `$cmd`;
    return "0x00000000" unless @out;
    
    my $result = $out[0];
    if ($result =~ m/Reg (0x[0-9a-f]+) \((\d+)\):\s+(0x[0-9a-f]+) \((\d+)\)/) {
        return $3;
    }
    return "0x00000000";
}

my $hi_value = regread($HI_REG);
my $lo_value = regread($LO_REG);

print "HI_REG ($HI_REG): $hi_value\n";
print "LO_REG ($LO_REG): $lo_value\n";