{
    # Import all your configuration modules here
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.lsp.servers.pyright.enable = true;
    plugins.fugitive.enable = true;
    imports = [ ./options.nix ];
}
