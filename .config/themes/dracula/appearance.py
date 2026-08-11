def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#282a36'
    c.colors.webpage.darkmode.enabled = False
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'light'
    c.zoom.default = '110%'

    # --- Solarized Palette ---
    solarized_colors = {
        '0': '#21222c', '1': '#ff5555', '2': '#50fa7b', '3': '#f1fa8c',
        '4': '#bd93f9', '5': '#ff79c6', '6': '#8be9fd', '7': '#f8f8f2',
        '8': '#6272a4', '9': '#ff6e6e', '10': '#69ff94', '11': '#ffffa5',
        '12': '#d6acff', '13': '#ff92df', '14': '#a4ffff', '15': '#ffffff'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#282a36'
    c.colors.statusbar.normal.fg = '#21222c'
    c.colors.statusbar.insert.bg = '#282a36'
    c.colors.statusbar.insert.fg = '#21222c'
    c.colors.statusbar.command.bg = '#282a36'
    c.colors.statusbar.command.fg = '#21222c'
    c.colors.statusbar.url.fg = '#21222c'
    c.colors.statusbar.url.success.https.fg = '#50fa7b'
    c.colors.statusbar.url.warn.fg = '#f1fa8c'
    c.colors.statusbar.url.error.fg = '#ff5555'

    # --- Completion ---
    c.colors.completion.fg = '#21222c'
    c.colors.completion.odd.bg = '#282a36'
    c.colors.completion.even.bg = '#282a36'
    c.colors.completion.category.fg = '#bd93f9'
    c.colors.completion.category.bg = '#282a36'
    c.colors.completion.item.selected.fg = '#282a36'
    c.colors.completion.item.selected.bg = '#21222c'
    c.colors.completion.match.fg = '#bd93f9'

    # --- Prompts ---
    c.colors.prompts.fg = '#21222c'
    c.colors.prompts.bg = '#282a36'
    c.colors.prompts.selected.bg = '#21222c'
    c.colors.prompts.selected.fg = '#282a36'

    # --- Hints ---
    c.colors.hints.fg = '#21222c'
    c.colors.hints.bg = '#ff79c6'
    c.colors.hints.match.fg = '#282a36'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#282a36'
    c.colors.tabs.odd.fg = '#21222c'
    c.colors.tabs.odd.bg = '#282a36'
    c.colors.tabs.even.fg = '#21222c'
    c.colors.tabs.even.bg = '#282a36'
    c.colors.tabs.selected.odd.fg = '#282a36'
    c.colors.tabs.selected.odd.bg = '#21222c'
    c.colors.tabs.selected.even.fg = '#282a36'
    c.colors.tabs.selected.even.bg = '#21222c'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#21222c'
    c.colors.tooltip.bg = '#282a36'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#282a36'
    c.colors.downloads.start.fg = '#21222c'
    c.colors.downloads.start.bg = '#282a36'
    c.colors.downloads.stop.fg = '#21222c'
    c.colors.downloads.stop.bg = '#282a36'
    c.colors.downloads.error.fg = '#ff5555'
    c.colors.downloads.error.bg = '#282a36'
