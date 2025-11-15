def setup(c):
    # --- Fonts ---
    c.fonts.default_family = 'Fira Code Nerd Font'
    c.fonts.default_size = '12pt'
    c.fonts.web.family.standard = 'Fira Code Nerd Font'
    c.fonts.web.family.fixed = 'Fira Code Nerd Font'

    # --- Webpage ---
    c.colors.webpage.bg = '#222436'
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.darkmode.policy.images = 'smart'
    c.colors.webpage.darkmode.policy.page = 'smart'
    c.colors.webpage.preferred_color_scheme = 'dark'
    c.zoom.default = '110%'

    # --- Retro Palette ---
    retro_colors = {
        '0': '#c8d3f5', '1': '#c8d3f5', '2': '#c8d3f5', '3': '#c8d3f5',
        '4': '#c8d3f5', '5': '#c8d3f5', '6': '#c8d3f5', '7': '#c8d3f5',
        '8': '#ffc777', '9': '#ffc777', '10': '#ffc777', '11': '#ffc777',
        '12': '#ffc777', '13': '#ffc777', '14': '#ffc777', '15': '#ffc777'
    }

    # --- Statusbar ---
    c.colors.statusbar.normal.bg = '#222436'
    c.colors.statusbar.normal.fg = '#c8d3f5'
    c.colors.statusbar.insert.bg = '#222436'
    c.colors.statusbar.insert.fg = '#c8d3f5'
    c.colors.statusbar.command.bg = '#222436'
    c.colors.statusbar.command.fg = '#c8d3f5'
    c.colors.statusbar.url.fg = '#c8d3f5'
    c.colors.statusbar.url.success.https.fg = '#ffc777'
    c.colors.statusbar.url.warn.fg = '#ffc777'
    c.colors.statusbar.url.error.fg = '#f52a65'

    # --- Completion ---
    c.colors.completion.fg = '#c8d3f5'
    c.colors.completion.odd.bg = '#222436'
    c.colors.completion.even.bg = '#222436'
    c.colors.completion.category.fg = '#ffc777'
    c.colors.completion.category.bg = '#222436'
    c.colors.completion.item.selected.fg = '#222436'
    c.colors.completion.item.selected.bg = '#ffc777'
    c.colors.completion.match.fg = '#ffc777'

    # --- Prompts ---
    c.colors.prompts.fg = '#c8d3f5'
    c.colors.prompts.bg = '#222436'
    c.colors.prompts.selected.bg = '#ffc777'
    c.colors.prompts.selected.fg = '#222436'

    # --- Hints ---
    c.colors.hints.fg = '#222436'
    c.colors.hints.bg = '#ffc777'
    c.colors.hints.match.fg = '#c8d3f5'

    # --- Tabs ---
    c.colors.tabs.bar.bg = '#222436'
    c.colors.tabs.odd.fg = '#c8d3f5'
    c.colors.tabs.odd.bg = '#222436'
    c.colors.tabs.even.fg = '#c8d3f5'
    c.colors.tabs.even.bg = '#222436'
    c.colors.tabs.selected.odd.fg = '#222436'
    c.colors.tabs.selected.odd.bg = '#ffc777'
    c.colors.tabs.selected.even.fg = '#222436'
    c.colors.tabs.selected.even.bg = '#ffc777'

    # --- Tooltips ---
    c.colors.tooltip.fg = '#c8d3f5'
    c.colors.tooltip.bg = '#222436'

    # --- Downloads ---
    c.colors.downloads.bar.bg = '#222436'
    c.colors.downloads.start.fg = '#c8d3f5'
    c.colors.downloads.start.bg = '#222436'
    c.colors.downloads.stop.fg = '#c8d3f5'
    c.colors.downloads.stop.bg = '#222436'
    c.colors.downloads.error.fg = '#f52a65'
    c.colors.downloads.error.bg = '#222436'
