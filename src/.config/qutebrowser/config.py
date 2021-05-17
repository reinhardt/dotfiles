import yaml

c = locals()["c"]
config = locals()["config"]

# TODO: import from other file
# Solarized Light scheme by Ethan Schoonover

base3 = "#fdf6e3"
base2 = "#eee8d5"
base1 = "#93a1a1"
base0 = "#839496"
base00 = "#657b83"
base01 = "#586e75"
base02 = "#073642"
base03 = "#002b36"
s_red = "#dc322f"
s_orange = "#cb4b16"
s_yellow = "#b58900"
s_green = "#859900"
s_cyan = "#2aa198"
s_blue = "#268bd2"
s_violet = "#6c71c4"
s_magenta = "#d33682"

accent = "#6c71c4"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base00

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base3

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base3

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = s_yellow

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base3

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base3

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base3

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base00

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base2

# Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = s_yellow

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = s_yellow

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = s_green

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base01

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base3

# Background color for the download bar.
c.colors.downloads.bar.bg = base3

# Color gradient start for download text.
c.colors.downloads.start.fg = base3

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base3

# Color gradient end for download text.
c.colors.downloads.stop.fg = base3

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = accent

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = s_red

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base3

# Font color for the matched part of hints.
c.colors.hints.match.fg = s_yellow

# Text color for the keyhint widget.
c.colors.keyhint.fg = base00

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base01

# Background color of the keyhint widget.
c.colors.keyhint.bg = base3

# Foreground color of an error message.
c.colors.messages.error.fg = base3

# Background color of an error message.
c.colors.messages.error.bg = s_red

# Border color of an error message.
c.colors.messages.error.border = s_red

# Foreground color of a warning message.
c.colors.messages.warning.fg = base3

# Background color of a warning message.
c.colors.messages.warning.bg = s_violet

# Border color of a warning message.
c.colors.messages.warning.border = s_violet

# Foreground color of an info message.
c.colors.messages.info.fg = base01

# Background color of an info message.
c.colors.messages.info.bg = base3

# Border color of an info message.
c.colors.messages.info.border = base3

# Foreground color for prompts.
c.colors.prompts.fg = base01

# Border used around UI elements in prompts.
c.colors.prompts.border = base3

# Background color for prompts.
c.colors.prompts.bg = base3

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = s_yellow

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = s_green

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base3

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base3

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = s_blue

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base3

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = s_cyan

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base3

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base0

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base01

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base3

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base01

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base3

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base3

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = s_violet

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base3

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = s_blue

# Background color of the progress bar.
c.colors.statusbar.progress.bg = s_blue

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base01

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = s_red

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base01

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base01

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base01

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = s_violet

# Background color of the tab bar.
c.colors.tabs.bar.bg = base3

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base3

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = s_red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base00

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base3

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base00

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base3

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base3

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = accent

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base3

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = accent

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base3


def dict_attrs(obj, path=""):
    if isinstance(obj, dict):
        for k, v in obj.items():
            yield from dict_attrs(v, "{}.{}".format(path, k) if path else k)
    else:
        yield path, obj


def load_yaml(filename):
    with (config.configdir / filename).open() as f:
        yaml_data = yaml.load(f)

    for k, v in dict_attrs(yaml_data):
        config.set(k, v)


# TODO migrate to config.yml
config.set("tabs.padding", {"bottom": 3, "left": 5, "right": 5, "top": 2})

load_yaml("config.yml")

config.set(
    "aliases",
    {
        "pocket-add": "jseval (function(){var e=function(t,n,r,i,s){var o=[3280150,8611465,6343722,5575463,4788040,3151514,5299346,5813139,4202559,4997440];var i=i||0,u=0,n=n||[],r=r||0,s=s||0;var a={'a':97,'b':98,'c':99,'d':100,'e':101,'f':102,'g':103,'h':104,'i':105,'j':106,'k':107,'l':108,'m':109,'n':110,'o':111,'p':112,'q':113,'r':114,'s':115,'t':116,'u':117,'v':118,'w':119,'x':120,'y':121,'z':122,'A':65,'B':66,'C':67,'D':68,'E':69,'F':70,'G':71,'H':72,'I':73,'J':74,'K':75,'L':76,'M':77,'N':78,'O':79,'P':80,'Q':81,'R':82,'S':83,'T':84,'U':85,'V':86,'W':87,'X':88,'Y':89,'Z':90,'0':48,'1':49,'2':50,'3':51,'4':52,'5':53,'6':54,'7':55,'8':56,'9':57,'\\/':47,':':58,'?':63,'=':61,'-':45,'_':95,'&':38,'$':36,'!':33,'.':46};if(!s||s==0){t=o[0]+t}for(var f=0;f<t.length;f++){var l=function(e,t){return a[e[t]]?a[e[t]]:e.charCodeAt(t)}(t,f);if(!l*1)l=3;var c=l*(o[i]+l*o[u%o.length]);n[r]=(n[r]?n[r]+c:c)+s+u;var p=c%(50*1);if(n[p]){var d=n[r];n[r]=n[p];n[p]=d}u+=c;r=r==50?0:r+1;i=i==o.length-1?0:i+1}if(s==286){var v='';for(var f=0;f<n.length;f++){v+=String.fromCharCode(n[f]%(25*1)+97)}o=function(){};return v+'60a1aaa514'}else{return e(u+'',n,r,i,s+1)}};var t=document,n=t.location.href,r=t.title;var i=e(n);var s=t.createElement('script');s.type='text/javascript';s.src='https://getpocket.com/b/r4.js?h='+i+'&u='+encodeURIComponent(n)+'&t='+encodeURIComponent(r);e=i=function(){};var o=t.getElementsByTagName('head')[0]||t.documentElement;o.appendChild(s)})()"
    },
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36",
    "*://web.whatsapp.com/",
)


config.bind("L", "tab-next")
config.bind("H", "tab-prev")
config.bind("gl", "tab-move -")
config.bind("gh", "tab-move +")
config.bind("<ctrl-l>", "tab-next")
config.bind("<ctrl-h>", "tab-prev")
config.bind("J", "forward")
config.bind("K", "back")
config.unbind("d")
config.bind("D", "tab-close")
config.bind(
    "<Escape>", "mode-leave ;; jseval -q document.activeElement.blur()", mode="insert"
)
config.bind(",p", "spawn --userscript qute-pass --dmenu-invocation dmenu")

config.load_autoconfig()
