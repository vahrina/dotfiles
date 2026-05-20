return {
  {
    "nvim-mini/mini.statusline",
    version = false,
    lazy = false,
    config = function()
      -- colors
      local set_hl = vim.api.nvim_set_hl

      -- mode indicator
      set_hl(0, "MiniStatuslineModeNormal", { fg = "#1e1e2e", bg = "#cdd6f4", bold = true })
      set_hl(0, "MiniStatuslineModeInsert", { fg = "#1e1e2e", bg = "#a6e3a1", bold = true })
      set_hl(0, "MiniStatuslineModeVisual", { fg = "#1e1e2e", bg = "#cba6f7", bold = true })
      set_hl(0, "MiniStatuslineModeReplace", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
      set_hl(0, "MiniStatuslineModeCommand", { fg = "#1e1e2e", bg = "#f9e2af", bold = true })
      set_hl(0, "MiniStatuslineModeOther", { fg = "#1e1e2e", bg = "#94e2d5", bold = true })

      -- branch, pct, row:col
      set_hl(0, "MiniStatuslineDevinfo", { fg = "#6c7086", bg = "#181825" })

      -- filename
      set_hl(0, "MiniStatuslineFilename", { fg = "#a6adc8", bg = "#181825" })

      -- inactive window
      set_hl(0, "MiniStatuslineInactive", { fg = "#45475a", bg = "#181825" })

      -- configuration
      local statusline = require("mini.statusline")
      -- put this inside your config function, before statusline.setup
      local last_key = ""
      vim.on_key(function(key)
        local key_name = vim.fn.keytrans(key)

        if key == " " or key_name:match("^<t_") then
          key_name = "<Space>"
        end

        if
          key_name == ""
          or key_name == "<CR>"
          or key_name == "<Esc>"
          or key_name == "<BS>"
          or key_name:match("^<C%-.>$")
        then
          last_key = ""
        else
          last_key = key_name
        end
      end, vim.api.nvim_create_namespace("statusline_key"))
      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local icon = require("mini.icons").get("file", vim.api.nvim_buf_get_name(0))
            local branch = vim.b.gitsigns_head or ""
            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            local line_count = vim.api.nvim_buf_line_count(0)
            local pct
            if row == 1 then
              pct = "top"
            elseif row == line_count then
              pct = "bot"
            else
              pct = math.floor(row / line_count * 100) .. "%%"
            end
            col = col + 1
            local time = os.date("%H:%M")
            local keys = vim.fn.reg_recording() ~= "" and "rec @" .. vim.fn.reg_recording() or ""
            return statusline.combine_groups({
              { hl = mode_hl, strings = { mode:sub(1, 1) } },
              { hl = "MiniStatuslineDevinfo", strings = { branch } },
              { hl = "MiniStatuslineFilename", strings = { filename, icon } },
              "%=",
              { hl = "MiniStatuslineFilename", strings = { last_key } },
              { hl = "MiniStatuslineDevinfo", strings = { pct } },
              { hl = "MiniStatuslineDevinfo", strings = { row .. ":" .. col } },
              { hl = mode_hl, strings = { time } },
            })
          end,
          inactive = function()
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            return statusline.combine_groups({
              { hl = "MiniStatuslineInactive", strings = { filename } },
            })
          end,
        },
      })
    end,
  },
}
