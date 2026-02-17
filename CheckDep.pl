#!/usr/bin/perl
use strict;
use warnings;
use File::Slurp;

my $config_file = 'package_file.txt';
my $package_file = read_file($config_file, chomp => 1);

if (!$package_file) {
    die "Package file not specified in $config_file\n";
}

sub install_missing_dependencies {
    my $install_deps_cmd = 'sudo apt-get install -f -y';
    my $ret = system($install_deps_cmd);

    if ($ret != 0) {
        die "Failed to install missing dependencies.\n";
    }
}

my $install_cmd = "sudo dpkg -i $package_file 2>&1";

open(my $cmd_output, '-|', $install_cmd) or die "Failed to execute: $install_cmd\n";

my $missing_dependencies = 0;

while (my $line = <$cmd_output>) {
    if ($line =~ /dependency problems - leaving unconfigured/ || $line =~ /missing dependency/) {
        $missing_dependencies = 1;
    }

    print $line;
}

close($cmd_output);

if ($missing_dependencies) {
    print "Missing dependencies detected. Installing missing dependencies...\n";
    install_missing_dependencies();

    open($cmd_output, '-|', $install_cmd) or die "Failed to execute: $install_cmd\n";

    while (my $line = <$cmd_output>) {
        print $line;
    }

    close($cmd_output);
}

