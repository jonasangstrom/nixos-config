{
    # Import all your configuration modules here
    globals = {
	mapleader = " ";
	maplocalleader =  " ";
    };
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.web-devicons.enable = true;
    plugins.fugitive.enable = true;
    imports = [
	./options.nix
	./lsps.nix
	./telescope.nix
	./oil.nix
    ];
}
