---- Visual Studio Code Editor User Guide ----
==============================================

what is it?
----------
It's a sublime text like code editor from Microsoft.
It's free, open source and based on node/electron 


use
---

### open a project

  ```sh
  $ cd <path/to/folder>
  $ code .
  ```

### command palette 
1. <ctrl+P>
2. type a command prefix

prefix                         | name                       | description
---                            | ---
?                              | Help                       | shows the available subset entrance commands
>                              | Run commands               | once you type this greater-than symbol you'll see all of the commands. Type partial command strings in to search through the available commands
<partial-file-name>            | Open files                 | start typing in the partial file name (including just an extension to get all files with the desired extension)
<partial-file-name>            | Open files in a new editor | Hold down CTRL while hitting ENTER to open the selected file in a new editor
@:[partial-symbol-name]        | Symbols                    | sorts the symbols by the different categories (i.e. functions, variables, etc.)
@[partial-symbol-name]         | Symbols                    | display all of the symbols in the currently-focused file
:<line-number>                 | Go to line                 | moves cursor to the specified line number in the currently-focused editor
!                              | Errors and warnings        | Use the up and down arrow keys to select different errors or warnings
git <command>                  | Git                        | allows you to currently checkout or branch
>Git                           | Git                        | brings up other git commands available
task [partial-task-name]       | Tasks                      | list tasks corresponding to partial or all task if no partial
ext [partial-ext-name]         | Extensions                 | list locally installed extensions (optionally with a search term)
ext install [partial-ext-name] | Extensions                 | search and install an extension
ext update                     | Extensions                 | update locally installed extensions

### use git
[TODO] 
  - détailler l'utilisation de Git 
  - git workfkow:
    + choisir un git workflow particulier ?
    + on peut trouver une extension pour ce git workflow particulier

#### general  git command
1. switch to git worskbench (<Ctrl+Shift+G>)
2. <Ctrl+Shift+P> 
3. Select Git Command
#### Fast Commit
1. switch to git worskbench (<Ctrl+Shift+G>) (the cursor is in the 'commit message' input)
2. type commit message
3. <Ctrl+Enter>

configuration
-------------

### Per project settings
#### general
  ```json
  // per project configuration is done in <path/to/project/folder>/.vscode/settings.json

  ```

#### compilation
#### debug
**note** 
  - to be able to run current project from vscode we must give it some infos. 
  - this is the role of the 'launch.json' file
**info** a default version of this file can be created via the vscode GUI
  - click on 'DEBUG' icon on the left panel
  - clicl on the gear button
  - select create default launch.js
  - select node.js environment
  - edit the file to change the defaults
  - save

  ```json
  // in <path/to/project/folder>/launch.json
  // this is an example of generated file
  // values manually modified  have a 'modified' flag
  {
      "version": "0.2.0",
      "configurations": [
          // this settings are used if **LAUNCH** debug option is selected on the GUI
          // it will launch a new app
          {
              "name": "Launch",
              "type": "node",
              "request": "launch",
              "program": "${workspaceRoot}/bin/www",   // to modify. path to the app entry in the **source** code
              "stopOnEntry": true,                     // breaks on first execution line
              "args": [],
              "cwd": "${workspaceRoot}",              // location of the workspace that will be launched/debugged (defaults to .) 
              "preLaunchTask": null,
              "runtimeExecutable": null,
              "runtimeArgs": [
                  "--nolazy"                // default. force Node to parse all the code at launch to place breakpoint correctly at the expense of longer launch time.
              ],
              "env": {
                  "NODE_ENV": "development"
              },
              "externalConsole": true,     // modified. force the execution of the app in an external console (by default it's executed in the debug console which can't be read by the app) 
              "sourceMaps": true,          // modified. enable sourcemaps. 
              "outDir": null,               // to modify: indicate the directory of the transpiled code (should also contains sourcemaps file)
              "preLaunchTask": null,        // optionnaly, the task to run prior to launch th edebug session

          },
          // this settings are used if **ATTACH** debug option is selected on lingueng ethe GUI
          // it will attch to a running node app instead of lauching a new one
          {
              "name": "Attach",
              "type": "node",
              "request": "attach",
              "port": 5858,
              "address": "localhost",
              "restart": false,            // default. forces the debugger to automatically restart at the end of the debug sesssion (usefull with a 'nodemon --debug server.js' for instance)
              "sourceMaps": true,          // modified. enable sourcemaps. 
              "outDir": null,               // to modify: indicate the directory of the transpiled code (should also contains sourcemaps file)
              "localRoot": "${workspaceRoot}",
              "remoteRoot": null
          }
      ]
  }
  ```




### Per User configuration
#### general
[TODO]
  - documenter commment j'ai configuré urxvt commme terminal par défaut au lieu de gnome terminal

  ```json
  // USER configuration is done in ~/dotfiles/.config/Code/User/settings.json
  ```


#### keyboard shortcuts
  ```json
  // in ~/dotfiles/.config/Code/User/keybindings.json

  ```

#### snippets
##### use 
  # in code file ...
  > enter 'fun'
  > type <ctrl-space> to display snippets
  > type <tab> to prompt snippet insertion


##### default snippets
vscode comes with several snippets by default.
 - define
 - while, dowhile
 - for, foreach, forin
 - fun,
 - if, ifelse
 - new
 - settimeout
 - switch
 - trycatch
 - try



##### user defined snippets 
  # must be added in in ~/dotfiles/.config/Code/User/snippets 
  # see [user defined snippets help](https://code.visualstudio.com/docs/customization/userdefinedsnippets)

[TODO] in 'javascript.json'? 'typescript.json'? both?
  
#### locales
  ```json
  // ~/dotfiles/.config/Code/User/locale.json 
  // specify UI languague

  "locale":"en-US"
  ```


intellisense
-----------
vscode allows very rich intellisense (even if we code in javascript) through typings (ex tsd) tool.

### initial typings installation
  $ npm install -g typings  

### typings initialisation
  # will create typings.json in current project
  $ typings init

### search definitions files
  ```sh
  # Search for definitions by key word (returns all modules with name containing keyword)
  $ typings search express

  # Find definition files with exact module name
  $ typings search --name express

  ```

### definition files install
**note** 
  - type signature packages are installed project per project
  - intellisense will be active only on project with a jsconfig.json file.

[TODO] documenter la specififcation des versions des packages
[TODO] c'est quoi le '--global'
[TODO] comment gérer les modules 'maison' ? ie. comment créer des packages typings pour des modules internes ?
        - solution 1: [dts-generator](https://github.com/SitePen/dts-generator)
        - solution 2: [dtsmake](https://github.com/ConquestArrow/dtsmake)
[TODO] comment installer et gérer tous les definitions files:
        - solution 1: depuis la commande palette ?
        - solution 2: [dtsm](https://github.com/vvakame/dtsm)

  ```sh
  # install definition files for **package** from **source**
  # the definitions will be persisted as dev dependencies
  # source can be "dt", "npm", "bower", "env", "global", "lib"  ('npm', 'env', 'global' and 'lib' are centralized in the [official registry](https://github.com/typings/registry)
  $ typings install <source>~<package> --save-dev

  # install express file definitions from [definitelydefined repo](https://github.com/DefinitelyTyped/DefinitelyTyped)
  $ typings install dt~express --save-dev              

  # definition files 'global' dependencies (ie dependencies that youd don't require like node, browserify, windoow or Array.protoype.map, should be installed as 'global
  $ typings install dt~node --global    


  # one can install a the definition files for a specific version of package
  $ typings install dt~node@5.0.0  --global   

  # beware of deep dependencies ( [TODO] dtsm can help to manage dependencies here ?)
  $ typings install dt~express dt~serve-static dt~express-serve-static-core -D

  # 'npm' is the default source
  # Install typings from npm
  typings install npm~bluebird -D
  ```

### definition files uninstall
  $ typings uninstall <name> [--save-dev | --global]

### print install definitions
  $ typings list

keyboard shortcuts
-------------------

shift+escape         | closeReferenceSearchEditor                        | when": "editorFocus && inReferenceSearchEditor"
escape               | closeReferenceSearchEditor                        | editorFocus && inReferenceSearchEditor
shift+escape         | cancelSelection                                   | editorTextFocus && editorHasSelection
escape               | cancelSelection                                   | editorTextFocus && editorHasSelection
ctrl+end             | cursorBottom                                      | editorTextFocus
ctrl+shift+end       | cursorBottomSelect                                | editorTextFocus
down                 | cursorDown                                        | editorTextFocus
shift+down           | cursorDownSelect                                  | editorTextFocus
end                  | cursorEnd                                         | editorTextFocus
shift+end            | cursorEndSelect                                   | editorTextFocus
home                 | cursorHome                                        | editorTextFocus
shift+home           | cursorHomeSelect                                  | editorTextFocus
left                 | cursorLeft                                        | editorTextFocus
shift+left           | cursorLeftSelect                                  | editorTextFocus
pagedown             | cursorPageDown                                    | editorTextFocus
shift+pagedown       | cursorPageDownSelect                              | editorTextFocus
pageup               | cursorPageUp                                      | editorTextFocus
shift+pageup         | cursorPageUpSelect                                | editorTextFocus
right                | cursorRight                                       | editorTextFocus
shift+right          | cursorRightSelect                                 | editorTextFocus
ctrl+home            | cursorTop                                         | editorTextFocus
ctrl+shift+home      | cursorTopSelect                                   | editorTextFocus
ctrl+u               | cursorUndo                                        | editorTextFocus
up                   | cursorUp                                          | editorTextFocus
shift+up             | cursorUpSelect                                    | editorTextFocus
ctrl+right           | cursorWordEndRight                                | editorTextFocus
ctrl+shift+right     | cursorWordEndRightSelect                          | editorTextFocus
ctrl+left            | cursorWordStartLeft                               | editorTextFocus
ctrl+shift+left      | cursorWordStartLeftSelect                         | editorTextFocus
shift+backspace      | deleteLeft                                        | editorTextFocus
backspace            | deleteLeft                                        | editorTextFocus
delete               | deleteRight                                       | editorTextFocus
ctrl+backspace       | deleteWordLeft                                    | editorTextFocus
ctrl+delete          | deleteWordRight                                   | editorTextFocus
ctrl+a               | editor.action.selectAll
ctrl+i               | expandLineSelection                               | editorTextFocus
shift+tab            | outdent                                           | editorTextFocus && !editorTabMovesFocus
ctrl+shift+z         | redo                                              | editorTextFocus
ctrl+y               | redo                                              | editorTextFocus
ctrl+down            | scrollLineDown                                    | editorTextFocus
ctrl+up              | scrollLineUp                                      | editorTextFocus
ctrl+pagedown        | scrollPageDown                                    | editorTextFocus
ctrl+pageup          | scrollPageUp                                      | editorTextFocus
tab                  | tab                                               | editorTextFocus && !editorTabMovesFocus
ctrl+z               | undo                                              | editorTextFocus
shift+escape         | removeSecondaryCursors                            | editorTextFocus && editorHasMultipleSelections
escape               | removeSecondaryCursors                            | editorTextFocus && editorHasMultipleSelections
ctrl+f               | actions.find
ctrl+k ctrl+c        | editor.action.addCommentLine                      | editorTextFocus
ctrl+d               | editor.action.addSelectionToNextFindMatch         | editorFocus
ctrl+shift+a         | editor.action.blockComment                        | editorTextFocus
ctrl+f2              | editor.action.changeAll                           | editorTextFocus
ctrl+c               | editor.action.clipboardCopyAction
ctrl+x               | editor.action.clipboardCutAction
ctrl+v               | editor.action.clipboardPasteAction
ctrl+/               | editor.action.commentLine                         | editorTextFocus
ctrl+shift+alt+down  | editor.action.copyLinesDownAction                 | editorTextFocus
ctrl+shift+alt+up    | editor.action.copyLinesUpAction                   | editorTextFocus
ctrl+k ctrl+k        | editor.action.defineKeybinding                    | editorFocus
ctrl+shift+k         | editor.action.deleteLines                         | editorTextFocus
ctrl+shift+i         | editor.action.format                              | editorTextFocus
f12                  | editor.action.goToDeclaration                     | editorTextFocus
ctrl+shift+.         | editor.action.inPlaceReplace.down                 | editorTextFocus
ctrl+shift+,         | editor.action.inPlaceReplace.up                   | editorTextFocus
ctrl+]               | editor.action.indentLines                         | editorTextFocus
ctrl+shift+up        | editor.action.insertCursorAbove                   | editorTextFocus
shift+alt+up         | editor.action.insertCursorAbove                   | editorTextFocus
shift+alt+i          | editor.action.insertCursorAtEndOfEachLineSelected | editorTextFocus
ctrl+shift+down      | editor.action.insertCursorBelow                   | editorTextFocus
shift+alt+down       | editor.action.insertCursorBelow                   | editorTextFocus
ctrl+enter           | editor.action.insertLineAfter                     | editorTextFocus
ctrl+shift+enter     | editor.action.insertLineBefore                    | editorTextFocus
ctrl+shift+\\        | editor.action.jumpToBracket                       | editorTextFocus
f8                   | editor.action.marker.next                         | editorFocus
shift+f8             | editor.action.marker.prev                         | editorFocus
alt+down             | editor.action.moveLinesDownAction                 | editorTextFocus
alt+up               | editor.action.moveLinesUpAction                   | editorTextFocus
ctrl+k ctrl+d        | editor.action.moveSelectionToNextFindMatch        | editorFocus
f3                   | editor.action.nextMatchFindAction                 | editorFocus
ctrl+f3              | editor.action.nextSelectionMatchFindAction        | editorFocus
ctrl+k f12           | editor.action.openDeclarationToTheSide            | editorTextFocus
ctrl+[               | editor.action.outdentLines                        | editorTextFocus
ctrl+shift+f10       | editor.action.previewDeclaration                  | editorTextFocus
shift+f3             | editor.action.previousMatchFindAction             | editorFocus
ctrl+shift+f3        | editor.action.previousSelectionMatchFindAction    | editorFocus
ctrl+.               | editor.action.quickFix                            | editorTextFocus
shift+f12            | editor.action.referenceSearch.trigger             | editorTextFocus
ctrl+k ctrl+u        | editor.action.removeCommentLine                   | editorTextFocus
f2                   | editor.action.rename                              | editorTextFocus
ctrl+shift+l         | editor.action.selectHighlights                    | editorFocus
alt+f1               | editor.action.showAccessibilityHelp               | editorFocus
shift+f10            | editor.action.showContextMenu                     | editorTextFocus
ctrl+k ctrl+i        | editor.action.showHover                           | editorTextFocus
shift+alt+right      | editor.action.smartSelect.grow                    | editorTextFocus
shift+alt+left       | editor.action.smartSelect.shrink                  | editorTextFocus
ctrl+shift+2         | editor.action.sortLinesAscending                  | editorTextFocus
ctrl+shift+3         | editor.action.sortLinesDescending                 | editorTextFocus
ctrl+h               | editor.action.startFindReplaceAction
ctrl+m               | editor.action.toggleTabFocusMode                  | editorTextFocus
alt+z                | editor.action.toggleWordWrap                      | editorTextFocus
ctrl+shift+space     | editor.action.triggerParameterHints               | editorTextFocus
ctrl+space           | editor.action.triggerSuggest                      | editorTextFocus
ctrl+shift+x         | editor.action.trimTrailingWhitespace              | editorTextFocus
ctrl+k ctrl+i        | editor.debug.action.showDebugHover                | inDebugMode && editorTextFocus
f9                   | editor.debug.action.toggleBreakpoint              | editorTextFocus
tab                  | editor.emmet.action.expandAbbreviation            | editorTextFocus && !editorHasSelection && !editorHasMultipleSelections && !editorTabMovesFocus && config.emmet.triggerExpansionOnTab
ctrl+shift+[         | editor.fold                                       | editorFocus
ctrl+shift+alt+[     | editor.foldAll                                    | editorFocus
ctrl+k ctrl+1        | editor.foldLevel1                                 | editorFocus
ctrl+k ctrl+2        | editor.foldLevel2                                 | editorFocus
ctrl+k ctrl+3        | editor.foldLevel3                                 | editorFocus
ctrl+k ctrl+4        | editor.foldLevel4                                 | editorFocus
ctrl+k ctrl+5        | editor.foldLevel5                                 | editorFocus
ctrl+shift+]         | editor.unfold                                     | editorFocus
ctrl+k ctrl+j        | editor.unfoldAll                                  | editorFocus
ctrl+shift+alt+]     | editor.unfoldAll                                  | editorFocus
shift+escape         | closeFindWidget                                   | editorFocus && findWidgetVisible
escape               | closeFindWidget                                   | editorFocus && findWidgetVisible
ctrl+alt+enter       | editor.action.replaceAll                          | editorFocus
ctrl+shift+1         | editor.action.replaceOne                          | editorFocus
alt+c                | toggleFindCaseSensitive                           | editorFocus
alt+r                | toggleFindRegex                                   | editorFocus
alt+w                | toggleFindWholeWord                               | editorFocus
shift+escape         | closeBreakpointWidget                             | editorFocus && breakpointWidgetVisible
escape               | closeBreakpointWidget                             | editorFocus && breakpointWidgetVisible
enter                | acceptSnippet                                     | editorTextFocus && inSnippetMode
tab                  | jumpToNextSnippetPlaceholder                      | editorTextFocus && inSnippetMode
shift+tab            | jumpToPrevSnippetPlaceholder                      | editorTextFocus && inSnippetMode
shift+escape         | leaveSnippet                                      | editorTextFocus && inSnippetMode
escape               | leaveSnippet                                      | editorTextFocus && inSnippetMode
shift+escape         | closeMarkersNavigation                            | editorFocus && markersNavigationVisible
escape               | closeMarkersNavigation                            | editorFocus && markersNavigationVisible
shift+escape         | closeReferenceSearch                              | editorFocus && referenceSearchVisible
escape               | closeReferenceSearch                              | editorFocus && referenceSearchVisible
shift+escape         | closeParameterHints                               | editorTextFocus && parameterHintsVisible
escape               | closeParameterHints                               | editorTextFocus && parameterHintsVisible
alt+down             | showNextParameterHint                             | editorTextFocus && parameterHintsVisible
down                 | showNextParameterHint                             | editorTextFocus && parameterHintsVisible
alt+up               | showPrevParameterHint                             | editorTextFocus && parameterHintsVisible
up                   | showPrevParameterHint                             | editorTextFocus && parameterHintsVisible
tab                  | acceptQuickFixSuggestion                          | editorFocus && quickFixWidgetVisible
enter                | acceptQuickFixSuggestion                          | editorFocus && quickFixWidgetVisible
shift+escape         | closeQuickFixWidget                               | editorFocus && quickFixWidgetVisible
escape               | closeQuickFixWidget                               | editorFocus && quickFixWidgetVisible
pagedown             | selectNextPageQuickFix                            | editorFocus && quickFixWidgetVisible
down                 | selectNextQuickFix                                | editorFocus && quickFixWidgetVisible
pageup               | selectPrevPageQuickFix                            | editorFocus && quickFixWidgetVisible
up                   | selectPrevQuickFix                                | editorFocus && quickFixWidgetVisible
tab                  | acceptSelectedSuggestion                          | editorTextFocus && suggestWidgetVisible
enter                | acceptSelectedSuggestionOnEnter                   | suggestWidgetVisible && config.editor.acceptSuggestionOnEnter
shift+escape         | hideSuggestWidget                                 | editorTextFocus && suggestWidgetVisible
escape               | hideSuggestWidget                                 | editorTextFocus && suggestWidgetVisible
alt+pagedown         | selectNextPageSuggestion                          | editorTextFocus && suggestWidgetVisible
pagedown             | selectNextPageSuggestion                          | editorTextFocus && suggestWidgetVisible
alt+down             | selectNextSuggestion                              | editorTextFocus && suggestWidgetVisible
down                 | selectNextSuggestion                              | editorTextFocus && suggestWidgetVisible
alt+pageup           | selectPrevPageSuggestion                          | editorTextFocus && suggestWidgetVisible
pageup               | selectPrevPageSuggestion                          | editorTextFocus && suggestWidgetVisible
alt+up               | selectPrevSuggestion                              | editorTextFocus && suggestWidgetVisible
up                   | selectPrevSuggestion                              | editorTextFocus && suggestWidgetVisible
ctrl+space           | toggleSuggestionDetails                           | editorTextFocus && suggestWidgetVisible
enter                | acceptRenameInput                                 | editorFocus && renameInputVisible
shift+escape         | cancelRenameInput                                 | editorFocus && renameInputVisible
escape               | cancelRenameInput                                 | editorFocus && renameInputVisible
shift+escape         | closeAccessibilityHelp                            | editorFocus && accessibilityHelpWidgetVisible
escape               | closeAccessibilityHelp                            | editorFocus && accessibilityHelpWidgetVisible
ctrl+shift+r         | toggleExperimentalScreenReaderSupport
ctrl+w               | workbench.action.closeActiveEditor
ctrl+k f             | workbench.action.closeFolder
shift+escape         | workbench.action.closeMessages                    | globalMessageVisible
escape               | workbench.action.closeMessages                    | globalMessageVisible
ctrl+shift+w         | workbench.action.closeWindow
ctrl+k ctrl+right    | workbench.action.compareEditor.nextChange         | textCompareEditorVisible
ctrl+k ctrl+left     | workbench.action.compareEditor.previousChange     | textCompareEditorVisible
ctrl+\`               | workbench.action.cycleEditor
f5                   | workbench.action.debug.continue                   | inDebugMode
ctrl+shift+f5        | workbench.action.debug.restart                    | inDebugMode
ctrl+f5              | workbench.action.debug.run                        | !inDebugMode
f5                   | workbench.action.debug.start                      | !inDebugMode
shift+f11            | workbench.action.debug.stepOut                    | inDebugMode
f10                  | workbench.action.debug.stepOver                   | inDebugMode
shift+f5             | workbench.action.debug.stop                       | inDebugMode
ctrl+k m             | workbench.action.editor.changeLanguageMode
ctrl+k p             | workbench.action.files.copyPathOfActiveFile
ctrl+n               | workbench.action.files.newUntitledFile
ctrl+o               | workbench.action.files.openFile
ctrl+k r             | workbench.action.files.revealActiveFileInWindows
ctrl+s               | workbench.action.files.save
ctrl+shift+s         | workbench.action.files.saveAs
ctrl+k o             | workbench.action.files.showOpenedFileInNewWindow
ctrl+1               | workbench.action.focusFirstEditor
ctrl+shift+alt+left  | workbench.action.focusLeftEditor
ctrl+shift+alt+right | workbench.action.focusRightEditor
ctrl+2               | workbench.action.focusSecondEditor
ctrl+0               | workbench.action.focusSideBar
ctrl+3               | workbench.action.focusThirdEditor
ctrl+g               | workbench.action.gotoLine
ctrl+shift+o         | workbench.action.gotoSymbol
ctrl+k v             | workbench.action.markdown.openPreviewSideBySide
ctrl+shift+v         | workbench.action.markdown.togglePreview
ctrl+k left          | workbench.action.moveActiveEditorLeft
ctrl+k right         | workbench.action.moveActiveEditorRight
ctrl+alt+-           | workbench.action.navigateBack
ctrl+shift+-         | workbench.action.navigateForward
ctrl+shift+n         | workbench.action.newWindow
ctrl+shift+tab       | workbench.action.openPreviousEditor
ctrl+tab             | workbench.action.openPreviousEditor
ctrl+shift+h         | workbench.action.output.toggleOutput
ctrl+e               | workbench.action.quickOpen
ctrl+p               | workbench.action.quickOpen
ctrl+tab             | workbench.action.quickOpenNavigateNext            | inQuickOpen
ctrl+e               | workbench.action.quickOpenNavigateNext            | inQuickOpen
ctrl+p               | workbench.action.quickOpenNavigateNext            | inQuickOpen
ctrl+shift+j         | workbench.action.search.toggleQueryDetails        | searchViewletVisible
ctrl+t               | workbench.action.showAllSymbols
f1                   | workbench.action.showCommands
ctrl+shift+p         | workbench.action.showCommands
ctrl+shift+m         | workbench.action.showErrorsWarnings
ctrl+\\              | workbench.action.splitEditor
ctrl+shift+b         | workbench.action.tasks.build
ctrl+shift+c         | workbench.action.terminal.openNativeConsole
f11                  | workbench.action.toggleFullScreen
ctrl+j               | workbench.action.togglePanel
ctrl+b               | workbench.action.toggleSidebarVisibility
ctrl+=               | workbench.action.zoomIn
ctrl+-               | workbench.action.zoomOut
ctrl+shift+y         | workbench.debug.action.toggleRepl
ctrl+k enter         | workbench.files.action.addToWorkingFiles
ctrl+k ctrl+w        | workbench.files.action.closeAllFiles
ctrl+k w             | workbench.files.action.closeFile
ctrl+k ctrl+shift+w  | workbench.files.action.closeOtherFiles
ctrl+k e             | workbench.files.action.focusWorkingFiles
ctrl+k down          | workbench.files.action.openNextWorkingFile
ctrl+k up            | workbench.files.action.openPreviousWorkingFile
ctrl+shift+t         | workbench.files.action.reopenClosedFile
ctrl+k ctrl+p        | workbench.files.action.workingFilesPicker
ctrl+shift+d         | workbench.view.debug
ctrl+shift+e         | workbench.view.explorer
ctrl+shift+g         | workbench.view.git
ctrl+shift+f         | workbench.view.search
f11                  | workbench.action.debug.stepInto                   | inDebugMode
ctrl+shift+tab       | workbench.action.quickOpenNavigatePrevious        | inQuickOpen
ctrl+shift+e         | workbench.action.quickOpenNavigatePrevious        | inQuickOpen
ctrl+shift+p         | workbench.action.quickOpenNavigatePrevious        | inQuickOpen
.                    | ^acceptSelectedSuggestion                         | editorTextFocus && suggestWidgetVisible && editorLangId == 'typescript' && suggestionSupportsAcceptOnKey


install
-------
  ```sh
  # [TODO] we don't have a link to the last version (go and see on https://code.visualstudio.com/Updates)
  # [TODO] Documenter comment updater vscode avec dpkg
  $ wget https://az764295.vo.msecnd.net/stable/def9e32467ad6e4f48787d38caf190acbfee5880/vscode-amd64.deb 
  $ sudo dpkg -i vscode-amd64.deb
  # install microsoft's typings tool that give access to type definitions for a lot of frameworks & libs
  # this way vscode is able to display intellisense info on those frameworks
  ```



setup
-----
### node environment setup

### typescript setup

[TODO] 
  - proposer une structure minimale de repertoires pour gérer des projects contenant du code typescript transpilé et du code javascript (paramètre 'allowJs')
  - adapter les fichiers de configs ci-dessous à cette structure

**note** 
  - this file indicates to vscode that:
    + the containging folder is a **project workspace**
    + that it must use installed typings files for intellisense 
  - a 'jsconfig.json' file is a 'tsconfig.json' file with the paramater 'allowJs' set.

```json
  // in <path/to/project/folder>/jsconfig.js
  // See https://code.visualstudio.com/Docs/languages/javascript
  // for documentation about jsconfig.js format
  {
      "compilerOptions": {
          "target": "ES6",            // we're writing ES6 compliant code
          "module": "commonjs",
          "sourceMap": true,
          "noImplicitAny": false,      // [TODO] confirmer le sens de ce paramètre: we want to code in JS but want to use typescript type declaration when it's usefull.
                                      // this prevents vscode from spitting errors on each not typed variable ?
          "allowSyntheticDefaultImports": true,            // creates synthetic default declaration in pre-ES6 modules without default export. Usefull for proper intellisense.
          "diagnostics": true,                            // [TODO] utile ?
          "jsx": "preserve",                              // [TODO] alternative value: "react"
          "outDir": "path/to/generated/code/dir",
          "watch": true
      },
      "exclude": [                   // which sub-folders to ignore ?
          "node_modules",
          "bower_components",
          "tmp",
          "temp",
          "dist",
          "jspm_packages"
      ]
  }
```

2. create a task.json file to define pre-run tasks:
[TODO] 
  * only build task can be lanched with <Ctrl+Shift+B>
  * to be a build task must:
    + be the uniq task 
    + or be named 'build'
    + or have the 'isBuildCommand' property

  - typescript compilation 
    ```json
    // [TODO] proposer un boilerplate à utiliser par défaut
    // in <path/to/project/folde>/.vscode/tasks.json
    {
     // See http://go.microsoft.com/fwlink/?LinkId=733558
     // for the documentation about the tasks.json format
     "version": "0.1.0",
     "command": "tsc",
     "isShellCommand": true,
     "args": ["-p", "."],
     "showOutput": "silent",
     "problemMatcher": "$tsc"
    } 
    ```
3. run build task
  - Open the 'command pallete' (<Ctlr+P>)
  - enter 'build' ( select 'Run Build Task' if not selected)
  - type `Enter`


4. ads launch.json file
  ```json
  // [TODO] proposer un boiler plate à utiliser par défaut
  {
      "version": "0.2.0",
      "configurations": [
          {
              "name": "Launch",
              "type": "node",
              "request": "launch",
              "program": "${workspaceRoot}/app.ts",
              "stopOnEntry": false,
              "args": [],
              "cwd": "${workspaceRoot}",
              "preLaunchTask": null,
              "runtimeExecutable": null,
              "runtimeArgs": [
                  "--nolazy"
              ],
              "env": {
                  "NODE_ENV": "development"
              },
              "externalConsole": false,
              "sourceMaps": true,
              "outDir": "${workspaceRoot}"      // directory containing transpiled javascript
          },
          {
              "name": "Attach",
              "type": "node",
              "request": "attach",
              "port": 5858,
              "address": "localhost",
              "restart": false,
              "sourceMaps": false,
              "outDir": null,
              "localRoot": "${workspaceRoot}",
              "remoteRoot": null
          }
      ]
  }
  ```
5. checks errors and warnings 
  - open the 'Error list window' (Ctrl+P+!)

6. create a test task with gulp and mocha 
[TODO] 
  * only the **test task** can be lanched with <Ctrl+Shift+T>
  * to be a test task, it must:
    + in tasks.json
      + be named 'test' 
      + or have the 'isTestCommand' property
    + or in gulp.js
      + be named 'test'

  # install mocha: npm install --save-dev mocha
  # Create your mocha tests in .\test\*.js (i.e. test.js)
  # Create your test task in your gulpfile.js (sample test task below)
    ```js
    gulp.task('test', function (callback) {
      exec('./node_modules/mocha/bin/mocha ./test', function (err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
        callback(err);
      });
    });
    ```
  # Run your test task CTRL+SHIFT+T 

7. run app

### gulp/sass watch setup
[TODO] 
  - Créer un boilerplate unique avec un setup standard (gulpd, webpack, sass, jade, ...)

1. install gulp and gulp-sass
  $ npm install gulp gulp-sass
2. create a gulpfile

  ```js
  // in <project-folder>/gulpfile.js
  // Sass configuration
  var gulp = require('gulp');
  var sass = require('gulp-sass');

  gulp.task('sass', function() {
      gulp.src('*.scss')
          .pipe(sass())
          .pipe(gulp.dest(function(f) {
              return f.base;
          }))
  });

  gulp.task('default', ['sass'], function() {
      gulp.watch('*.scss', ['sass']);
  })
  ```
3. create build task
  ```json
  // in <path/to/project/folde>/.vscode/tasks.json
  {
      "version": "0.1.0",
      "command": "gulp",
      "isShellCommand": true,
      "tasks": [
          {
              "taskName": "default",
              "isBuildCommand": true,
              "showOutput": "always",
              "isWatching": true
          }
      ]
  }
  ```
4. Run the build task
  # As there's only one task, we can execute via 'Run Build Task'
  > 'Ctlr+P' > build > select 'Run Build Task' > Enter
  # or simply <Ctrl+Shift+B> 


### configure ESLint

  $ npm install eslint
  # Install the VS Code extension
  > <Ctrl+P> ext install eslint
  # restart VS Code when prompted
  # create a '.eslintrc.json' file
    ```json
    Sample .eslintrc.json

    {
        "env": {
            "es6": true,
            "node": true,
            "browser": true
        },
        "extends": "eslint:recommended"
    }
    ```
  # (optional) disable VS Code's default JS validation in user settings and specify "javascript.validate.enable": false

extensions
----------
### how to install?
  > <ctrl+P> 
  > type 'ext install' + <enter>
  > type <extension-name> or <arrows>
  > select extension
  > <enter>
  > click <restart>

### how to update ?
[TODO]

### extensions installed
#### [amvim](https://github.com/aioutecism/amVim-for-VSCode)
vim emulator
**note**
  - no ':' command mode
  - no visual block mode
  - no custom keybindings

#### [Document This](https://marketplace.visualstudio.com/items?itemName=joelday.docthis)
Automatically generates detailed JSDoc comments in TypeScript and JavaScript files.

Commands              | Action                      | Descriptiion
Ctrl+Alt+D Ctrl+Alt+D | Document This               | Generates documentation for whatever the caret is on or inside of.
Ctrl+Alt+D Ctrl+Alt+E | Document Everything         | Generates documentation for all symbols that are supported by the extension.
Ctrl+Alt+D Ctrl+Alt+V | Document Everything Visible | Generates documentation for exported, public and protected symbols in the document.


#### [JavaScriptSnippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)
javascript ES6 snippets

prefix | snippet
----   | ----
imp    | import [_] from '[module]';
imd    | import { [_] } from '[module]';
ime    | import * as [alias] from '[module]';
ima    | import {[originalName] as [alias] } from '[module]';
enf    | export const [functionName] = ([params]) =>  { [_] };
edf    | export default (params) =>  { [_] };
ecl    | export default class [className] { [_] };
ece    | export default class [className] extends [baseclassName] { [_] };
con    | constructor([params]) { [_] };
met    | [methodName]([params]) { [ ] };
pge    | get [propertyName]() { return this.[_];}
pse    | set [propertyName]([value]) { [_]; }
fre    | [array].forEach([currentItem] => { [_]})
fof    | (let [item] of [object]) {[_]}
fin    | (let [item] in [object]) {[_]}
afn    | ([params]) => {[_]}
nfn    | const [name] = ([params]) => { [_] }
dob    | const {[propertyName]} = objectToDestruct
dar    | const [[propertyName]] = [arrayToDestruct];
sti    | setInterval(() => { [_] }, [intervalInms]);
sto    | setTimeout(() => { [_] }, [delayInms]);
cas    | console.assert(expression, object)
ccl    | console.clear()
cco    | console.count(label)
cdi    | console.dir
cer    | console.error(object)
cgr    | console.group(label)
cge    | console.groupEnd()
clg    | console.log(object)
ctr    | console.trace(object)
cwa    | console.warn

#### join-lines
type <ctrl+j> to join two lines

### extensions to evaluate
[TODO] evaluate following extensions
  - [align](https://marketplace.visualstudio.com/items?itemName=steve8708.Align)
  - [beautify](https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)
  - [bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
  - [chrome debugger](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)
  - [Quotes transformer](https://marketplace.visualstudio.com/items?itemName=vilicvane.es-quotes)
  - [Project Manager](https://marketplace.visualstudio.com/items?itemName=Shan.project-manager)

### custom extensions
  # place extension code in ~/.vscode/extensions
 [HERE] 



experimental
------------
### vscode as git editor
  ```sh
  # we can setup vscode to be our external git editor
  $ git config --global core.editor "code --wait"
  # edit the git config file 
  $ git config --global -e
  # add the following config
  -> [diff]
  ->    tool = default-difftool
  -> [difftool "default-difftool"]
  ->    cmd = code --wait --diff $LOCAL $REMOTE
  ```

