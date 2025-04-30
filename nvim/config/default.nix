{
    # Import all your configuration modules here
    globals = {
	mapleader = " ";
	maplocalleader =  " ";
    };
    colorschemes.catppuccin.enable = true;
    imports = [
	./options.nix
	./lsps.nix
	./plugins.nix
    ];
}
