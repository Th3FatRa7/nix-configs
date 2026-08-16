{
  globals = {
    mapleader = " ";
  };

  keymaps = [
    # Buffers
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>bn<cr>";
      options.desc = "Switch to next buffer";
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>bp<cr>";
      options.desc = "Switch to previous buffer";
    }

    # Windows
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Move to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Move to lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Move to upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Move to right window";
    }

    # Save file
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd>w<cr>";
      options.desc = "Save file";
    }
    {
      mode = "n";
      key = "<leader>S";
      action = "<cmd>wa<cr>";
      options.desc = "Save all files";
    }

    # Quit
    {
      mode = "n";
      key = "<C-q>";
      action = "<cmd>q<cr>";
      options = {
        desc = "Quit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>wq<cr>";
      options = {
        desc = "Save and quit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = "<cmd>wqa<cr>";
      options = {
        desc = "Save all and quit";
        silent = true;
      };
    }
  ];
}
