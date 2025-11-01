def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#000000'
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'dark'
    c.zoom.default = '110%'

    # --- Retro Palette ---
    retro_colors = {
        '0': '#13a10e', '1': '#13a10e', '2': '#13a10e', '3': '#13a10e',
        '4': '#13a10e', '5': '#13a10e', '6': '#13a10e', '7': '#13a10e',
        '8': '#16ba10', '9': '#16ba10', '10': '#16ba10', '11': '#16ba10',
        '12': '#16ba10', '13': '#16ba10', '14': '#16ba10', '15': '#16ba10'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#000000'
    c.colors.statusbar.normal.fg = '#13a10e'
    c.colors.statusbar.insert.bg = '#000000'
    c.colors.statusbar.insert.fg = '#13a10e'
    c.colors.statusbar.command.bg = '#000000'
    c.colors.statusbar.command.fg = '#13a10e'
    c.colors.statusbar.url.fg = '#13a10e'
    c.colors.statusbar.url.success.https.fg = '#16ba10'
    c.colors.statusbar.url.warn.fg = '#16ba10'
    c.colors.statusbar.url.error.fg = '#f52a65'

    # --- Completion ---
    c.colors.completion.fg = '#13a10e'
    c.colors.completion.odd.bg = '#000000'
    c.colors.completion.even.bg = '#000000'
    c.colors.completion.category.fg = '#16ba10'
    c.colors.completion.category.bg = '#000000'
    c.colors.completion.item.selected.fg = '#000000'
    c.colors.completion.item.selected.bg = '#16ba10'
    c.colors.completion.match.fg = '#16ba10'

    # --- Prompts ---
    c.colors.prompts.fg = '#13a10e'
    c.colors.prompts.bg = '#000000'
    c.colors.prompts.selected.bg = '#16ba10'
    c.colors.prompts.selected.fg = '#000000'

    # --- Hints ---
    c.colors.hints.fg = '#000000'
    c.colors.hints.bg = '#16ba10'
    c.colors.hints.match.fg = '#13a10e'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#000000'
    c.colors.tabs.odd.fg = '#13a10e'
    c.colors.tabs.odd.bg = '#000000'
    c.colors.tabs.even.fg = '#13a10e'
    c.colors.tabs.even.bg = '#000000'
    c.colors.tabs.selected.odd.fg = '#000000'
    c.colors.tabs.selected.odd.bg = '#16ba10'
    c.colors.tabs.selected.even.fg = '#000000'
    c.colors.tabs.selected.even.bg = '#16ba10'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#13a10e'
    c.colors.tooltip.bg = '#000000'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#000000'
    c.colors.downloads.start.fg = '#13a10e'
    c.colors.downloads.start.bg = '#000000'
    c.colors.downloads.stop.fg = '#13a10e'
    c.colors.downloads.stop.bg = '#000000'
    c.colors.downloads.error.fg = '#f52a65'
    c.colors.downloads.error.bg = '#000000'
