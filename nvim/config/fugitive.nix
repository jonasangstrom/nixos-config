{
    plugins.fugitive.enable = true;
    keymaps = [
	{
	    key =  "<leader>g";
	    action = ":Git<CR>";
	    options.silent = true;
	}
    ];
}
