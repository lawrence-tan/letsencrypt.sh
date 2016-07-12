#!/usr/bin/perl

my $i    = 0;
my $info = "Arguments:\n";
my ( $action, $name, $challenge, $auth ) = @ARGV;
foreach my $arg (@ARGV) {
    $i++;
    $info .= "\t$i: $arg\n";
}
$info .= "\n\n";
print $info;

if ( $action eq "deploy_challenge" ) {
    my $shortname = $name;
    $shortname =~ s|\S+\.\S+$||;
    if ( $shortname ne "" )
    {
        $shortname = "." . $shortname;
    }

    print "Create a DNS TXT record named: _acme-challenge.$name\n";
    print "with a low/zero TTL and this values:\n";
    print "  _acme-challenge.$name. 60 TXT \"$auth\"\n";
    print "or\n";
    print "  _acme-challenge$shortname 60 TXT \"$auth\"\n";
    print "\n\n";
    print "Hit enter when completed...\n";
    my $dummy = <STDIN>;
    print "\nok, proceeding.\n";
}
elsif ( $action eq "clean_challenge" ) {
    print "Not doing anything to clean challenges.\n";
    exit;
}
elsif ( $action eq "deploy_cert" ) {
    print "Install the above mentioned certs into your server as needed.\n";
    exit;
}
