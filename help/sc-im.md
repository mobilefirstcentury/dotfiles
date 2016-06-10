---- SC-IM SpreadSheet Help ----
=================================

SC-IM has the following modes:
NORMAL MODE      For navigation and common commands
INSERT MODE      For entering new cell content (values and expressions)
                 Submodes: = < > \
EDIT MODE        'e' and 'E' keys are used for entering this mode. It is used for single
                 line -Vi-like- edition of cell content and expressions
COMMAND MODE     ':' key is used for entering this mode. It is used for entering special
                 commands and for quiting app and saving files.
VISUAL MODE      'v' key is used for entering this mode. It is used for selecting a range of cells
                 You can also use <C-v> in INSERT and COMMAND MODE for entering this mode.
                 See the section 'Selecting a range' below.
---------------- 

&NORMAL MODE&

Navigation commands:
     j k l h     Move cursor down, up, right or left
     ^           Up to row 0 of the current column.
     #           Down to the last valid row of the current column.
     0           Back to column A.
     $           Forward to the last valid column of the current row.
     b           Back to the previous valid cell.
     w           Forward to the next valid cell.
     'c          Go to cell or select range marked previously as c. See the m command for details.
     gab24       Go to AB24 cell (no need to press ENTER).
     g0          moves to first visible column of screen.
     g$          moves to last visible column of screen.
     gM          moves to the middle column shown in screen.
     H           Go to first row seen on screen.
     L           Go to last row seen on screen.
     M           Go to middle row seen on screen.
     gg  , c-a:  Go to home (first cell of spreadsheet).
     G           Go to last valid cell of spreadsheet.
     gG          Go to last valid cell of spreadsheet.
     c-f , c-b:  Scrolls down and up full screen.
                 set variable half_page_scroll to 1 to scroll half page,
                 instead of full page. see :set command for details.
     c-e , c-y:  Scrolls down and up a line.
     zh          Scrolls left one column.
     zl          Scrolls right one column.
     zH          Scrolls left half page.
                 set variable half_page_scroll to '1' to scroll half a page, and set it to '0' to scroll a full page
     zL          Scrolls right half page.
                 set variable half_page_scroll to '1' to scroll half a page, and set it to '0' to scroll a full page
     zz          Scrolls up or down, until the selected cell shows up vertically in the center of screen.
     zt          Scrolls up or down, until the selected cell shows up vertically in the top of screen.
     zb          Scrolls up or down, until the selected cell shows up vertically in the bottom of screen.
     zm          Scrolls left or right, until the selected cell shows up in center of screen.
     Vir         Selects inner range


Commands for handling cell content:
     x , dd      Deletes the current selected cell or range and save its content in yankbuffer
     m           Followed by any lowercase letter, marks the current cell or the selected range with that letter.
                 NOTE: When a mark is changed, all ranges that use that mark are deleted.
     c           Followed by a lowercase letter that represents a mark, this command copies a marked cell or range
                 to the current position, adjusting row and column references in its numeric or string expression, if any.
     R           Followed by two lowercase letters that represent marks of cell, creates a range using those marks and selects it.
                 NOTE: If a range already exists, its replaced with new values.
     { } |       align the content of a cell to the left, right or to center. if a range is selected,
                 every cell of the range gets aligned.

     f+ , fk , f-UP:         Change cell format: Increase decimal precision.
     f- , fj , f-DOWN:       Change cell format: Decrease decimal precision.
     f< , fh , f-LEFT:       Change cell format: Decrease column width.
     f> , fl , f-RIGHT:      Change cell format: Incrementa column width.
     ir          inserts a row
     ic          inserts a column
     sk          shifts up current cell or current range
     sj          shifts down current cell or current range
     sh          shifts left current cell or current range
     sl          shifts right current cell or current range

     yy          yanks selected cell
     y           if a range is selected, it yanks the selected range
     yr          yanks current row
     yc          yanks current column

     p           pastes previous yanked cell/s or range
                 if yr was used to yank a row, 'p' creates a new row below, and paste content there.
                 if yc was used to yank a column, 'p' creates a new col at the left of curcol, and paste content there.
     Pf          works like p command except that only cell formatting information is merged in, leaving the actual data untouched.
     Pv          works like p command except that only cell values are copied, leaving cell format intact.
     Pc          works like p command except that all cell references are adjusted in the same way that they are for the copy command.

     t           same as 'p' command but if yr was used to yank a row, it creates a new row above, and paste content there.
                 if yc was used to yank a column, this command creates a new col at the right, and paste there.
     Tf          works like t command except that only cell formatting information is merged in, leaving the actual data untouched.
     Tv          works like t command except that only cell values are copied, leaving cell format intact.
     Tc          works like t command except that all cell references are adjusted in the same way that they are for the copy command.


     dr          deletes row under the cursor
     dc          deletes column under the cursor
     .           repeats last command
     -           decrease a numeric value of a cell or range
     +           increase a numeric value of a cell or range

     u           UNDO last change
     c-f         REDO last change
                 NOTE: Events implemented for undo / redo:
                 1. delete of cell or range content
                 2. cell input
                 3. cell edition
                 4. cell or range change in alignment
                 5. paste of a cell or range
                 6. range or cell shift with sh sj sk sl
                 7. insert row or column
                 8. delete of a row or column
                 9. paste of a row or column
                 10. zap(hide) / show a row or column
                 11. order of a range
                 12. change in the format of a range or cell
                 13. '-' and '+' commands in normal mode
                 14. lock and unlock of cells
                 15. datefmt command
                 16. cellcolor command

     c-d         converts text content of a selected cell or range to a date, using default LOCALE's D_FMT format.
                 This converts text content to a numeric value that can shown as a date. See DATE INPUT below for more info.
                 NOTE: USELOCALE has to be enabled during build.

     aa          auto resize selected column/s to fit its contents.


 Other commands:
     ^L          Redraw the screen
     Zr          zap (hide) current row
     Zc          zap (hide) current column
     Sr          if a range is selected, it shows the rows hidden inside the range
     Sc          if a range is selected, it shows the cols hidden inside the range
     '/'         is an alias for ':int goto '.
                 If a number is given, SC-IM will search for a cell containing that number. Searches for either strings or numbers proceed forward from the current cell, wrapping back to a0 at the end of the table, and terminate at the current cell if the string or number is not found.
                 Ex.: You can type '/4' to look for cells that has the value of 4.
                 Or you can type '/value' to look for cells that has "value" as label content.
                 You can also quote a regular expression, and SC-IM will search for a cell containing a string matching the regular expression.
                 You can also search formatted numbers or expressions using regular expressions by preceding the opening quotes of the regular expression with a '#' (for formatted numbers) or a '%' (for expressions).
                 These are handy for searching for dates within a specified range or cells which reference a given cell, for example, although they are somewhat slower than searching through ordinary strings, since all numbers must be formatted or expressions decompiled on the fly during the search.

     rl          Use this command to lock the current cell or a range of cells, i.e. make them immune to any type of editing. A locked cell can't be changed in any way until it is unlocked.
     ru          This command is the opposite of the rl command and thus unlocks a locked cell and makes it editable.
     rv          valueize area: remove expressions from the affected range leaving only the values.
     c-j         auto resize column width to fit its contents.


 &INSERT MODE&
     =           Enter a numeric constant or expression.
     <           Enter a left justified string or string expression.
     \\          Enter a centered label.
     >           Enter a right justified string or string expression.
     <TAB>       in insert mode, goes back to edit mode
     <LEFT>, <RIGHT>
                 Cursor movement with arrows keys
     Keys <ENTER>
                 Input of numbers, letters and operators
     <BS>, <DELETE>
                 Delete the chars after or before cursor
     <ESC>       Goes back to NORMAL MODE
     c-r {char}  Being {char} a mark of a cell or range, the range represented by that char gets inserted in the command line
     c-v         Starts VISUAL MODE. See C-o and C-k commands in VISUAL MODE.


 &EDIT MODE&
     e           in normal mode, enters edit mode for editing numeric value of a cell
     E           in normal mode, enters edit mode for editing text value of a cell
     h           moves a char left
     l           moves a char right
     w           moves to beginning of next wor d
     e           if in end of a word, moves to end of next word. otherwise, moves to end of word under the cursor
     b           if in beginning of a word, moves to beginning of previous word. otherwise, moves to beginning of word under the cursor
     0           moves to bol
     $           moves to eol
     f{char}     moves to next occurrence of {char} to the right
     r{char}     replaces char under the cursor with {char}
     R{word}     Each character you type replaces an existing character, starting with the character under the cursor.
                 ESC key or ENTER key must be pressed when finished typing the new word.

     de          deletes until end of word
     dw          deletes until beginning of next word
     db          if in beginning of a word, deletes until beginning of previous word. otherwise, deletes until beginning of word under the cursor
     daw         deletes word under the cursor
     dE          deletes until end of WORD
     dW          deletes until beginning of next WORD
     dB          if in beginning of a word, deletes until beginning of previous WORD. otherwise, deletes until beginning of WORD under the cursor
     daW         deletes WORD under the cursor
     dl          deletes char under the cursor
     d<RIGHT>    deletes char under the cursor
     dh          deletes char before the cursor
     d<LEFT>     deletes char before the cursor

     ce          same as de but then enters insert mode
     cw          same as dw but then enters insert mode
     cb          same as db but then enters insert mode
     caw         same as daw but then enters insert mode
     cE          same as dE but then enters insert mode
     cW          same as dW but then enters insert mode
     cB          same as dB but then enters insert mode
     caW         same as daW but then enters insert mode
     cl          same as dl but then enters insert mode
     c<RIGHT>    same as d<RIGHT> but then enters insert mode
     ch          same as dh but then enters insert mode
     c<LEFT>     same as d<LEFT> but then enters insert mode

     x           deletes char under the cursor
     X           deletes char before the cursor
     i or =      goes back to insert mode
     a           appends a char after the cursor
     s           deletes a char under the cursor and enters insert mode
     A           append at eol
     I           append at bol
     D           deletes entire line
     <SPACE>     adds a space under the cursor
     <ENTER>     confirm changes


 &COMMAND MODE&
     <LEFT>, <RIGHT>
                 moves cursor position with arrow keys
     <ENTER>
                 confirm a command

     <DELETE>, <BS>
                 deletes char under the cursor or before cursor position

     <HOME>, <END>
                 moves cursor to beginning of line or end of line

     <TAB>       completes a command that begins with the text already entered in the command line

     <C-w>, <C-b>
                 moves forward or backwards a word

     <C-f>
                 current cell format (if exists) gets pasted in commandline.

     <C-v>       Starts VISUAL MODE. See C-o and C-k commands in VISUAL MODE.

     :w          saves current spreadsheet
     :w foo      save current spreadsheet with 'foo' filename
     :w! foo     save current spreadsheet with 'foo' filename, forcing rewrite if 'foo' file already exists

     :h          show this help
     :help       show this help

     :q          quit
     :quit       same as the previous
     :q!         quit ignoring changes since last save
     :quit!      same as the previous

     :load name.sc
                 load file called 'name.sc' into SC-IM database
     :load! name.sc
                 same as previous, but ignoring changes done over the current loaded spreadsheet.

     :x          saves current spreadsheet and quit app

     :x foo      saves current spreadsheet with 'foo' filename, and quit app

     :x! foo     same as previous, but if 'foo' file already exists, it gets overwritten

     :e csv      export current spreadsheet to csv format.
                 the name of the file that is created comes from the current open spreadsheet.
                 if a range is selected, only the that range is exported.

     :e tab      export current spreadsheet to tab delimited file.
                 the name of the file that is created comes from the current open spreadsheet.
                 if a range is selected, only the that range is exported.

     :e csv name 
                 export current spreadsheet to csv file. 'name' is the name of the file to be generated

     :e! csv name
                 same as previous, but forcing the rewrite of file 'name' if it exists

     :e tab name
                 export current spreadsheet to tab delimited file. 'name' is the name of the file to be generated

     :e! tab name
                 same as previous, but forcing the rewrite of file 'name' if it exists.
                 NOTE: if a range is selected, its content are exported. if not, the entire spreadsheet is exported

     :i csv name
                 import a csv delimited file called 'name' to SC-IM.

     :i tab name
                 import a tab delimited file called 'name' to SC-IM.

     :i xls name
                 import a xls file called 'name' to SC-IM.

     :i xlsx name
                 import a xlsx file called 'name' to SC-IM.
                 You can set xlsx_readformulas variable and SC-IM will try to import formulas,
                 rather than the final values of a cell.

     :i! xlsx name
                 same as previous, but ignoring changes since last save.

     :version    shows SC-IM version number

     :refresh    refreshes UI. acts just like C-l command of NORMAL_MODE.

     :set        changes a configuration parameter in the format of key value.
                 example:    :set half_page_scroll=0 other_key=its_value
                 if no key is specified, shows all configuration variables and its values.

     :showmaps   shows all mappings

     :nmap "string1" "string2"
                 Map the key sequence string1 to string2. This mapping takes effect only in NORMAL_MODE.
                 ex. :nmap "H" ":h<cr>"

     :imap "string1" "string2"
                 Map the key sequence string1 to string2. This mapping takes effect only in INSERT_MODE.
                 ex. :imap "<C-f>" "format"

     :nnoremap "string1" "string2"
                 this is the non recursive version of nmap. See NOTES on MAPPING below

     :inoremap "string1" "string2"
                 this is the non recursive version of imap. See NOTES on MAPPING below

     :nunmap "string1"
                 the map sequence string1 that takes effect on NORMAL_MODE is removed

     :iunmap "string1"
           the map sequence string1 that takes effect on INSERT_MODE is removed

     :format "string"
           sets current cell format (or cells format of a selected range).
           string parameter contains the format to use to convert the number,
           and can be one or more of these:

           #    Digit placeholder.  If the number has fewer digits on either
                side of the decimal point than  there are '#' characters in
                the format, the extra '#' characters are ignored.  The number
                is rounded to the number of digit placeholders as there are
                to the right of the decimal point.  If there are more digits
                in the number than there are digit placeholders on the left
                side of the decimal point, then those digits are displayed.

           0    Digit placeholder.  Same as for '#' except that the number
                is padded with zeroes on either side of the decimal point.
                The number of zeroes used in padding is determined by the
                number of digit placeholders after the '0' for digits on
                the left side of the decimal point and by the number of
                digit placeholders before the '0' for digits on the right
                side of the decimal point.

           .    Decimal point.  Determines how many digits are placed on
                the right and left sides of the decimal point in the number.
                Note that numbers smaller than 1 will begin with a decimal
                point if the left side of the decimal point contains only
                a '#' digit placeholder.  Use a '0' placeholder to get a
                leading zero in decimal formats.

           %    Percentage.  For each '%' character in the format, the actual
                number gets multiplied by 100 (only for purposes of formatting
                -- the original number is left unmodified) and the '%' character
                is placed in the same position as it is in the format.

           ,    Thousands separator.  The presence of a ',' in the format
                (multiple commas are treated as one) will cause the number
                to be formatted with a ',' separating each set of three digits
                in the integer part of the number with numbering beginning
                from the right end of the integer.

           d    its used to specify a date format that is applied to the numeric
                value of a cell. (See also the DATE INPUT section below)
                Date format strings are identified by the presence of a 'd'
                in the first position. If this is present, the
                remainder of the string is passed to the strftime() function,
                and therefore uses the same conversion specifiers as strftime().
                For more information on conversion specifiers for date format
                strings, see the man page for strftime(3).

           E- E+ e- e+
                Scientific format.  Causes the number to formatted in scientific
                notation. The case of the 'E' or 'e' given is preserved. If
                the format uses a '+', then the sign is always given for the
                exponent value. If the format uses a '-', then the sign is
                only given when the exponent value is negative. Note that if
                there is no digit placeholder following the '+' or '-', then
                that part of the formatted number is left out. In general,
                there should be one or more digit placeholders after the '+'
                or '-'.

           examples:     :format "###,###,000"
                         :format "d%d/%m/%Y"
                         :format "####.####E+3"


    :datefmt string   See DATE INPUT section below


    :sort range string
                sort a range of cells with a given criteria.
                The rows in the specified range will be sorted according
                to a criteria given in the form of a string of characters.
                This string, enclosed in double quotes, may comprise a
                single criterion or multiple criteria in decreasing order
                of precedence. Each criterion has three parts, all of which are mandatory.
                The first part is a single character, which must be either + or - , which specifies
                whether the sort should be done in ascending or descending order, respectively.
                The second part, which is also a single character, must be either # or $ ,
                and is used to specify whether the sort should be based
                on the numeric portion or the string portion, respectively,
                of the cells being used for the comparison.
                The third part may be either one or two characters, and
                must be alphabetic (case insensitive), and specifies
                the column to be used when making the comparisons.
                This column must be in the range being sorted.
                Any number of criteria may be concatenated using ';', and will be used
                in the order specified.

                examples:        :sort C10:E13 "+#D"
                                 :sort C10:E13 "+#C;-#D"

    :sort string
                save as the previous but sort is done over a selected range



    :addfilter
    :filteron
    :filteroff
    :delfilter
    :delfilters
                These commands are used to filter a range of rows by multiple criteria.

                To apply a filter over a range first is neccesary to add a filter criteria.
                To define a criteria you have to use the addfilter command, with this format:

                The first part, is a single character, which must be either # or $, and is used to specify whether the expression evaluates
                over the numeric portion or the string portion of the cell, respectively,",
                The second part is a column name where its values are evaluated with an expression.
                The third part is actually the expression used for the evalutation.
                Multiple criteria can be specified separating them with the ';' character.

                These are some examples:
                            :addfilter "#B<8000"
                            :addfilter "#C>1500"
                            :addfilter "@eqs(@substr($B,1,3),'SEP')"
                            :addfilter "#B>3000;#B<5000;#B>@avg(B1:B20)"

                Once filters are added, you can see the details of each filter with :showfilters special command.
                Each filter is preceded by a number. You can delete a filter typing :delfilter NUMBER. In this
                example, the first filter defined is removed:
                            :delfilter 0

                To delete all defined filters, it can be used the :delfilters special command.

                You can apply those filters to a range with the :filteron special command.
                Ex.:        :filteron B10:C13

                If a range is already selected you can simply type :filteron

                To turn off the filters you can type:
                            :filteroff


    :int string
                sends a command to the interpreter
                example:          :int goto B2


    :hidecol C  
                hide column C

    :hiderow 4 
                hide row 4

    :showcol C 
                show column C that was previously hidden

    :showrow 5
                show row 5 that was previously hidden

    :hidecol A:C
                hide a range of columns

    :hiderow 4:8
                hide a range of rows

    :showcol A:C
                show a range of columns that were previously hidden

    :showrow 5:7
                show a range of rows that were previously hidden

    :showrows  
                if a range is selected, this command shows the rows hidden that are covered by the range


    :hiddenrows
                show details of hidden rows

    :hiddencols
                show details of hidden cols

    :color <str>
                changes a color definition.
                example of use:  :color "type=HEADINGS bold=0 fg=BLACK bg=YELLOW"
                color parameters have to be one of the following:
                     type, fg, bg, bold, dim, reverse, standout, underline, blink.
                the first three are mandatory
                type has to be one of the following:
                     HEADINGS, MODE, NUMB, STRG, DATEF, EXPRESSION, CELL_ERROR,
                     CELL_NEGATIVE, CELL_SELECTION, CELL_SELECTION_SC,
                     INFO_MSG, ERROR_MSG, CELL_ID, CELL_FORMAT,
                     CELL_CONTENT, WELCOME, NORMAL, INPUT.
                fg and bg have to be one of the following: WHITE, BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN.
                other parameters are booleans and its values have to be 1 or 0.
                Instead of modifing a color at runtime, colors can be specified in:
                     a. the .scimrc file stored in your $HOME variable
                     b. in current .sc file.
                The format is similar:
                Ex.        :color "type=HEADINGS fg=BLACK bg=YELLOW bold=0"

    :cellcolor <str>
                changes the color of a cell or a group of cells.
                Ex.:       :cellcolor "bg=CYAN fg=WHITE"
                           :cellcolor "fg=RED bold=1 underline=1"

    :lock       Use this command to lock the current cell or a range of cells, i.e. make them immune to any type of editing. A locked cell can't be changed in any way until it is unlocked.

    :unlock     This command is the opposite of the :lock command and thus unlocks a locked cell and makes it editable.

    :valueize   valueize area: remove expressions from the affected range leaving only the values.

    :! cmd      executes command 'cmd' in shell

    :autojus A:D
                auto resize columns A to D, to fit its contents.

    :autojus    same as previous command, but the columns resized are the columns represented by the selected cell or range.

    c-r {char}  Being {char} a mark of a cell or range, the range represented by that char gets inserted in the command line

    commandline history is stored in $HOME/.sciminfo
    c-p         goes back in command line history
    c-n         goes forward in command line history
    <UP>        goes back in command line history
    <DOWN>      goes forward in command line history



 &VISUAL MODE& - Selecting a range
    This mode is used for selecting a range of cells to do an operation.
    You can enter this mode using the 'v' command in NORMAL_MODE or using <C-v> in INSERT and COMMAND mode.
    When entering to this mode using the 'v' command, top left limit of the selected range, and the bottom right limit
    is set to current row and column.

    If you use <C-v> to enter this mode, you can move the cursor with arrow keys or hjkl keys, and then press <C-o> to begin selection.
    Once your selection is done, you can press <C-k> and the range will be entered in inputline.

    The following movements commands helps to complete a selection in different ways.
    j k l h     Move cursor down, up, right or left
    0           Moves to column A
    $           Moves forward to the last valid column of the current row.
    #           Moves down to the last valid row of the current column.
    ^           Moves up to row 0 of the current column.
    'a          Moves to cell or select range marked previously as c.
                See the m command for details.
    c-f c-b     Increase selection down or up a full screen.
                set variable half_page_scroll to 1 to scroll half a page, instead of full page. see :set command for details.
    c-a         Moves to first cell of spreadsheet.

    y           yanks selected cell or range and exit VISUAL MODE.
    x , dd      Deletes the current range and save its content in yankbuffer
    H           Moves to to first row seen on screen.
    L           Moves to last row seen on screen.
    M           Moves to middle row seen on screen.
    w           Moves forward to the next valid cell.
    b           Moves back to the previous valid cell.
    G           Moves to last valid cell of spreadsheet.

    :           Enters COMMAND MODE preserving the range selection, so a special command can be entered.
    Zr          Zaps (hides) the rows covered by the selected range.
    Zc          Zaps (hides) the columns covered by the selected range.
    Sr          Shows rows that are hidden and that get covered by the selected range.
    Sc          Shows columns that are hidden and that get covered by the selected range.
    { } |       Aligns the content of the cells covered by the selected range, to right, left or to center.
    rl          Use this command to lock the current cell or a range of cells, i.e. make them immune to any type of editing. A locked cell can't be changed in any way until it is unlocked.
    ru          This command is the opposite of the rl command and thus unlocks a locked cell and makes it editable.
    rv          valueize area: remove expressions from the affected range leaving only the values.
    m           Followed by any lowercase letter, marks the selected range with that letter.
                NOTE: When a mark is changed, all ranges that use that mark are deleted.
    c-d         converts text content of the selected range to a date, using default LOCALE's D_FMT format.
                This converts text content to a numeric value that can shown as a date. See DATE INPUT below for more info.
                NOTE: USELOCALE has to be enabled during build.
    c-j         auto resize column width to fit its contents.


&MAPPING&
    mapping can be done in any SC-IM file or in .scimrc file in current home directory.
    maps can be added with nmap and imap commands, and they can be removed with
    nunmap, iunmap commands
    ex.:
        nmap "d" ":h<cr>"  ->   d maps to ':help<cr>' in normal mode
        imap "f" "foo"     ->   f maps to 'foo' string in insert mode

    Some notes:
    Left and Right sequence of a mapping cannot contain numbers.
    <ESC> key cannot be mapped. But other special keys can.
    Those keys are <CR> <C-x> <TAB> <LEFT> <RIGHT> <DOWN> <UP> <DEL> <BS> <HOME> <END> <PGDOWN> <PGUP>
    If a map sequence that exists is re-mapped, it gets replaced with the new one.
    Mapping is recursive by default. The non recursive versions of nmap and imap are
    the nnoremap and inoremap commands. An example of use:
        nmap "a" "b",
        nnoremap "b" "j"
        nmap "j" ":h<cr>"
    with this, 'a' maps to 'j', and only 'j' maps to ':h<cr>'


&COMMAND MULTIPLIER&
    Commands in NORMAL MODE, VISUAL MODE or EDIT MODE can be multiplied if a number is previously typed.
    Ex. '4j' in NORMAL MODE, translates to 4 times 'j'.
    Ex. '4yr' in NORMAL MODE, yanks current row and the 3 rows below it.
    NOTE: the 'x' command in VISUAL MODE and shift commands in VISUAL MODE and NORMAL MODE, when a range is
    selected, cannot be multiplied.


&DATES INPUT&
    Dates are internally stored in SC-IM as numeric values, and they are visually
    seen as dates if a date format is applied to the cells that stores them.
    They can be entered as a label and then use the :datefmt special command to
    convert it to a numeric value and apply a format.
    Other option is to enter the numeric value and apply a format with the
    :format special command.

    The :datefmt command takes the cell's text content that represents a date,
    and uses a given format to set the numeric value of the cell.
    Its format is ':datefmt "format"', being format a strftime compatible one.
    This command then aplies that format to the cell (as it could be done with
    the :format function) so that it can be visually seen as a date.

    example:      :datefmt "%d/%m/%Y"

    C-d command can be used in NORMAL and VISUAL modes, and acts as the datefmt described above,
    but considering locale's D_FMT format.


&Other configuration variables&
    - autocalc
    set variable 'autocalc' to recalculate automatically, or set it to '0' to do it manually upon execution of '@' command

    - numeric
    setting variable 'numeric' to '1', a digit starts a numeric value
    setting the variable to '0', a digit acts as a command multiplier

    - newline_action
    set variable 'newline_action' to 'j' to move cursor down after an entry.
    set it to 'l' to move it right, or set it to '0' to expect no action.

    - external_functions
    disabled by default, set this variable to enable external functions. see @ext function below.

&Built-in Range Functions&
    @sum(r)
    @sum(r,e)
        Sum all valid (nonblank) entries in the region whose two corners are defined by the two variable
        names (e.g.  c5:e14) or the range name specified. The optional second argument is an expression
        which can be used to determine which cells in the range to sum (see above).

    @prod(r)
    @prod(r,e)
        Multiply together all valid (nonblank) entries in the specified region. The optional second argu‐
        ment is an expression which can be used to determine which cells in the range to multiply (see above).

    @avg(r)
    @avg(r,e)
        Average all valid (nonblank) entries in the specified region. The optional second argument is an
        expression which can be used to determine which cells in the range to average (see above).

    @count(r)
    @count(r,e)
        Count all valid (nonblank) entries in the specified region. The optional second argument is an
        expression which can be used to determine which cells in the range to count (see above).

    @max(r)
    @max(r,e)
        Return  the  maximum  value in the specified region.  The optional second argument is an expression
        which can be used to exclude specific cells in the range when determining this maximum  value  (see
        above).  See also the multi argument version of @max below.

    @min(r)
    @min(r,e)
        Return  the  minimum  value in the specified region.  The optional second argument is an expression
        which can be used to exclude specific cells in the range when determining this minimum  value  (see
        above).  See also the multi argument version of @min below.

    @stddev(r)
    @stddev(r,e)
        Return  the  sample  standard  deviation of the cells in the specified region.  The optional second
        argument is an expression which can be used to exclude specific cells in the range when calculating
        the standard deviation (see above).

    @rows(r)
        Return the number of rows in the specified range.

    @cols(r)
        Return the number of columns in the specified range.

&Built-in Numeric Functions&
    @exp(e)
        Return the exponential function of e.

    @ln(e)
        Return the natural logarithm of e.

    @log(e)
        Return the base 10 logarithm of e.

    @floor(e)
        Return the largest integer not greater than e.

    @ceil(e)
        Return the smallest integer not less than e.

    @rnd(e)
        Round e to the nearest integer. default: *.5 will be rounded up to the next integer;

    @round(e,n)
        Round e to n decimal places.  n may be positive to round off the right side of the decimal or nega‐
        tive to round off the left side.  See @rnd(e) above for rounding types.

    @ascii(se)
        Convert string expr (256-base number without digit 0) se to a numeric (10-base nonnegative integer)
        see also @chr

    @abs(e)
    @fabs(e)
        Return the absolute value of e.

    @pow(e1,e2)
        Return e1 raised to the power of e2.

    @hypot(e1,e2)
        Return sqrt(e1∗e1+e2∗e2), taking precautions against unwarranted overflows.

    @pi
        A constant quite close to pi.

    @dtr(e)
        Convert e in degrees to radians.

    @rtd(e)
        Convert e in radians to degrees.

    @sin(e)
    @cos(e)
    @tan(e)
        Return trigonometric functions of radian arguments. The magnitude of the arguments are not checked
        to assure meaningful results.

    @asin(e)
        Return the arc sine of e in the range -pi/2 to pi/2.

    @acos(e)
        Return the arc cosine of e in the range 0 to pi.

    @atan(e)
        Return the arc tangent of e in the range -pi/2 to pi/2.

    @atan2(e1,e2)
        Returns the arc tangent of e1/e2 in the range -pi to pi.

    @max(e1,e2,...)
        Return the maximum of the values of the expressions. Two or more expressions may be specified.
        See also the range version of @max above.

    @min(e1,e2,...)
        Return the minimum of the values of the expressions. Two or more expressions may be specified.
        See also the range version of @min above.

    @ston(se)
        Convert string expression se to a numeric value.

    @nval(se,e)
        Return the numeric value of a cell selected by name. String expression se must evaluate to a
        column  name ("A" - "ZZ") and e must evaluate to a row number (0 - maxrows, by default 65536).
        If se or e is out of bounds, or the cell has no numeric value, the result is 0.
        You can use this for simple table lookups. See also @sval() below.

    @eqs(se1,se2)     Return 1 if string expression se1 has the same value as string expression se2, 0 otherwise.

    @slen(se)
        Returns the length of string expression se.

&String Expressions&
    String expressions are made up of constant strings (characters surrounded by double quotation marks), variables (cell
    names, which refer to the cells's label strings or expressions), and string functions.

    IMPORTANT: PLEASE NOTE THAT STRING EXPRESSIONS ARE ONLY ALLOWED WHEN ENTERING A CELL'S LABEL STRING.
               NOT ITS NUMERIC PART.
               THEY ARE ENTERED WITH A BACKSLASH FOLLOWED BY A DOUBLE QUOTE:
               Ex.:   \"@coltoa(4)
               Ex.:   \"A0 # "Plate"

    Also note that string expression results
    may be left or right flushed or centered, according to the type of the cell's string label.

    #      Concatenate strings.  For example, the string expression

               A0 # "zy dog"

           displays the string ``the lazy dog'' in the cell if the value of A0's string is ``the la''.

&Built-in String Functions&
    @substr(se,e1,e2)
        Extract and return from string expression se the substring indexed by character number  e1  through
        character  number e2 (defaults to the size of se if beyond the end of it).  If e1 is less than 1 or
        greater than e2, the result is the null string.  For example,

        @substr ("River Plate", 4, 8)

        returns the string 'er Pl'.

    @upper(se)
    @lower(se)
        will case the string expression to upper or lower.

    @capital(se)
        will  convert the first letter of words in a string into upper case and other letters to lower case
        (the latter if all letters of the string are upper case).

    @ext(se,e)
        Call an external function (program or script).  The purpose is to allow arbitrary functions on val‐
        ues,  e.g.  table lookups and interpolations.  String expression se is a command or command line to
        call with popen(3).  The value of e is converted to a string and appended to the command line as an
        argument.   The result of @ext() is a string: the first line printed to standard output by the com‐
        mand.  The command should emit exactly one output line.  Additional output, or output  to  standard
        error,  messes  up  the  screen.  @ext() returns a null string and prints an appropriate warning if
        external functions are disabled, se is null, or the attempt to run the command fails.

        External functions can be slow to run, and if enabled are called at each screen update, so they are
        disabled by default. Use the set command to enable it, when you really want them called.

        A simple example:
            @ext ("echo", a1)

            You can use @ston() to convert the @ext() result back to a number.  For example:
            @ston (@ext ("form.sc.ext", a9 + b9))

        Note  that  you  can build a command line (including more argument values) from a string expression
        with concatenation.  You can also "hide" the second argument by  ending  the  command  line  (first
        argument) with `` #'' (shell comment).

    @coltoa(e)
        Returns a string name for a column from the numeric argument.  For example:

            @coltoa(@mycol-1)      @nval(coltoa(@mycol-1), @myrow+1)

    @sval(se,e)
        Return the string value of a cell selected by name.  String expression se must evaluate to a column
        name  (``A''-``AE'')  and e must evaluate to a row number (0-199).  If se or e is out of bounds, or
        the cell has no string value, the result is the null string.

    @set8bit(e)
        Return the string with 8th bit set

    @chr(e)
        Convert numeric (particular 10-base nonnegative integer) to a string (256-base number without digit 0)
        see also @ascii

&Built-in Date and Time Functions&

    @year(e)
        Return the year. Valid years begin with 1970, although many systems will return years prior to
        1970 if e is negative. The last legal year is system dependent.

    @month(e)
        Return the month, encoded as 1 (January) to 12 (December).

    @day(e)
        Return the day of the month, encoded as 1 to 31.

    @hour(e)
        Return the number of hours since midnight, encoded as 0 to 23.

    @minute(e)
        Return the number of minutes since the last full hour, encoded as 0 to 59.

    @second(e)
        Return the number of seconds since the last full minute, encoded as 0 to 59.


&Supported file formats / File import&
    SC-IM can handle the following file formats:
        .sc
        .xls
        .xlsx
        .csv (comma delimited values files)
        .tsv (tab delimited values files)
        .tab (tab delimited values files)
        .txt (simple text files)

    You can pass to SC-IM binary any of the above files.
    If you pass a csv file to SC-IM, the file will be imported using a comma as the delimiter.
    If you pass a tsb or tab file to SC-IM, it will be imported using the tab character as the delimiter.
    If you pass a txt file to SC-IM, it will be imported using a comma as the delimiter.

    Take note that you can always override the delimiter used passing the --txtdelim parameter to SC-IM.
    For instance: ./scim --txtdelim="\t" file.txt
    Possible values are:
        --txtdelim="\t"
        --txtdelim=","
        --txtdelim=";"


&External scripts&

    SC-IM can read data from a external script, either throw pipeline or redirection.
    This enables SC-IM to be used as a non-interactive calculator.
    It also can be run interactive but with no ncurses interface if you set the --nocurses flag.

    You can set the --output parameter if you want results to be saved in a file.
    If you set the --quit_afterload flag, SC-IM will quit after loading all files, but before becoming interactive.

    Suppose you have a file called "script" with the following content:
        let A2=0
        let A3=A2+14
        recalc
        getnum A3

    With the following command, you can send SC-IM that script throw piping, then SC-IM will output to stdout, and then quit:
        cat script | ./scim --nocurses --quit_afterload

    You can also receive data throw piping and output results to a file, with this command:
        cat script | ./scim --quit_afterload --output=return_file

    Other possibilities are:

        - receive data throw piping and continue in non ncurses mode:
        cat script | ./scim --nocurses

        - receive data from a sc file, and output to a file:
        ./scim a.sc --quit_afterload --output=return_file

        - receive data from both a script (throw piping) and from a sc file, and output to file:
        cat script | ./scim a.sc --quit_afterload --output=return_file

        - start interactive but with no ncurses interface:
        ./scim --nocurses

    Note that if you set the --output parameter, the --nocurses flag is assumed to be true.


--
--