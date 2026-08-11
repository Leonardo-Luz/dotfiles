def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#1e2326'
    c.colors.webpage.darkmode.enabled = False
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'dark'
    c.zoom.default = '110%'

    theme_colors = {
        '0': '#7a8478', '1': '#e67e80', '2': '#a7c080', '3': '#dbbc7f',
        '4': '#7fbbb3', '5': '#d699b6', '6': '#83c092', '7': '#f2efdf',
        '8': '#a6b0a0', '9': '#f85552', '10': '#8da101', '11': '#dfa000',
        '12': '#3a94c5', '13': '#df69ba', '14': '#35a77c', '15': '#fffbef'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#1e2326'
    c.colors.statusbar.normal.fg = '#7a8478'
    c.colors.statusbar.insert.bg = '#1e2326'
    c.colors.statusbar.insert.fg = '#7a8478'
    c.colors.statusbar.command.bg = '#1e2326'
    c.colors.statusbar.command.fg = '#7a8478'
    c.colors.statusbar.url.fg = '#7a8478'
    c.colors.statusbar.url.success.https.fg = '#a7c080'
    c.colors.statusbar.url.warn.fg = '#dbbc7f'
    c.colors.statusbar.url.error.fg = '#e67e80'

    # --- Completion ---
    c.colors.completion.fg = '#7a8478'
    c.colors.completion.odd.bg = '#1e2326'
    c.colors.completion.even.bg = '#1e2326'
    c.colors.completion.category.fg = '#7fbbb3'
    c.colors.completion.category.bg = '#1e2326'
    c.colors.completion.item.selected.fg = '#1e2326'
    c.colors.completion.item.selected.bg = '#7a8478'
    c.colors.completion.match.fg = '#7fbbb3'

    # --- Prompts ---
    c.colors.prompts.fg = '#7a8478'
    c.colors.prompts.bg = '#1e2326'
    c.colors.prompts.selected.bg = '#7a8478'
    c.colors.prompts.selected.fg = '#1e2326'

    # --- Hints ---
    c.colors.hints.fg = '#7a8478'
    c.colors.hints.bg = '#d699b6'
    c.colors.hints.match.fg = '#1e2326'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#1e2326'
    c.colors.tabs.odd.fg = '#7a8478'
    c.colors.tabs.odd.bg = '#1e2326'
    c.colors.tabs.even.fg = '#7a8478'
    c.colors.tabs.even.bg = '#1e2326'
    c.colors.tabs.selected.odd.fg = '#1e2326'
    c.colors.tabs.selected.odd.bg = '#7a8478'
    c.colors.tabs.selected.even.fg = '#1e2326'
    c.colors.tabs.selected.even.bg = '#7a8478'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#7a8478'
    c.colors.tooltip.bg = '#1e2326'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#1e2326'
    c.colors.downloads.start.fg = '#7a8478'
    c.colors.downloads.start.bg = '#1e2326'
    c.colors.downloads.stop.fg = '#7a8478'
    c.colors.downloads.stop.bg = '#1e2326'
    c.colors.downloads.error.fg = '#e67e80'
    c.colors.downloads.error.bg = '#1e2326'
