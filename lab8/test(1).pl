#!/usr/bin/perl
use strict;
use warnings;
use Time::HiRes qw(usleep);

# Register Addresses 
my $ADDR_REG  = "0x2001208";  # PIPLINE_ADDR_REG_REG
my $FLAG_REG = "0x2001204";  # PIPLINE_STATUS_REG
my $CMD_REG   = "0x2001200";  # PIPLINE_CMD_REG_REG


my $WRITE_FLAG = 0x0;          
my $POLL_DELAY = 100;         
my $WORD_SIZE = 4;          


sub regwrite {
    my ($addr, $value) = @_;
    my $cmd = sprintf("regwrite %s 0x%08x", $addr, $value);
    my $result = `$cmd`;
    # print "CMD: $cmd\nRESULT: $result";
}

sub regread {
    my ($addr) = @_;
    my $cmd = sprintf("regread %s", $addr);
    my @out = `$cmd`;
    return "0x00000000" unless @out;  #error
    
    my $result = $out[0];
    if ($result =~ m/Reg (0x[0-9a-f]+) \((\d+)\):\s+(0x[0-9a-f]+) \((\d+)\)/) {
        return $3; 
    }
    return "0x00000000"; 
}


die "Usage: $0 <instruction_file>\n" unless @ARGV;
my $filename = $ARGV[0];

open(my $fh, '<', $filename) or die "Can't open $filename: $!";

my $current_addr = 0;
while (my $line = <$fh>) {
    chomp $line;
    next if $line =~ /^\s*(#|$)/;  
    
    # Parse instruction (support both "0x12345678" and "12345678" formats)
    my $instruction = $line;
    $instruction = "0x$instruction" unless $line =~ /^0x/i;
    $instruction = hex($instruction);
    
    # Write address register
    regwrite($ADDR_REG, $current_addr);
    
    # Write data register
    regwrite($WDATA_REG, $instruction);
    
    # Trigger write operation
    regwrite($CMD_REG, $WRITE_FLAG);
    
    # Poll until operation completes
    while (1) {
        my $status = hex(regread($FLAG_REG_REG));
        last unless ($status & 0x1);  # Exit when start bit cleared
        usleep($POLL_DELAY);
    }
    
    $current_addr += $WORD_SIZE;  # Increment address
}

close($fh);
print "Loaded ".($current_addr/$WORD_SIZE)." instructions\n";