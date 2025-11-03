def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#251200'
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'dark'
    c.zoom.default = '110%'

    # --- Autumn Palette ---
    autumn_colors = {
        '0': '#685742', '1': '#cc967b', '2': '#97976d', '3': '#6c9861',
        '4': '#b5955e', '5': '#c9a554', '6': '#d7c483', '7': '#b5955e',
        '8': '#685742', '9': '#cc967b', '10': '#97976d', '11': '#6c9861',
        '12': '#b5955e', '13': '#c9a554', '14': '#d7c483', '15': '#b5955e'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#251200'
    c.colors.statusbar.normal.fg = '#dec165'
    c.colors.statusbar.insert.bg = '#6c9861'
    c.colors.statusbar.insert.fg = '#000000'
    c.colors.statusbar.command.bg = '#685742'
    c.colors.statusbar.command.fg = '#dec165'
    c.colors.statusbar.url.fg = '#dec165'
    c.colors.statusbar.url.success.https.fg = '#6c9861'
    c.colors.statusbar.url.warn.fg = '#b5955e'
    c.colors.statusbar.url.error.fg = '#cc967b'

    # --- Completion ---
    c.colors.completion.fg = '#dec165'
    c.colors.completion.odd.bg = '#251200'
    c.colors.completion.even.bg = '#251200'
    c.colors.completion.category.fg = '#d7c483'
    c.colors.completion.category.bg = '#685742'
    c.colors.completion.item.selected.fg = '#000000'
    c.colors.completion.item.selected.bg = '#e4c47a'
    c.colors.completion.match.fg = '#c9a554'

    # --- Prompts ---
    c.colors.prompts.fg = '#dec165'
    c.colors.prompts.bg = '#251200'
    c.colors.prompts.selected.bg = '#6c9861'
    c.colors.prompts.selected.fg = '#000000'

    # --- Hints ---
    c.colors.hints.fg = '#000000'
    c.colors.hints.bg = '#c9a554'
    c.colors.hints.match.fg = '#251200'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#251200'
    c.colors.tabs.odd.fg = '#dec165'
    c.colors.tabs.odd.bg = '#685742'
    c.colors.tabs.even.fg = '#dec165'
    c.colors.tabs.even.bg = '#685742'
    c.colors.tabs.selected.odd.fg = '#000000'
    c.colors.tabs.selected.odd.bg = '#d7c483'
    c.colors.tabs.selected.even.fg = '#000000'
    c.colors.tabs.selected.even.bg = '#d7c483'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#000000'
    c.colors.tooltip.bg = '#d7c483'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#251200'
    c.colors.downloads.start.fg = '#000000'
    c.colors.downloads.start.bg = '#6c9861'
    c.colors.downloads.stop.fg = '#000000'
    c.colors.downloads.stop.bg = '#b5955e'
    c.colors.downloads.error.fg = '#cc967b'
    c.colors.downloads.error.bg = '#251200'
