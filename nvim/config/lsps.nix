{
    plugins = {
	lsp = {
	    enable = true;
	    inlayHints = true;
	    keymaps = {
		lspBuf = {
		    "gd" = "definition";
		    "rn" = "ename";
		};
	    };
	    servers = {
		nixd = {
		    enable = true;
		    settings = {
			expr = "import <nixpkgs> {}";
		    };
		};
		lua_ls.enable = true;
		pyright.enable = true;
            };
	    
	};
    };
}
