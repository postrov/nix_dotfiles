{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		fish
	];

programs.fish = {

	enable = true;

	shellAliases = {
		".." = "cd ..";
		"..." = "cd ../..";
		"...." = "cd ../../../";
		"....." = "cd ../../../../";
		
		"dot" = "cd ~/.dotfiles";
		"stor" = "cd /storage/FTP/";

		"cp" = "cp -v";
		"ddf" = "df -h";
		"etc" = "erd -H";
		"mkdir" = "mkdir -p";
		"mv" = "mv -v";
		"rm" = "rm -v";
		"rr" = "rm -rf";

		"ld" = "eza -ld */ --no-quotes --time-style long-iso";
		"lla" = "eza -lah --no-quotes --time-style long-iso";
		"ll" = "eza -lh --no-quotes --time-style long-iso";
		"llr" = "eza -lhr --no-quotes --time-style long-iso";
		"lls" = "eza -lh -s size --no-quotes --time-style long-iso";
		"llt" = "eza -lh -s time --no-quotes --time-style long-iso";
		"lltr" = "eza -lhr -s time --no-quotes --time-style long-iso";


		"p" = "feh -Z pics/";
		"v" = "vlc vids/";
		"avi" = "vlc *.avi";
		"jpeg" = "feh -Z *.jpeg";
		"jpg" = "feh -Z *.jpg";
		"mkv" = "vlc *.mkv";
		"mov" = "vlc *.mov";
		"mp3" = "vlc *.mp3";
		"mp4" = "vlc *.mp4";
		"png" = "feh -Z *.png";
		"vvlc" = "vlc *";
		"webm" = "vlc *.webm";
		
	};
	
	shellAbbrs = {
		# cargo abbreviations
		cb = "cargo build";
		cc = "cargo check";
		cdo = "cargo doc --open";
		cr = "cargo run";

		# git abbreviations
		gaa  = "git add -A";
		ga   = "git add";
		gbd  = "git branch --delete";
		gb   = "git branch";
		gc   = "git commit";
		gcm  = "git commit -m";
		gcob = "git checkout -b";
		gco  = "git checkout";
		gd   = "git diff";
		gl   = "git log";
		gp   = "git push";
		gpom = "git push origin main";
		gs   = "git status";
		gst  = "git stash";
		gstp =  "git stash pop";

		# nix abbreviations
		ncg = "nix-collect-garbage";

		nhb = "home-manager switch --flake .#beard@nixos";
		nhs = "home-manager switch --flake .#storage@storage";

		nrn = "sudo nixos-rebuild switch --flake .#nixos";
		nrs = "sudo nixos-rebuild switch --flake .#storage";
	};

	functions = {

		extract = '' 
		function extract
	    switch $argv[1]
	        case "*.tar.bz2"
	            tar xjf $argv[1]

	        case "*.tar.gz"
	            tar xzf $argv[1]

	        case "*.bz2"
	            bunzip2 $argv[1]

	        case "*.rar"
	            unrar e $argv[1]

	        case "*.gz"
	            gunzip $argv[1]

	        case "*.tar"
	            tar xf $argv[1]

	        case "*.tbz2"
	            tar xjf $argv[1]

	        case "*.tgz"
	            tar xzf $argv[1]

	        case "*.zip"
	            unzip $argv[1]

	        case "*.Z"
	            uncompress $argv[1]

	        case "*.7z"
	            7z x $argv[1]

	        case "*"
	            echo "unknown extension: $argv[1]"
	    end
		end
		'';


		extracttodir = '' 
		function extracttodir
		    switch $argv[1]
		        case "*.tar.bz2"
		            tar -xjf $argv[1] -C "$argv[2]"

		        case "*.tar.gz"
		            tar -xzf $argv[1] -C "$argv[2]"

		        case "*.rar"
		            unrar x $argv[1] "$argv[2]/"

		        case "*.tar"
		            tar -xf $argv[1] -C "$argv[2]"

		        case "*.tbz2"
		            tar -xjf $argv[1] -C "$argv[2]"

		        case "*.tgz"
		            tar -xzf $argv[1] -C "$argv[2]"

		        case "*.zip"
		            unzip $argv[1] -d $argv[2]

		        case "*.7z"
		            7za e -y $argv[1] -o"$argv[2]"

		        case "*"
		            echo "unknown extension: $argv[1]"
		    end
		end
		'';
		
		lsr = ''
		function lsr
    	ls | rg -i $argv[1]
		end
		 '';

		mkcd = '' 
		function mkcd --argument name
			mkdir -p $name
			cd $name
		end
		'';

		num = '' 
		function num 
			ls -1 $argv | wc -l;
		end
		'';

		wg = '' 
		function wg
	    set -l num_args (count $argv)

	    if test $num_args -eq 1
	        wget -c $argv[1]

	    else if test $num_args -eq 2
	        # arg1 = name, arg2 = url
	        wget -c -O $argv[1] $argv[2]

	    else
	        echo "Incorrect number of arguments"
	    end
		end
		'';

		ytarchive = '' 
		function ytarchive
		 yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
		 --sponsorblock-mark "all" \
		 --geo-bypass \
		 --sub-langs 'all' \
		 --embed-subs \
		 --embed-metadata \
		 --convert-subs 'srt' \
		 --download-archive $argv[1].txt https://www.youtube.com/$argv[1]/videos; 
		end
		'';

		ytarchivevideo = '' 
		function ytarchivevideo
		  yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
		 --sponsorblock-mark "all" \
		 --geo-bypass \
		 --sub-langs 'all' \
		 --embed-metadata \
		 --convert-subs 'srt' \
		 --download-archive $argv[1] $argv[2]; 
		end
		'';

		ytd = '' 
		function ytd
     yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
		 --sponsorblock-mark "all" \
		 --geo-bypass \
		 --sub-langs 'all' \
		 --embed-subs \
		 --embed-metadata \
		 --convert-subs 'srt' \
		 $argv
		end
		'';
	};
};
}
