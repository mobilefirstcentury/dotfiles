
---- CVIM User Guide -----
==========================

[TODO]
  - intégrer les shortcuts manquants depuis [cette cheatsheet](https://www.cheatography.com/yograf/cheat-sheets/cvim/)
  - intégrer les shortcuts manquants depuis le fichier de config de cvim (entrer ':settings')
  - Ranger tout ça !!

Quick learn
-----------

### Basic

j,s – scroll down.
k,w – scroll up.
h – scroll left.
l – scroll right.

### Page

<Alt-h>,<backspace> | Go Backward page in the current tab
<Alt-l>, D          | Go forward a page in current tab.
 gg                 | scroll to top of the current page.
 G                  | scroll to the bottom of the current page.

 <Ctrl-h>           | Go next pagination
 <Ctrl-l>           | Go previous pagination
 g+                 | increment the first number in the URL path	incrementURLPath
 g-                 | decrement the first number in the URL path (e.g www.example.com/5 => www.example.com/4)	decrementURLPath

 zi                 | Zoom page in.
 zo                 | Zoom page out
 z0                 | Zoom page to original size.
 M<*>               | create quickmark <*>
 go<*>              | open quickmark <*> in current tab
 go<*>              | open quickmark <*> in a new tab

### Links

f – open a link in a new tab by pressing the marked keys in the page elements.
G – scroll to the bottom of the current page. (SHIFT + g)
W – open a link in a new tab by pressing the marked keys in the page elements.
W – open a link in a new window by pressing the marked keys in the page elements.
mf – open multiple links in a new tab by pressing the marked keys in the page elements.
gy – Copy a URL from a link to to the clipboard.


### Tabs

x             | Close the current tab.
X             | Open the last closed tab.
t             | Alias for :tabnew .
a             | An alias to :tabnew google .
<             | Move current tab left.
>             | Move current tab right.
:open google! | open in a new tab
:open google& | open Google in a new inactive tab
:open google$ | open Google in a new window

gt, K, R            | Navigate to the next tab.
gT, J, E            | Navigate to the previous tab.

### Caret/Visual Mode

v – Toggle between visual/caret mode.
h,j, k, l – Move the caret position/extend the visual selection
y – Copies the current selection.
ESC – Exit visual mode to caret mode/exit caret mode to normal mode.

### Core
: – Open the command bar.
. – Repeat the last command entered.
r – Reload the current tab .
gR – Reload the current tab + local cache.
yy – Copy the URL of the current page to the clipboard.

### Searching
#### web search
:ddg keywords | search `keywords` on duckduckgo
:g keywords  | search `keywords` on google
:ddg !w keywords | search `keywords` on wikipedia    # see ~help/help.md for duckduckgo bang keywords
:b w keywords | search `keywords` on wikipedia # does'nt work so far 

#### page search
/ open search bar
n – Next search result .
N – Previous search result.
b – Search through bookmarks.

### Misc
I – An alias to :history that let’s you search through browser history.
zr – Restart Google Chrome.
gd – An alias to :chrome://downloads
P – Open the clipboard contents in a new tab.
gq – Stop the current tab from loading

### Command Mode
#### Core

:tabnew(autocomplete) – Open a new tab with the typed/completed search.
:new (autocomplete) – Open a new window with the typed/completed search.
:open (autocomplete) – Open the typed/completed URL/google search.
:quit Close the current tab
:qall Close the current window
:duplicate – Duplicate the current tab.

#### Searching

:history (autocomplete) – Search through browser history.
:bookmarks (autocomplete) – Search through bookmarks.

#### Misc

:tabattach (autocomplete) – Move the current tab to another open window.
:tabdetach – Move the current tab to a new window.
:restore (autocomplete) – Restore a previously closed tab (newer versions of Chrome only).
:mksession – Create a new session from the current tabs in the active window.



Keybindings
-----------

### Custom 
**note**
  - this is the custom configuration synchronized with this [gist](https://gist.github.com/rachidbch/b9c97623f6e2ab361611)
  - if something seems broken refer to the gist and the [doc](https://github.com/1995eaton/chromium-vim)

#### commands
command |  action

:g | :tabnew google
:tabnew g example | :tabnew google example
:b | :tabnew bang
:tabnew b example | :tabnew bang example
:ddg | :tabnew google
:tabnew ddg example | :tabnew duckduckgo example

#### shortcuts
gna  | open reddit, google.com & twitter
1goa | open reddit
2goa | open  google
3goa | open twitter
<Leader>r | reloadTabUncached
<Leader>x | :restore<Space>
gb  | list buffers
<Ctrl+h>  | Toggle the current HUD display value  # [TODO] DEBUG
<Ctrl+u> | focus on rootFrame  # [TODO] DEBUG
<Alt+h> | goto previousTab  # [TODO] DEBUG
<Ctrl+d> | scrollPageDown
<Ctrl+e> | scrollPageUp
<Ctrl+m> | deleteWord
TA | opens all time top subject on reddit  #[TODO] DEBUG
TD | opens today's top subject on reddit   #[TODO] DEBUG
ci | get external ip address

 
### Movement		Mapping name
 j, s       | scroll down	scrollDown
 k, w       | scroll up	scrollUp
 h          | scroll left	scrollLeft
 l          | scroll right	scrollRight
 d          | scroll half-page down	scrollPageDown
 <unmapped> | scroll full-page down	scrollFullPageDown
 u, e       | scroll half-page up	scrollPageUp
 <unmapped> | scroll full-page up	scrollFullPageUp
 gg         | scroll to the top of the page	scrollToTop
 G          | scroll to the bottom of the page	scrollToBottom
 0          | scroll to the left of the page	scrollToLeft
 $          | scroll to the right of the page	scrollToRight
 #          | reset the scroll focus to the main page	resetScrollFocus
 gi         | go to first input box	goToInput
 gI         | go to the last focused input box by gi	goToLastInput
 zz         | center page to current search match (middle)	centerMatchH
 zt         | center page to current search match (top)	centerMatchT
 zb         | center page to current search match (bottom)	centerMatchB
 
### Link Hints		
 f          | open link in current tab	createHint
 F          | open link in new tab	createTabbedHint
 <unmapped> | open link in new tab (active)	createActiveTabbedHint
 W          | open link in new window	createHintWindow
 A          | repeat last hint command	openLastHint
 q          | trigger a hover event (mouseover + mouseenter)	createHoverHint
 Q          | trigger a unhover event (mouseout + mouseleave)	createUnhoverHint
 mf         | open multiple links	createMultiHint
 <unmapped> | edit text with external editor	createEditHint
 <unmapped> | call a code block with the link as the first argument	createScriptHint(<FUNCTION_NAME>)
 mr         | reverse image search multiple links	multiReverseImage
 my         | yank multiple links (open the list of links with P)	multiYankUrl
 gy         | copy URL from link to clipboard	yankUrl
 gr         | reverse image search (google images)	reverseImage
 ;          | change the link hint focus

### QuickMarks		
 M<*>  | create quickmark <*>	addQuickMark
 go<*> | open quickmark <*> in the current tab	openQuickMark
 gn<*> | open quickmark <*> in a new tab <N> times	openQuickMarkTabbed

### Miscellaneous		
 a             | alias to ":tabnew google "	:tabnew google
 .             | repeat the last command	repeatCommand
 :             | open command bar	openCommandBar
 /             | open search bar	openSearchBar
 ?             | open search bar (reverse search)	openSearchBarReverse
 <unmapped>    | open link search bar (same as pressing /?)	openLinkSearchBar
 I             | search through browser history	:history
 <N>g%         | scroll <N> percent down the page	percentScroll
 <N><unmapped> | pass <N> keys through to the current page	passKeys
 zr            | restart Google Chrome	:chrome://restart<CR>
 i             | enter insert mode (escape to exit)	insertMode
 r             | reload the current tab	reloadTab
 gR            | reload the current tab + local cache	reloadTabUncached
 ;<*>          | create mark <*>	setMark
 ''            | go to last scroll position	lastScrollPosition
 '<*>          | go to mark <*>	goToMark
 none          | reload all tabs	reloadAllTabs
 cr            | reload all tabs but current	reloadAllButCurrent
 zi            | zoom page in	zoomPageIn
 zo            | zoom page out	zoomPageOut
 z0            | zoom page to original size	zoomOrig
 z<Enter>      | toggle image zoom (same as clicking the image on image-only pages)	toggleImageZoom
 gd            | alias to :chrome://downloads<CR>	:chrome://downloads<CR>
 yy            | copy the URL of the current page to the clipboard	yankDocumentUrl
 yY            | copy the URL of the current frame to the clipboard	yankRootUrl
 ya            | copy the URLs in the current window	yankWindowUrls
 yh            | copy the currently matched text from find mode (if any)	yankHighlight
 b             | search through bookmarks	:bookmarks
 p             | open the clipboard selection	openPaste
 P             | open the clipboard selection in a new tab	openPasteTab
 gj            | hide the download shelf	hideDownloadsShelf
 gf            | cycle through iframes	nextFrame
 gF            | go to the root frame	rootFrame
 gq            | stop the current tab from loading	cancelWebRequest
 gQ            | stop all tabs from loading	cancelAllWebRequests
 gu            | go up one path in the URL	goUpUrl
 gU            | go to to the base URL	goToRootUrl
 gs            | go to the view-source:// page for the current Url	:viewsource!
 <C-b>         | create or toggle a bookmark for the current URL	createBookmark
 <unmapped>    | close all browser windows	quitChrome
 g-            | decrement the first number in the URL path (e.g www.example.com/5 => www.example.com/4)	decrementURLPath
 g+            | increment the first number in the URL path	incrementURLPath

Tab Navigation		
-------------
 gt, K, R                 | navigate to the next tab	nextTab
 gT, J, E                 | navigate to the previous tab	previousTab
 g0, g$                   | go to the first/last tab	firstTab, lastTab
 gh                       | open the last URL in the current tab's history in a new tab	openLastLinkInTab
 gl                       | open the next URL from the current tab's history in a new tab	openNextLinkInTab
 x                        | close the current tab	closeTab
 gxT                      | close the tab to the left of the current tab	closeTabLeft
 gxt                      | close the tab to the right of the current tab	closeTabRight
 gx0                      | close all tabs to the left of the current tab	closeTabsToLeft
 gx$                      | close all tabs to the right of the current tab	closeTabsToRight
 X                        | open the last closed tab	lastClosedTab
 t	:tabnew               | :tabnew
 T	:tabnew <CURRENT URL> | :tabnew @%
 O	:open <CURRENT URL>   | :open @%
 <N>%                     | switch to tab <N>	goToTab
 H, S                     | go back	goBack
 L, D                     | go forward	goForward
 B                        | search for another active tab	:buffer
 <                        | move current tab left	moveTabLeft
 >                        | move current tab right	moveTabRight
 gp                       | pin/unpin the current tab	pinTab
 <C-6>                    | toggle the focus between the last used tabs	lastUsedTab

Find Mode		
--------
 n          | next search result	nextSearchResult
 N          | previous search result	previousSearchResult
 v          | enter visual/caret mode (highlight current search/selection)	toggleVisualMode
 V          | enter visual line mode from caret mode/currently highlighted search	toggleVisualLineMode
 <unmapped> | clear search mode highlighting	clearSearchHighlight

Visual/Caret Mode		
-----------------
 <Esc>      | exit visual mode to caret mode/exit caret mode to normal mode
 v          | toggle between visual/caret mode
 h, j, k, l | move the caret position/extend the visual selection
 y          | copys the current selection
 n          | select the next search result
 N          | select the previous search result
 p          | open highlighted text in current tab
 P          | open highlighted text in new tab

Text boxes		
----------
 <C-i>      | move cursor to the beginning of the line	beginningOfLine
 <C-e>      | move cursor to the end of the line	endOfLine
 <C-u>      | delete to the beginning of the line	deleteToBeginning
 <C-o>      | delete to the end of the line	deleteToEnd
 <C-y>      | delete back one word	deleteWord
 <C-p>      | delete forward one word	deleteForwardWord
 <unmapped> | delete back one character	deleteChar
 <unmapped> | delete forward one character	deleteForwardChar
 <C-h>      | move cursor back one word	backwardWord
 <C-l>      | move cursor forward one word	forwardWord
 <C-f>      | move cursor forward one letter	forwardChar
 <C-b>      | move cursor back one letter	backwardChar
 <C-j>      | move cursor forward one line	forwardLine
 <C-k>      | move cursor back one line	backwardLine
 <unmapped> | select input text (equivalent to <C-a>)	selectAll
 <unmapped> | edit with Vim in a terminal (need the cvim_server.py script running for this to work)	editWithVim
 
Command Mode
------------
 :tabnew (autocomplete)              | open a new tab with the typed/completed search
 :new (autocomplete)                 | open a new window with the typed/completed search
 :open (autocomplete)                | open the typed/completed URL/google search
 :history (autocomplete)             | search through browser history
 :bookmarks (autocomplete)           | search through bookmarks
 :bookmarks /<folder> (autocomplete) | browse bookmarks by folder/open all bookmarks from folder
 :set (autocomplete)                 | temporarily change a cVim setting
 :chrome:// (autocomplete)           | open a chrome:// URL
 :tabhistory (autocomplete)          | browse the different history states of the current tab
 :command <NAME> <ACTION>            | aliases :<NAME> to :<ACTION>
 :quit                               | close the current tab
 :qall                               | close the current window
 :restore (autocomplete)             | restore a previously closed tab (newer versions of Chrome only)
 :tabattach (autocomplete)           | move the current tab to another open window
 :tabdetach                          | move the current tab to a new window
 :file (autocomplete)                | open a local file
 :source (autocomplete)              | load a cVimrc file into memory (this will overwrite the settings in the options page if the localconfig setting had been set previously
 :duplicate                          | duplicate the current tab
 :settings                           | open the settings page
 :nohlsearch                         | clear the highlighted text from the last search
 :execute                            | execute a sequence of keys (Useful for mappings. For example, "map j :execute 2j")
 :buffer (autocomplete)              | change to a different tab
 :mksession                          | create a new session from the current tabs in the active window
 :delsession (autocomplete)          | delete a saved session
 :session (autocomplete)             | open the tabs from a saved session in a new window
 :script                             | run JavaScript on the current page
 :togglepin                          | toggle the pin state of the current tab
 :pintab                             | pin the current tab
 :unpintab                           | unpin the current tab
 
Tips
---
 - You can use @% in "open" commands to specify the current URL. For example, :open @% would essentially refresh the current page.
 - Prepend a number to the command to repeat that command N times
 - You can set directives like reloadAllTabs in the settings to a binding.
 - Use the up/down arrows in command/find mode to navigate through previously executed commands/searches -- you can also use this to search for previously executed commands starting with a certain combination of letters (for example, entering ta in the command bar and pressing the up arrow will search command history for all matches beginning with ta

advanced configuration
------------------------


### Blacklists

The blacklists setting uses a custom inplementation of Chrome's @match pattern guidelines.
See https://developer.chrome.com/extensions/match_patterns for a description of the syntax.

### Site-specific Configuration

You can enable certain rc settings for sites using the blacklist match pattern as described above

  ```json
  " this will enable the config block below on the domain 'reddit.com'
  site '*://*.reddit.com/*' {
        unmap j
        unmap k
        set numerichints
  }
  ```


### Running commands when a page loads

In a similar fashion to the site-specific configuration described above, cVim can run commands when a page is loaded with the call keyword

  ```json
  " In this case, when pages with a file ending in '.js' are loaded,
  " cVim will pin the tab and then scroll down
  site '*://*/*.js' {
        call :pintab
        call scrollDown
  }
```

### Mappings

  - Normal mappings are defined with the following structure: map <KEY> <MAPPING_NAME>
  - Insert mappings use the same structure, but use the command "imap" instead of "map"
  - Control, meta, and alt can be used also:

  ```
  <C-u> " Ctrl + u
  <M-u> " Meta + u
  <A-u> " Alt  + u
  ```
  - It is also possible to unmap default bindings with unmap <KEY> and insert bindings with iunmap <KEY>
  - To unmap all default keybindings, use unmapAll. To unmap all default insert bindings, use iunmapAll

### Tabs

 - Commands that open links (:tabnew and :open) have three different properties

  ```
  ! => Open in a new tab
  $ => Open in a new window
  | => Open in an incognito window
  & => Open in a new tab (inactive/unfocused)
  * => Pin the tab
  ? => Treat the query as a search
  = => Treat the query as a URL
  ```

  - The use of these properties are best explained with examples:

  ```
  :open! google<CR> " This is the same as :tabnew google<CR>

  :open google!<CR> " This is another way of writing the above
                    " (these flags can can be added to either
                    " the base command or the end of the final command)

  :open& google<CR> " This will open Google in a new inactive tab

  :open$ google<CR> " This will open Google in a new window

  :open&* google<CR> " The will open Google in a new inactive, pinned tab

  :tabnew google&*<CR> " Once again, this will do the same thing as the above command

  :open google&*<CR> " Again, same as above

  :open google!& " Here, the & flag will cancel out the ! flag,
                " opening Google in a new inactive tab

  " More examples
  :bookmarks my_bookmark.com&  " inactive,new tab
  :bookmarks&* my_bookmark.com " inactive,pinned,new tab
  :bookmarks! my_bookmark.com  " new tab
  :bookmarks$ my_bookmark.com  " new window
  :bookmarks my_bookmark.com   " same tab
  ```



### Code blocks

  ```js
  - Code blocks allow you to interact with cVim's content scripts via the cVimrc.
  - Since code blocks use eval(...), you should only use them if you know what you're doing.

  " To be used by the code block
  set hintset_a

  " Create a code block named switchHintCharacters
  switchHintCharacters -> {{
    // We are now in JavaScript mode

    // Settings are contained in an object named settings
    settings.hintset_a = !settings.hintset_a;
    if (settings.hintset_a) {
      settings.hintcharacters = 'abc'; // equivalent to "let hintcharacters = 'abc'"
    } else {
      settings.hintcharacters = 'xyz';
    }

    // Propagate the current settings to all tabs for the
    // rest of the session
    PORT('syncSettings', { settings: settings });

    // Display cVim's status bar for 2 seconds.
    Status.setMessage('Hint Set: ' + (true ? 'a' : 'b'), 2);
  }}

  " Run the JavaScript block
  map <Tab> :call switchHintCharacters<CR>
  ```


### Completion Engines

  - These are a list of completion engines that can be used in the command bar.
  - They can be set by assigning their names to an array with the completionengines variable:
    + duckduckgo
    + google
    + wikipedia
    + webster
    + wictionary
    + google-maps
    + youtube
    + imdb
    + amazon
    + wolframalpha
    + google-image
    + google-trends 
    + google-finance
    + yahoo
    + bing
    + ebay
    + themoviedb
    + urbandictionary
    + answers


**Example usage:**
  ```js
  let completionengines = ['google', 'google-image', 'youtube'] " Show only these engines in the command bar
  ```
