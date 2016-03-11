---- Chrome DevTools Cheat Sheet ----
====================================


Development Environment Setup
-----------------------------
** Beware **

  + As of 2016, it's impossible to launch chrome on the 'Dev' user profile from the command line: chrome is launched with 'Personne 1' user profile instead.
  + So in real word, we don't configure the 'Dev' profile but the 'Personne 1' profile 

1. create a 'Dev' profile: 
  - ! options> Settings > Persons > Button 'Add User Profile'
  - ! click on "User" button (top-right corner of chrome window) > Switch Profile User > Select 'Dev'
  - # Install Dev Oriented Chrome extensions:
    + Session Buddy
    + CVim
    + Devtools Theme: Zero Dark Matrix
    + [TODO] Add more here ...
2. Configure devtools 
  - ! Launch Devtools (Ctrl-Shift-I)
  - customize > settings > general 
    + disable cache (while DevTools is open)
    + enable Ctrl + 1-9 shortcut to switch panels
    + show rulers
  - customize > settings > experiments 
    + allow custom UI panel
    + security panel
  - customize > dockSide :
    + "Undock"
    + ! toggle floating mode : "win+shift+f" (i3 keyboard shortcut)
3. Serve local project
  - # There's more than one method to serve the local web project (cf Meteor for instance, ...)
  - $ cd <project-dir>
  - $ serve &>/dev/null & 
  

4. launch the project in chrome from the command line in app mode with the 'Dev' profile
  - # in app mode, the adress bar and the tabs are not displayed to maximize real estate 
  - $ google-chrome --app=http://localhost:3000 --profile-directory="Dev"        
  - > Win+Shift+f  # toggle floating mode  
  - # place chrome window as suited 
  
5. launch dev tools 
  - > Ctrl+Shift+I 
  - > Win+Shift+f # toggle foating mode
  - # place the DevTools window (The best option for scripting is to have chrome and devtools tabbed in a dedicated workspace. That way we can switch back and forth with Win+Tab)
  - ! select 'Sources' Panel
  - ! select 'Localhost:3000' folder, rigt click and select 'Add Folder to WorkSpace' > Select <project-dir>
  - ! accept DevTools access to project folder

6. Add live.js
  - ! in DevTools> Sources select '<project-dir>  > index.html' 
  - add '<script src="http://livejs.com/live.js">' at before body tag
  - > Ctrl+s  # save index.html file in <project-dir>
  - > Ctrl+r  # reload the project with live.js activated
  - # from now on, evry time we save a modification in DevTools:
    + the modification is saved on the disk 
    + the web page in chrome is updated automagically by live.js
    + the modified files are updated automagically if they are open in VIM by 'vim-autoread' plugin

Opening Devtools [◊](http://goo.gl/N68rh)
-----------------------------------------

Open Developer Tools                                       | F12, Ctrl + Shift + I
Open / switch from inspect element mode and browser window | Ctrl + Shift + C
Open Developer Tools and bring focus to the console        | Ctrl + Shift + J
Inspect the Inspector (*undock first one and press*)       | Ctrl + Shift + J


All Panels
----------


Show General Settings dialog | ?, F1

Next panel                                             | Ctrl + ]
Previous panel                                         | Ctrl + [
Backward in panel History                              | Ctrl + Alt + [
Forward in panel history                               | Ctrl + Alt + ]
Jump to panel 1-9 (*when enabled in General Settings*) | Ctrl + 1-9
Toggle Console / close settings dialog when open       | Esc
Refresh the page                                       | F5, Ctrl + R
Refresh the page ignoring cached content               | Ctrl + F5, Ctrl + Shift + R
Text search within current file or panel               | Ctrl + F
Text search across all sources                         | Ctrl + Shift + F
Search by filename (*except on Timeline*)              | Ctrl + O, Ctrl + O
Restore default text size                              | Ctrl + 0
Zoom in                                                | Ctrl + +
Zoom out                                               | Ctrl + -

Elements Panel [◊](http://goo.gl/DjP6v)
---------------------------------------

Undo change            | Ctrl + Z
Redo change            | Ctrl + Y
Navigate               | Up, Down
Expand / collapse node | Right, Left
Expand node            | Single-click on tag
Edit attribute         | Enter, Double-click on attribute
Hide element           | H
Toggle edit as HTML    | F2


**remark**:
-   Force element psuedo states: (`:active`, `:hover`, `:focus`, `:visited`)
-   Set breakpoints on the elements: (Subtree modifications, Attribute modification, Node removal)
-   Clear console


Styles Sidebar [◊](http://goo.gl/ZisTc)
---------------------------------------

Edit rule                                               | Single-click
Insert new property                                     | Single-click on whitespace
Go to line of style rule property declaration in source | Ctrl + Click on property
Go to line of property value declaration in source      | Ctrl + Click on property value
Go to line of style rule property declaration in source | Ctrl + Click on property
Go to line of property value declaration in source      | Ctrl + Click on property value
Cycle through the color definition value                | Shift + Click on color picker box
View auto-complete suggestions                          | Ctrl + Space
Edit next / previous property                           | Tab, Shift + Tab
Increment / decrement value                             | Up, Down
Increment / decrement value by 10                       | Shift + Up, Shift + Down
Increment / decrement value by 10                       | PgUp, PgDown
Increment / decrement value by 100                      | Shift + PgUp, Shift + PgDown
Increment / decrement value by 0.1                      | Alt + Up, Alt + Down



Sources Panel [◊](http://goo.gl/VsxZA)
--------------------------------------


Pause / resume script execution                            | F8, Ctrl + \\
Step over next function call                               | F10, Ctrl + '
Step into next function call                               | F11, Ctrl + ;
Step out of current function                               | Shift + F11, Ctrl + Shift + ;
Select next call frame                                     | Ctrl + .
Select previous call frame                                 | Ctrl + ,
Toggle breakpoint condition                                | Click on line number, Ctrl + B
Edit breakpoint condition                                  | Right-click on line number
Delete individual words                                    | Alt + Delete
Save changes to local modifications                        | Ctrl + S
Go to line                                                 | Ctrl + G
Search by filename                                         | Ctrl + O
Jump to line number                                        | Ctrl + P + :\<number\>
Jump to column                                             | Ctrl + O + :\<number\> + :\<number\>
Go to member                                               | Ctrl + Shift + O
Toggle console and evaluate code selected in Sources panel | Ctrl + Shift + E
Run snippet                                                | Ctrl + Enter
Toggle comment                                             | Ctrl + /

Timeline Panel [◊](http://goo.gl/wsxO3)
---------------------------------------

Start / stop recording | Ctrl + E
Save timeline data     | Ctrl + S
Load timeline data     | Ctrl + O

Profiles Panel [◊](http://goo.gl/WHAui)
---------------------------------------

Start / stop recording | Ctrl + E

**Profiling types**:

-   **[CPU profiler](http://goo.gl/igHcw)**: shows where execution time is spent in your page's JavaScript functions
-   **[Heap profiler](http://goo.gl/9mBFW)**: shows memory distribution by your page's JavaScript objects and related DOM nodes

Search Shortcuts
----------------


Search scripts, stylesheets and snippets by filename                  | Ctrl + O
Text search within current file                                       | Ctrl + F
Text search across all sources                                        | Ctrl + Shift + F
Filter/navigate to a JavaScript function/CSS rule when viewing a file | Ctrl + Shift + O
Launch line number dialog when viewing a file                         | Ctrl + K
Evaluate code selected in scripts in the console                      | Ctrl + Shift + E
Search file name or file path                                         | Ctrl+P
Search html elements from the console                                 | $('css selector') for only one element or $$('css selector') for all elements (if Jquery present then Jquery's $)

Console [◊](http://goo.gl/cu0vw)
--------------------------------


Next suggestion         | Tab
Previous suggestion     | Shift + Tab
Accept suggestion       | Right
Previous command / line | Up
Next command / line     | Down
Clear Console           | Ctrl + L
Multi-line entry        | Shift + Enter
Execute                 | Enter

**Right-clicking on console**:
-   XMLHTTPRequest logging: Turn on to view the XHR log
-   Preserve log upon navigation
-   Filter: Hide and unhide messages from script files
-   Clear console: Clear all console messages

Screencasting
-------------

Pinch zoom in and out | Alt + Scroll,Ctrl + Cick and drag with two fingers
Inspect element tool  | Ctrl + Shift + C

Emulation
---------

Pinch zoom in and out | Shift + Scroll

Console API [◊](http://goo.gl/Pfxc6)
------------------------------------


console.assert(expression[, object, ...])      | Tests that an expression is true. If not, it will write a message to the console and throw an exception. console.clear()                                                                                           | Clears the console.
console.count([title])                         | Writes the number of times that the line of code where count was called was executed. The optional argument title will print a message in
addition to the number of the count.

console.debug(object[, object, ...])           | Writes a message to the console, including a hyperlink to the line where it was called.
console.dir(object)                            | Prints an interactive listing of all properties of the object. This looks identical to the view that you would see in the DOM tab.
console.dirxml(node)                           | Prints the XML source tree of an HTML or XML element. This looks identical to the view that you would see in the HTML tab. You can click on
any node to inspect it in the HTML tab.

console.error(object[, object, ...])           | Writes a message to the console with the visual "error" icon and color coding and a hyperlink to the line where it was called.
console.exception(error-object[, object, ...]) | Prints an error message together with an interactive stack trace of JavaScript execution at the point where the exception occurred.
console.group(object[, object, ...])           | Writes a message to the console and opens a nested block to indent all future messages sent to the console. Call console.groupEnd() to close
the block.

console.groupCollapsed(object[, object, ...])  | Like console.group(), but block is initially collapsed.
console.groupEnd()                             | Closes the most recently opened block created by a call to console.group() or console.groupCollapsed().
console.info(object[, object, ...])            | Writes a message to the console with the visual "info" icon and color coding and a hyperlink to the line where it was called.
console.keys()                                 | Gives you the names of all the elements of an object.
console.log(object[, object, ...])             | Writes a message to the console. You may pass as many arguments as you'd like, and they will be joined together in a space-delimited line.
You can use printf-like string substitution patterns as well which are:

-   String: %s - ` console.log('The %s is a %s',                   animal, cat); `
-   Integer: %d, %i - ` console.log('Number %d                   plus %i', 1, 2); ` *\*integer not yet supported*
-   Floating point number: %f - `                   console.log('Floating points: %f', 1.5); ` *\*numeric formatting not yet supported*
-   Hyperlink: %o - ` console.log('Live laugh                   code at $o', 'http://anti-code.com' ); `
-   Style formatting: %c - ` console.log('%c This                   is white text on a black background',                   'color:#fff;background:#000;'); `

console.memory                      | An object that returns: jsHeapSizeLimit, totalJSHeapSize, usedJSHeapSize
console.profile([title])            | Turns on the JavaScript profiler. The optional argument title would contain the text to be printed in the header of the profile report.
console.profileEnd()                | Turns off the JavaScript profiler and prints its report.
console.profiles                    | An array of profile objects that summarizes the data from profile().
console.table(data[, columns])      | Allows to log provided data using tabular layout. The method takes one required parameter that represents table like data (array of arrays or list of
objects).

console.time([name])                | Creates a new timer under the given name. Call console.timeEnd(name) with the same name to stop the timer and print the time elapsed.
console.timeEnd()                   | Stops a timer created by a call to console.time(name) and writes the time elapsed.
console.trace()                     | Prints an interactive stack trace of JavaScript execution at the point where it is called.
console.values()                    | Gives you all the values of those elements.
console.warn(object[, object, ...]) | Writes a message to the console with the visual "warning" icon and color coding and a hyperlink to the line where it was called.
window.onerror                      | When exceptions are thrown in the window context and is not caught by any try/catch block, the function will be invoked with the exception's message,
the URL of the file where the exception was thrown and the line number in that file passed as three arguments in that order.

` window.onerror = function(msg, url, line) { console.log('message: ' + msg, 'url: ' + url, 'line: ' +  line); }; `

Command Line API [◊](http://goo.gl/TgehZ)
-----------------------------------------

\$\$                             | Returns an array of elements that match the given CSS selector.
\$0                              | The currently-selected object in the inspector.
\$\_                             | The previously evaluated statement
\$1                              | The previously-selected object in the inspector.
\$n(index)                       | Access to an array of last 5 inspected elements.
dir(object)                      | Prints an interactive listing of all properties of the object. This looks identical to the view that you would see in the DOM tab.
dirxml(node)                     | Prints the XML source tree of an HTML or XML element. This looks identical to the view that you would see in the HTML tab. You can click on any node to
inspect it in the HTML tab.

clear()                          | Clears the console.
copy()                           | Copies everything passed to it to the clipboard.
inspect(object[, tabName])       | Inspects an object in the most suitable tab, or the tab identified by the optional argument tabName.
keys(object)                     | Returns an array containing the names of all properties of the object.
values(object)                   | Returns an array containing the values of all properties of the object.
monitorEvents(object[, types])   | Turns on logging for all events dispatched to an object. The optional argument types may specify a specific family of events to log. The most commonly used
values for types are "mouse" and "key". The full list of available types includes "composition", "contextmenu", "drag", "focus", "form", "key", "load", "mouse", "mutation", "paint",
"scroll", "text", "ui", and "xul".

unmonitorEvents(object[, types]) | Turns off logging for all events dispatched to an object.
profile([title])                 | Turns on the JavaScript profiler. The optional argument title would contain the text to be printed in the header of the profile report.
profileEnd()                     | Turns off the JavaScript profiler and prints its report.

Flags [◊](http://goo.gl/0azd)
-----------------------------

-disable-javascript     | Disable JavaScript from command line.
-disable-images         | Disable images.
-disable-java           | Disable Java.
-disable-plugins        | Disable plugins.
-disable-popup-blocking | Disable popup blocking.
-start-maximized        | Start Chrome fullscreen

DevTools Themes [◊](http://devthemez.com/)
------------------------------------------

-   [MNML Theme](http://goo.gl/NNzwh)
-   [Monokai Dark](http://goo.gl/KgNfU)
-   [Tomorrow Theme](http://goo.gl/tcELr)
-   [IR\_Black Theme](http://goo.gl/Ou6WA)
-   [IR\_Black Theme with sidebar colors](http://goo.gl/5ddPs)
-   [Solarized Dark](http://goo.gl/W0INT)
-   [Ruby Blue](http://goo.gl/MxIjz)
-   [Expresso](http://goo.gl/zK2Sn)
-   [Inversion](http://goo.gl/T1SeZ)
-   [Dark Theme](http://goo.gl/viN4b)
-   [Dark Dev](http://goo.gl/BVIDe)
-   [WebLight Theme](http://goo.gl/E5NJh)

Tweak your skin for the DevTools using the DevTools themselves by undocking them then hitting ` Ctrl + Alt + I         ` or ` ⌃ + Alt + I ` on Mac. 

Override the classes/IDs of Devtools for your theme via:
-   Windows: C:/Users/%username%/AppData/Local/Google/Chrome/User
    Data/Default/User StyleSheets/Custom.css
-   Mac OSX: \~/Library/Application Support/Google/Chrome/Default/User
    StyleSheets/Custom.css
-   Ubuntu: \~/.config/chromium/Default/User StyleSheets/Custom.css

Read about how to [customize your Devtools](http://goo.gl/3hOAW).

Other Chrome Shortcuts
----------------------

Find next                                                                                      | Ctrl + G
Find previous                                                                                  | Ctrl + Shift + G
Open a new window in Incognito mode                                                            | Ctrl + Shift + N
Toggle Bookmarks bar on and off                                                                | Ctrl + Shift + B
View the History page                                                                          | Ctrl + H
View the Downloads page                                                                        | Ctrl + J
View the Task Manager                                                                          | Shift + ESC
Next page in a tabs browsing history                                                           | Alt + Right
Previous page in a tabs browsing history                                                       | Backspace, Alt + Left
Highlight content in the web address area                                                      | F6, Ctrl + L, Alt + D
Places a ? in the address bar for performing a keyword search using your default search engine | Ctrl + K, Ctrl + E

About:pages
-----------

about:about               | Displays all the chrome://chrome-urls
about:stats               | Display page statistics.
about:memory              | Display memory usage in a multi-process browser.
about:plugins             | Display installed plug-ins.
about:histograms          | Display connection times.
about:dns                 | Display DNS information.
about:cache               | Display cached web pages.
about:network             | Display a menu for various network monitoring and testing.
view-cache:stats          | Display cached documents.
chrome-resource:/favicon/ | Display the binary data for a PNG file.
chrome-resource:/new-tab/ | A template for the empty tab page.
about:version             | Display information about the browser.

Chrome URLs
-----------

-   chrome://chrome-urls == about:about
-   chrome://appcache-internals
-   chrome://blob-internals
-   chrome://bookmarks
-   chrome://cache
-   chrome://crashes
-   chrome://credits
-   chrome://dns
-   chrome://downloads
-   chrome://extensions
-   chrome://flags
-   chrome://flash
-   chrome://gpu-internals
-   chrome://histograms
-   chrome://history
-   chrome://ipc
-   chrome://media-internals
-   chrome://memory
-   chrome://net-internals
-   chrome://view-http-cache
-   chrome://newtab
-   chrome://plugins
-   chrome://print
-   chrome://quota-internals
-   chrome://sessions
-   chrome://starts
-   chrome://sync-internals
-   chrome://tcmalloc
-   chrome://terms
-   chrome://tracing
-   chrome://version
-   chrome://workers
-   chrome://conflicts

### For Debugging Chrome

The following pages are for debugging purposes only. Because they crash or hang the renderer, they're not linked directly; you can type them into the address bar if you need them

-   chrome://crash
-   chrome://kill
-   chrome://hang
-   chrome://shorthang
-   chrome://gpuclean
-   chrome://gpucrash
-   chrome://gpuhang

