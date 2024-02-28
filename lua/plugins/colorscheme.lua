return {
  "craftzdog/solarized-osaka.nvim",
  lazy = true,
  priority = 10000,
  opts = {
    function()
      return {
        transparent = true,
      }
    end,
    styles = {
      sidebars = "transparent",
      backgroundcolors = "transparent",
      floats = "transparent",
    },
  },
}
