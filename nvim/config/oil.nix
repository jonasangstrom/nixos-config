{
    plugins.oil = {
	enable = true;
    };
    keymaps = [
	{
	    mode = "n";
	    key  = "fo";
	    action.__raw = ''
		function()
		    require('oil').open()
		end
	    '';
	}
    ];
}
