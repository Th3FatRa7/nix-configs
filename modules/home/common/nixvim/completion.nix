{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
	completion = {
	  list.selection.preselect = false;
	  documentation = {
	    auto_show = true;
	    auto_show_delay_ms = 0;
	  };
	};
	keymap = {
	  "<cr>" = [
	    "accept"
	    "fallback"
	  ];
	};
      };
    };
  };
}
