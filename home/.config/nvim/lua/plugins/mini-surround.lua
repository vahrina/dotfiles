return {
  "nvim-mini/mini.surround",
  keys = function(_, keys)
    local opts = LazyVim.opts("mini.surround")
    local mappings = {
      { opts.mappings.add, desc = "add", mode = { "n", "x" } },
      { opts.mappings.delete, desc = "delete" },
      { opts.mappings.find, desc = "find right" },
      { opts.mappings.find_left, desc = "find left" },
      { opts.mappings.highlight, desc = "highlight" },
      { opts.mappings.replace, desc = "replace" },
      { opts.mappings.update_n_lines, desc = "update `MiniSurround.config.n_lines`" },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
  },
}
