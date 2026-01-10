return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      local function get_system_theme()
        -- For Linux/macOS (GTK-based)
        local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
        if handle then
          local result = handle:read("*a")
          handle:close()
          if result:match("dark") then
            return "dark"
          else
            return "light"
          end
        end
        return "dark" -- Default if detection fails
      end

      -- Apply the theme
      local theme = get_system_theme()
      vim.opt.background = theme
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}
