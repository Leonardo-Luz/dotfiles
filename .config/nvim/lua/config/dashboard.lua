local time = require 'time'
local dashboard = require 'dashboard'
local asciis = {}

pcall(function()
  --- Place your custom dashboard logos in .config/nvim/lua/custom/dashboard
  asciis = require 'custom.dashboard'
end)

local current_header = 'leovim_dos'
local header_theme = 'auto'
local current_setup = 'doom'
local time_centering = 'end'

local headers = {
  diam = {
    dark = {
      ' ▗▖█  ▐▌▄▄▄▄▄ ',
      ' ▐▌▀▄▄▞▘ ▄▄▄▀ ',
      ' ▐▌     █▄▄▄▄ ',
      ' ▐▙▄▄▖        ',
      '              ',
    },
    light = {
      ' ▗▖█  ▐▌▄▄▄▄▄ ',
      ' ▐▌▀▄▄▞▘ ▄▄▄▀ ',
      ' ▐▌     █▄▄▄▄ ',
      ' ▐▙▄▄▖        ',
      '              ',
    }
  },
  bloody = {
    dark = {
      '▓██▓     ██   ██ ▒███████▒',
      '▒██▒     ██  ▓██▒▒▒  ▒▄█▀░',
      '▒██░    ▓██  ▒██░░░ ▄█▀░  ',
      '▒██░    ▓██  ░██░ ▄█▀░   ░',
      '░██████▒▒▒█████▓ ▒███████▒',
      '░ ▒░▓  ░░▒▓▒ ▒ ▒ ░▒▒ ▓░▒░▒',
      '  ░ ▒   ░░▒░ ░ ░ ░░▒ ▒ ░ ▒',
      '  ░ ░    ░░░   ░ ░ ░ ░   ░',
      '    ░  ░   ░       ░      ',
      '                 ░        ',
    },
    light = {
      '▓██▓     ██   ██ ▒███████▒',
      '▒██▒     ██  ▓██▒▒▒  ▒▄█▀░',
      '▒██░    ▓██  ▒██░░░ ▄█▀░  ',
      '▒██░    ▓██  ░██░ ▄█▀░   ░',
      '░██████▒▒▒█████▓ ▒███████▒',
      '░ ▒░▓  ░░▒▓▒ ▒ ▒ ░▒▒ ▓░▒░▒',
      '  ░ ▒   ░░▒░ ░ ░ ░░▒ ▒ ░ ▒',
      '  ░ ░    ░░░   ░ ░ ░ ░   ░',
      '    ░  ░   ░       ░      ',
      '                 ░        ',
    }
  },
  leovim = {
    dark = {
      "██╗     ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "██║     ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██║     █████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║     ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "███████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚══════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    },
    light = {
      "██╗     ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "██║     ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██║     █████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║     ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "███████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚══════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }
  },
  leovim_dos = {
    dark = {
      " █████                                      ███                 ",
      "░░███                                      ░░░                  ",
      " ░███         ██████   ██████  █████ █████ ████  █████████████  ",
      " ░███        ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ",
      " ░███       ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ",
      " ░███      █░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ",
      " ███████████░░██████ ░░██████   ░░█████    █████ █████░███ █████",
      "░░░░░░░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ",
    },
    light = {
      " █████                                      ███                 ",
      "░░███                                      ░░░                  ",
      " ░███         ██████   ██████  █████ █████ ████  █████████████  ",
      " ░███        ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ",
      " ░███       ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ",
      " ░███      █░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ",
      " ███████████░░██████ ░░██████   ░░█████    █████ █████░███ █████",
      "░░░░░░░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ",
    }
  },
}

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return
      tonumber(hex:sub(1, 2), 16),
      tonumber(hex:sub(3, 4), 16),
      tonumber(hex:sub(5, 6), 16)
end

local function luminance(r, g, b)
  return 0.2126 * r + 0.7152 * g + 0.0722 * b
end

function GetTheme()
  local ghostty_config = vim.fn.system("ghostty +show-config")

  local bg_hex = ghostty_config:match("background%s*=%s*(#%x+)")
  local fg_hex = ghostty_config:match("foreground%s*=%s*(#%x+)")

  if not bg_hex or not fg_hex then
    return "dark"
  end

  local br, bg, bb = hex_to_rgb(bg_hex)
  local fr, fg, fb = hex_to_rgb(fg_hex)

  local bg_lum = luminance(br, bg, bb)
  local fg_lum = luminance(fr, fg, fb)

  if bg_lum > 128 then
    return "light"
  end

  if fg_lum > bg_lum then
    return "dark"
  end

  return "light"
end

if header_theme == 'auto' then
  header_theme = GetTheme()
end

for key, ascii in pairs(asciis) do
  headers[key] = ascii
end

local lenght = 0

for _, value in pairs(headers[current_header][header_theme]) do
  if #value > lenght then
    lenght = #value
  end
end

---@param num number|nil
---@return table
local function get_quotes(num)
  local quotes = {
    {
      ' ',
      '\"The only way to do great work is to love what you do.',
      "If you haven't found it yet, keep looking. Don't settle.\"",
      '- Steve Jobs',
    },
    { ' ', '\"Be the change that you wish to see in the world.\"',                                          (" "):rep(22) .. '- Mahatma Gandhi' },
    { ' ', '\"The journey of a thousand miles begins with a single step.\"',                                (" "):rep(22) .. '- Lao Tzu' },
    { ' ', "\"Believe you can and you're halfway there.\"",                                                 (" "):rep(22) .. '- Theodore Roosevelt' },
    { ' ', '\"The only limit to our realization of tomorrow will be our doubts of today.\"',                (" "):rep(22) .. '- Franklin D. Roosevelt' },
    { ' ', '\"Keep your face always toward the sunshine, and shadows will fall behind you.\"',              (" "):rep(22) .. '- Walt Whitman' },
    { ' ', '\"Not how long, but how well you have lived is the main thing.\"',                              (" "):rep(22) .. '- Seneca' },
    { ' ', "\"Life is what happens when you're busy making other plans.\"",                                 (" "):rep(22) .. '- John Lennon' },
    { ' ', '\"Happiness is not something ready made. It comes from your own actions.\"',                    (" "):rep(22) .. '- Dalai Lama' },
    { ' ', '\"Challenges are what make life interesting. Overcoming them is what makes life meaningful.\"', (" "):rep(22) .. '- Joshua Marine' },
  }

  local quote = {}

  for _, line in pairs(quotes[num or math.random(#quotes)]) do
    table.insert(quote, line)
  end

  for _ = 1, (10 + 4) - #quote - math.floor((#headers[current_header][header_theme] or 0) / 2) do
    table.insert(quote, ' ')
  end

  return quote
end

local function item(desc, key, action)
  return {
    icon = '* ',
    icon_hl = '@markup.strong',
    desc = desc,
    desc_hl = '@markup.strong',
    key = key,
    key_hl = '@markup.strong',
    key_format = ' [%s]',
    action = action,
  }
end

local function set_header(header)
  local _header = {}

  local pad_lines = ((7 + math.floor(lenght / 2)) - (math.floor(#headers[header][header_theme] / 2)))
  for _ = 1, pad_lines do
    table.insert(_header, ' ')
  end

  local header_start = #_header

  for _, line in pairs(headers[header][header_theme] or {}) do
    table.insert(_header, line)
  end

  local header_end = #_header

  table.insert(_header, ' ')
  time.update_time()

  local spacing = (' '):rep((#headers[header][header_theme][1] / 3) - #time.formated_time())

  if time_centering == 'start' then
    table.insert(_header, time.formated_time() .. spacing)
  elseif time_centering == 'end' then
    table.insert(_header, spacing .. time.formated_time())
  else
    table.insert(_header, time.formated_time())
  end

  table.insert(_header, ' ')
  table.insert(_header, ' ')

  vim.g.dashboard_header_range = { header_start, header_end }

  return _header
end

local function opts(theme, header)
  local _header = set_header(header)

  if theme == 'doom' then
    return {
      theme = 'doom',
      disable_move = false,
      config = {
        header = _header,
        disable_move = false,
        center = {
          item("Update", "u", "Lazy update"),
          item("Edit New File", "e", 'enew'),
          item("Files", "f", "Telescope find_files"),
          -- item("Nvim config", "n", 'Telescope find_files cwd=' .. vim.fn.stdpath 'config'),
          -- item("Telescope", "t", 'Telescope'),
        },
        hide = {},
        preview = {},
        vertical_center = true,
        footer = get_quotes(),
      },
    }
  elseif theme == 'hyper' then
    return {
      theme = 'hyper',
      disable_move = true,
      config = {
        header = _header,
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Nvim config',
            group = 'Number',
            action = 'Telescope find_files cwd=' .. vim.fn.stdpath 'config',
            key = 'd',
          },
        },
        packages = { enable = true },
        project = { enable = true, limit = 4, icon = '*', label = ' Recent Projects', action = 'Telescope find_files cwd=' },
        mru = { enable = true, limit = 4, icon = '*', label = ' Recent Files', cwd_only = false },
        footer = get_quotes(),
      },
    }
  end
  return {}
end

local function new_quote()
  dashboard:get_opts(function(obj)
    obj.config.header = set_header(current_header)
    obj.config.footer = get_quotes()

    dashboard:load_theme(obj)
  end)
end

vim.api.nvim_create_user_command("DashboardQuote", function()
  new_quote()
end, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.schedule(function()
      local buf = vim.api.nvim_get_current_buf()
      local ns = vim.api.nvim_create_namespace("dashboard_header")

      local range = vim.g.dashboard_header_range
      if not range then return end

      vim.api.nvim_buf_set_extmark(buf, ns, range[1], 0, {
        end_line = range[2],
        hl_group = "DashboardBold",
        priority = 10000,
        hl_mode = "replace"
      })
    end)
  end,
})

dashboard.setup(opts(current_setup, current_header))
