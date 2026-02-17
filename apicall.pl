#!/usr/bin/perl
use strict;
use warnings;

# Prompt user for inputs
print "Enter the HTTP method (GET, POST, PUT, DELETE): ";
chomp(my $method = <STDIN>);

print "Enter the API endpoint (path): ";
chomp(my $path = <STDIN>);

print "Enter the data format (e.g., JSON, form): ";
chomp(my $format = <STDIN>);

print "Enter the authorization token (leave empty if not needed): ";
chomp(my $auth_token = <STDIN>);

my $data = "";
if ($method eq "POST" || $method eq "PUT") {
    print "Enter the data to send with the request: ";
    chomp($data = <STDIN>);
}

# Construct the curl command based on user input
my $curl_command = "curl -X $method '$path'";

if ($format eq "JSON") {
    $curl_command .= " -H 'Content-Type: application/json'";
    $curl_command .= " -d '$data'" if $data;
} elsif ($format eq "form") {
    $curl_command .= " -H 'Content-Type: application/x-www-form-urlencoded'";
    $curl_command .= " -d '$data'" if $data;
} else {
    die "Unsupported format: $format\n";
}

# Add the authorization token header if provided
if ($auth_token) {
    $curl_command .= " -H 'Authorization: Bearer $auth_token'";
}

# Execute the curl command and print the response
print "Executing: $curl_command\n";
my $response = `$curl_command`;

print "Response:\n$response\n";
