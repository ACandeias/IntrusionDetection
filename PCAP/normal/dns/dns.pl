#!/usr/bin/perl

use Net::Pcap;

	my $err = '';
	my $filename = "alexa-top500-txt.pcap";
	my $pcap = Net::Pcap::open_offline($filename, \$err);

           # loop over next 10 packets
           Net::Pcap::pcap_loop($pcap, 10, \&process_packet, "just for the demo");

           # close the device
           Net::Pcap::pcap_close($pcap);

           sub process_packet {
               my($user_data, $header, $packet) = @_;
               print "$header\n";
               # do something ...
           }
