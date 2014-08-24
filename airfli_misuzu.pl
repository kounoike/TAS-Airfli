#!perl

use strict;
use warnings;

my $wtf = "airfli_misuzu.wtf";

open(F, "<", $wtf) or die "$wtf: $!";

my $header = "";
read F, $header, 0x400 or die "$wtf header: $!\n";

my ($sig, $total, $rr) = unpack("A4LL", $header);


print "total:$total, rr:$rr\n";

my $total_1 = $total - 1;
my $total_str = sprintf("/%05d", $total_1);
my $js = "airfli_misuzu_input.js";
open(JS, ">", $js) or die "$js: $!";
print JS <<"EOH";
AVS.last = m;
m1 = AVS.Trim(m, 0, $total_1);
m2 = AVS.Trim(m, $total, 0);
m1 = AVS.ShowFrameNumber(m1, false, 0, 753, 484, "Arial", 20, 0xffffff, 0x333333, 0, 0);
m1 = AVS.Subtitle(m1, "$total_str", 800, 480, 0, $total_1, "Arial", 20, 0xffffff, 0x333333, 1);
m2 = AVS.Subtitle(m2, "Movie End.", 753, 480, 0, 999999, "Arial", 20, 0xffffff, 0x333333, 1);
m = AVS.AlignedSplice(m1, m2);
EOH

my $cnt = 0;

my $rr_x_base = 640;
my $rr_x_spc = 13;
my $rr_y = 460;
my $rr_font = '"Arial"';
my $rr_fontsize = 20;
my $rr_fadeframe = 5;
my $rr_textcolor =  "0xffffff";
my $rr_textcolor2 = "0x999999";
my $rr_halocolor =  "0x333333";


my $debug = 0;
if ( $debug ) {
	my $x = $rr_x_base + $rr_x_spc * 4;
	print JS qq| m = AVS.Subtitle(m, "A", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 5;
	print JS qq| m = AVS.Subtitle(m, "B", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 0;
	print JS qq| m = AVS.Subtitle(m, "<", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 1;
	print JS qq| m = AVS.Subtitle(m, "v", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 2;
	print JS qq| m = AVS.Subtitle(m, "^", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
	$x = $rr_x_base + $rr_x_spc * 3;
	print JS qq| m = AVS.Subtitle(m, ">", $x, $rr_y, 0, 100000, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;

	exit;
}


my %input_start = ();

while ($cnt++ < $total){
	my $input="";
	read F, $input, 8;
	my @input = unpack("CCCCCCCC", $input);
	printf "$cnt: %02x %02x %02x %02x %02x %02x %02x %02x\n",@input;
	my ($input_a, $input_b, $input_left, $input_up, $input_down, $input_right);
	for my $key( @input ){
		if($key == 0x5a){ # z key
		    $input_a = 1;
		}elsif($key == 0x58){ # x key
		    $input_b = 1;
		}elsif($key == 0x25){ # Left key
		    $input_left = 1;
		}elsif($key == 0x28){ # Down key
		    $input_down = 1;
		}elsif($key == 0x26){ # Up key
		    $input_up = 1;
		}elsif($key == 0x27){ # Right key
		    $input_right = 1;
		}
	}
	
    if($input_a){
        if( ! exists $input_start{a} ){
            $input_start{a} = $cnt;
        }
    }
    else{
    	if(exists $input_start{a} ){
			my $x = $rr_x_base + $rr_x_spc * 4;
			print JS qq| m = AVS.Subtitle(m, "A", $x, $rr_y, $input_start{a}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{a};
    	}
    }

    if($input_b){
        if( ! exists $input_start{b} ){
            $input_start{b} = $cnt;
        }
    }
    else{
    	if(exists $input_start{b} ){
			my $x = $rr_x_base + $rr_x_spc * 5;
			print JS qq| m = AVS.Subtitle(m, "B", $x, $rr_y, $input_start{b}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{b};
    	}
    }

    if($input_left){
        if( ! exists $input_start{left} ){
            $input_start{left} = $cnt;
        }
    }
    else{
    	if(exists $input_start{left} ){
			my $x = $rr_x_base + $rr_x_spc * 0;
			print JS qq| m = AVS.Subtitle(m, "<", $x, $rr_y, $input_start{left}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{left};
    	}
    }

    if($input_down){
        if( ! exists $input_start{down} ){
            $input_start{down} = $cnt;
        }
    }
    else{
    	if(exists $input_start{down} ){
			my $x = $rr_x_base + $rr_x_spc * 1;
			print JS qq| m = AVS.Subtitle(m, "v", $x, $rr_y, $input_start{down}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{down};
    	}
    }

    if($input_up){
        if( ! exists $input_start{up} ){
            $input_start{up} = $cnt;
        }
    }
    else{
    	if(exists $input_start{up} ){
			my $x = $rr_x_base + $rr_x_spc * 2;
			print JS qq| m = AVS.Subtitle(m, "^", $x, $rr_y, $input_start{up}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{up};
    	}
    }

    if($input_right){
        if( ! exists $input_start{right} ){
            $input_start{right} = $cnt;
        }
    }
    else{
    	if(exists $input_start{right} ){
			my $x = $rr_x_base + $rr_x_spc * 3;
			print JS qq| m = AVS.Subtitle(m, ">", $x, $rr_y, $input_start{right}, $cnt-1, $rr_font, $rr_fontsize, $rr_textcolor, $rr_halocolor);\n|;
    		delete $input_start{right};
    	}
    }
}
print JS "\n";
close JS;
close F;

