#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

my $sandbox_binary = $ENV{SANDBOX_BINARY} || "$ENV{HOME}/opt/mysql";
#print $sandbox_binary . "\n";
unless ( -d $sandbox_binary)
{
    die "# Directory $sandbox_binary not found\n";
}

my @tarballs = map { basename $_ } grep {-f $_} glob ("$sandbox_binary/*.gz") ;

sub tb_split
{
    my ($tb) = @_;
    if ($tb =~ /([^.]+)\.(\d+)\.(\d+)/)
    {
        return ($1, $2, $3);    
    }
    return ;
}

my %test_tb=();

for my $tb (@tarballs)
{
    #print "$tb\n";
    my ($major, $minor, $rev) = tb_split($tb);    
    next unless $major;
    #next if ($major =~ /^full_/);
    unless ($major =~ /^(?:ps|ma)/ or $major =~ /^[1-9]/)
    {
        next;   
    }

    if ($test_tb{"$major.$minor"})
    {
        if ($test_tb{"$major.$minor"} > $rev)
        {
            next 
        }
    }
    $test_tb{"$major.$minor"} = $rev;
    # print "<$major $minor $rev>\n";
}

#print "\n";
for my $tb (sort  keys %test_tb)
{
    print "$tb.$test_tb{$tb}.tar.gz\n"
}
