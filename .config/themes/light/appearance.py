def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#e1e2e7'
    c.colors.webpage.darkmode.enabled = False
    c.colors.webpage.preferred_color_scheme = 'light'
    c.zoom.default = '110%'

    # --- TokyoNight Day Palette ---
    tokyo_colors = {
        '0': '#e9e9ed', '1': '#f52a65', '2': '#587539', '3': '#8c6c3e',
        '4': '#2e7de9', '5': '#9854f1', '6': '#007197', '7': '#6172b0',
        '8': '#a1a6c5', '9': '#f52a65', '10': '#587539', '11': '#8c6c3e',
        '12': '#2e7de9', '13': '#9854f1', '14': '#007197', '15': '#3760bf'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#e1e2e7'
    c.colors.statusbar.normal.fg = '#3760bf'
    c.colors.statusbar.insert.bg = '#e1e2e7'
    c.colors.statusbar.insert.fg = '#3760bf'
    c.colors.statusbar.command.bg = '#e1e2e7'
    c.colors.statusbar.command.fg = '#3760bf'
    c.colors.statusbar.url.fg = '#3760bf'
    c.colors.statusbar.url.success.https.fg = '#587539'
    c.colors.statusbar.url.warn.fg = '#8c6c3e'
    c.colors.statusbar.url.error.fg = '#f52a65'

    # --- Completion ---
    c.colors.completion.fg = '#3760bf'
    c.colors.completion.odd.bg = '#e1e2e7'
    c.colors.completion.even.bg = '#e1e2e7'
    c.colors.completion.category.fg = '#2e7de9'
    c.colors.completion.category.bg = '#e1e2e7'
    c.colors.completion.item.selected.fg = '#e1e2e7'
    c.colors.completion.item.selected.bg = '#3760bf'
    c.colors.completion.match.fg = '#2e7de9'

    # --- Prompts ---
    c.colors.prompts.fg = '#3760bf'
    c.colors.prompts.bg = '#e1e2e7'
    c.colors.prompts.selected.bg = '#3760bf'
    c.colors.prompts.selected.fg = '#e1e2e7'

    # --- Hints ---
    c.colors.hints.fg = '#e1e2e7'
    c.colors.hints.bg = '#9854f1'
    c.colors.hints.match.fg = '#e1e2e7'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#e1e2e7'
    c.colors.tabs.odd.fg = '#3760bf'
    c.colors.tabs.odd.bg = '#e1e2e7'
    c.colors.tabs.even.fg = '#3760bf'
    c.colors.tabs.even.bg = '#e1e2e7'
    c.colors.tabs.selected.odd.fg = '#e1e2e7'
    c.colors.tabs.selected.odd.bg = '#3760bf'
    c.colors.tabs.selected.even.fg = '#e1e2e7'
    c.colors.tabs.selected.even.bg = '#3760bf'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#3760bf'
    c.colors.tooltip.bg = '#e1e2e7'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#e1e2e7'
    c.colors.downloads.start.fg = '#3760bf'
    c.colors.downloads.start.bg = '#e1e2e7'
    c.colors.downloads.stop.fg = '#3760bf'
    c.colors.downloads.stop.bg = '#e1e2e7'
    c.colors.downloads.error.fg = '#f52a65'
    c.colors.downloads.error.bg = '#e1e2e7'
