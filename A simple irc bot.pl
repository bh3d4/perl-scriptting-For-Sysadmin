 #!/usr/bin/perl -w

use IO::Socket;

my $server = $ARGV[1];
my $user = 'simplebot simpleb simpleot plotsim';
my $botnick = $ARGV[0];
my $nickservpass = $ARGV[2];

if(@ARGV < 2) {
print STDOUT "Usage: $0 [nick] [server] [nickserv pass] -- if nickname is not registered , leave it blank.\n";
exit; }

$con = IO::Socket::INET->new(PeerAddr=>$server,
                             PeerPort=>'6667', # change this if needed..
                             Proto=>'tcp',
                             Timeout=>'30') || print "Error: Connection\n";

print $con "USER $user\r\n";
print $con "NICK $botnick\r\n";
if(@ARGV == 3) {
print $con "privmsg nickserv IDENTIFY $nickservpass\r\n"; } # if $ARGV[2] exists..
print $con "JOIN #channel\r\n"; # modify that ..

while($answer = <$con>) {

#                      #
# add code here #
#                      #

if($answer =~ m/^PING (.*?)$/gi) {
print $con "PONG ".$1."\n"; # replying to pings..
}

print STDOUT $answer; # printing $answer to the terminal..
}