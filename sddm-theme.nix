{ pgks }:
pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
	owner = "MartianArlt";
	repo = "sddm-chili";
	rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
	sha2256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };

    instalPhase = ''
	mkdir -p $out
	cp -R ./* $out/
    '';
}

