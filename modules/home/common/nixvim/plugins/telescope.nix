{
  extraConfigLua = ''
    local theme_file = vim.fn.stdpath("state") .. "/colorscheme"

    local function save_colorscheme(name)
      vim.fn.mkdir(vim.fn.fnamemodify(theme_file, ":h"), "p")
      vim.fn.writefile({ name }, theme_file)
    end

    local function load_saved_colorscheme()
      if vim.fn.filereadable(theme_file) == 1 then
        local saved = vim.fn.readfile(theme_file)[1]
        if saved and saved ~= "" then
          pcall(vim.cmd, "colorscheme " .. saved)
        end
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function(args)
        save_colorscheme(args.match)
      end,
    })

    -- Restore the last runtime-selected theme. The declarative default remains
    -- Catppuccin when no saved theme exists or the saved theme is unavailable.
    load_saved_colorscheme()
  '';

  plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = {
        action = "find_files hidden=true no_ignore=true";
        options.desc = "Find files";
      };
      "<leader>fg" = {
        action = "git_files";
        options.desc = "Find Git files";
      };
      "<leader>fs" = {
        action = "live_grep";
        options.desc = "Search text";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Search help tags";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Search opened buffers";
      };
      "<leader>fc" = {
        action = "commands";
        options.desc = "Search available commands and execute it";
      };
      "<leader>p" = {
        action = "colorscheme";
        options.desc = "Pick colorscheme";
      };
    };
  };
}
