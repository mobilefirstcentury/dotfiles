---- fonts user guide ----
=========================

[TODO]
  - faire fonctionner l'entrée des charactères unicodes dans le terminal: Hold down Crtl and ⇧ Shift and type U2460. Now press ↵ Enter and release Crtl and ⇧ Shift.
  - faire fonctionner l'entrée des charactères unicodes dans VIM 
  - faire fonctionner l'entrée des charactères unicodes dans VIM. cf [this stackoverflow entry](http://stackoverflow.com/questions/602912/how-do-you-echo-a-4-digit-unicode-character-in-bash) 
	- écrire un module privé MFC pour centraliser les opérations courantes sur les fonts: 
			- couvrir tous les use cases décrits plus bas
			- utiliser [scrafboy](http://unicode.scarfboy.com/)
			- utiliser la librairie [fontkit](https://github.com/devongovett/fontkit)
  - tester ces fonts qui permettent d'afficher les glyphs les plus modernes dans le terminal! [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
  - tester [vim-devicons](https://github.com/ryanoasis/vim-devicons) pour le fun!

**TODO**
	- faire une liste de fonts recommandées pour chaque use case
  - regarder de plus près la famille de fonts [noto](https://www.google.com/get/noto) de Google.


tools
----
### online tools
  - [graphemica](http://graphemica.com/): characters online browser
  - [r12a](https://r12a.github.io/apps/conversion/): detailed description of every character
  - [shapematcher online tool](http://shapecatcher.com/unicode/block/Enclosed_Alphanumerics.html): search glyph by drawing it!
  - [fontello](http://fontello.com): build own font containing only used glyphs


### local tools
  - strencoder (see below)
  - xfd (see below) 
  - ttx (see below)

## navigate all unicode characters
  - browser [the unicode table](http://unicode-table.com)
  - view charts from [unicode charts](http://unicode.org/charts/)

convert to and from multiple string formats
-------------------------------------------

### strencoder: 

 strencoder is an internal node package using code from [r12a](https://github.com/r12a/)

#### use
  
  ```
  $ strencoder 'ⓘ'                    // on workstation with 'DejaVu Sans Mono for Powerline' installed the character '\u24D8' isn't recognized 
                                      // and is printed in this rectangle shape instead of a 'circled i'
    --> 
      { 
      codePoints: '24D8',
      decCodePoints: '9432',
      XML: 'ⓘ',
      UTF8: 'E2 93 98',
      UTF16: '24D8',
      hexNCRs: '&#x24D8;',
      decNCRs: '&#9432;',
      pEsc: '%E2%93%98',
      jEsc: '\\u24D8',
      Unicode: 'U+24D8',
      zeroX: '0x24D8',
      CSS: '\\24D8 ' 
      }

  $ strencoder 'ⓘ' | jformat "%{jsEsc}"     
    --> \u24D8                

  $ echo -e $(strencoder 'ⓘ' | jformat "%{jEsc}")
    --> ⓘ
  ```



get the unicode point of a character
--------------------------------------------
  - use strencoder (see above)
  - copy it and paste in the search combo in [unicode-table](http://unicode-table.com/)
  - copy it and paste it in the search combo of [graphemica](http://graphemica.com/%E2%93%98)


print a unicode point 
---------------------
**note** of course it won't print properly if isn't supported by the current font ...

  - echo -e '\u248D'
  - use [r12a online tool](https://r12a.github.io/apps/conversion/)


explore glyphs presents in a font
---------------------------------
[TODO]
	- créer outil local pour afficher tous les glyphs d'une font:  utiliser la librairie [fontkit](https://github.com/devongovett/fontkit)

### online tool

	- [CharacterMap](https://bluejamesbond.github.io/CharacterMap/)

### cli
 $ xfd -fa "DejaVu Sans Mono for Powerline"                         // browser visual glyphs present in the font
 $ ttx -t cmap DejaVu\ Sans\ Mono\ for\ Powerline.ttf               // generates an XML file containting the list of code points present in the font
                                                                    // installed by [fonttools](https://github.com/behdad/fonttools/tree/master/Tools)

### lib
 
 - [CharacterMap](https://bluejamesbond.github.io/CharacterMap/)
 - [ttf.js web app](http://ynakajima.github.io/ttf.js/demo/glyflist/index.html)



find which font contains a character
-------------------------------------
### web fonts
	- use [glyphsearch](http://glyphsearch.com/)
  
### all fonts
	- use [scrafboy](http://unicode.scarfboy.com/)


Does this font contain this character ?
---------------------------------------

### with mfcfonts
[TODO]
	- utiliser la librairie mfcfonts quand elle sera prête.

### ttx method
	1. ttx -t cmap dejavu\ sans\ mono\ for\ powerline.ttf  
	2. grep the generated ttx file to find wanted unicode code point




recognize visually a unicode character
-------------------------------------

  - use [shapematcher online tool](http://shapecatcher.com/unicode/block/Enclosed_Alphanumerics.html) 
    1. Draw
      + mouse line drawing: 
        1. Hold<LeftClick> 
        2. draw the line
        3. release the <LeftClick>
      + touch line drawing: 
        1. draw the line 
        2. <LeftClick> to end line draw
    2. click 'recognize'
    3. click on the appropriate glyph to have details
    4. if the glyph isn't found, select a resembling glyph and click on it's 'in Block' link to explore siblings glyphs






