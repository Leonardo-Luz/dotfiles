def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#fef49c'
    c.colors.webpage.darkmode.enabled = False
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'light'
    c.zoom.default = '110%'

    # --- Solarized Palette ---
    solarized_colors = {
        '0': '#000000', '1': '#cc0000', '2': '#00a600', '3': '#999900',
        '4': '#0000b2', '5': '#b200b2', '6': '#00a6b2', '7': '#cccccc',
        '8': '#666666', '9': '#e50000', '10': '#00d900', '11': '#e5e500',
        '12': '#0000ff', '13': '#e500e5', '14': '#00e5e5', '15': '#e5e5e5'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#fef49c'
    c.colors.statusbar.normal.fg = '#000000'
    c.colors.statusbar.insert.bg = '#fef49c'
    c.colors.statusbar.insert.fg = '#000000'
    c.colors.statusbar.command.bg = '#fef49c'
    c.colors.statusbar.command.fg = '#000000'
    c.colors.statusbar.url.fg = '#000000'
    c.colors.statusbar.url.success.https.fg = '#00a600'
    c.colors.statusbar.url.warn.fg = '#999900'
    c.colors.statusbar.url.error.fg = '#cc0000'

    # --- Completion ---
    c.colors.completion.fg = '#000000'
    c.colors.completion.odd.bg = '#fef49c'
    c.colors.completion.even.bg = '#fef49c'
    c.colors.completion.category.fg = '#0000b2'
    c.colors.completion.category.bg = '#fef49c'
    c.colors.completion.item.selected.fg = '#fef49c'
    c.colors.completion.item.selected.bg = '#000000'
    c.colors.completion.match.fg = '#0000b2'

    # --- Prompts ---
    c.colors.prompts.fg = '#000000'
    c.colors.prompts.bg = '#fef49c'
    c.colors.prompts.selected.bg = '#000000'
    c.colors.prompts.selected.fg = '#fef49c'

    # --- Hints ---
    c.colors.hints.fg = '#000000'
    c.colors.hints.bg = '#b200b2'
    c.colors.hints.match.fg = '#fef49c'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#fef49c'
    c.colors.tabs.odd.fg = '#000000'
    c.colors.tabs.odd.bg = '#fef49c'
    c.colors.tabs.even.fg = '#000000'
    c.colors.tabs.even.bg = '#fef49c'
    c.colors.tabs.selected.odd.fg = '#fef49c'
    c.colors.tabs.selected.odd.bg = '#000000'
    c.colors.tabs.selected.even.fg = '#fef49c'
    c.colors.tabs.selected.even.bg = '#000000'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#000000'
    c.colors.tooltip.bg = '#fef49c'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#fef49c'
    c.colors.downloads.start.fg = '#000000'
    c.colors.downloads.start.bg = '#fef49c'
    c.colors.downloads.stop.fg = '#000000'
    c.colors.downloads.stop.bg = '#fef49c'
    c.colors.downloads.error.fg = '#cc0000'
    c.colors.downloads.error.bg = '#fef49c'
