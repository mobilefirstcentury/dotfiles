[Emmet Documentation](/) 
========================


Syntax 
------

### Child: > 

nav>ul>li

  ```html
  <nav>
    <ul>
      <li></li>
    </ul>
  </nav>
  ```

### Sibling: + 

div+p+bq

  ```html
  <div> </div>
  <p></p>
  <blockquote></blockquote>
  ```

### Climb-up: ^ 

div+div>p>span+em^bq

  ```html
  <div></div>
  <div>
     <p>
       <span></span>
       <em></em>
     </p>
     <blockquote></blockquote>
  </div>
  ```

div+div>p>span+em^^bq

  ```html
  <div></div>
  <div>
    <p>
      <span></span>
      <em></em>
    </p>
  </div> 
  <blockquote></blockquote>
  ```

### Grouping: () 

div>(header>ul>li\*2>a)+footer>p
   
  ```html
  <div> 
    <header> 
      <ul> 
        <li>
          <a href=""> </a>
        </li> 
        <li>
          <a href=""> </a>
        </li> 
      </ul> 
    </header> 
    <footer> 
      <p> </p>
    </footer> 
  </div>
  ```

(div>dl>(dt+dd)\*3)+footer>p

  ```html
  <div> 
    <dl> 
      <dt> </dt> 
      <dd> </dd> 
      <dt> </dt> 
      <dd> </dd> 
      <dt> </dt> 
      <dd> </dd> 
    </dl> 
  </div> 
  <footer> 
    <p> </p> 
  </footer>
  ```

### Multiplication: * 

ul>li\*5

  ```html
  <ul> 
    <li> </li> 
    <li> </li> 
    <li> </li> 
    <li> </li> 
    <li> </li> 
  </ul>
  ```

### Item numbering: $ 

ul>li.item$\*5

  ```html
  <ul> 
    <li class="item1"> </li> 
    <li class="item2"> </li> 
    <li class="item3"> </li> 
    <li class="item4"> </li> 
    <li class="item5"> </li> 
  </ul>
  ```

h$[title=item$]{Header $}\*3

  ```html
  <h1 title="item1">Header 1 </h1> 
  <h2 title="item2">Header 2 </h2> 
  <h3 title="item3">Header 3 </h3>
  ```

ul>li.item$$$\*5

  ```html
  <ul> 
    <li class="item001"> </li> 
    <li class="item002"> </li> 
    <li class="item003"> </li> 
    <li class="item004"> </li> 
    <li class="item005"> </li> 
  </ul>
  ```

ul>li.item$@-\*5

  ```html
  <ul> 
    <li class="item5"> </li> 
    <li class="item4"> </li> 
    <li class="item3"> </li> 
    <li class="item2"> </li> 
    <li class="item1"> </li> 
  </ul>
  ```

ul>li.item$@3\*5

  ```html
  <ul> 
    <li class="item3"> </li> 
    <li class="item4"> </li> 
    <li class="item5"> </li> 
    <li class="item6"> </li> 
    <li class="item7"> </li> 
  </ul>
  ```

### ID and CLASS attributes 

 #header

  ```html
  <div id="header"></div>
  ```

.title

  ```html
  <div class="title"></div>
  ```

form#search.wide

  ```html
  <form id="search" class="wide"></form>
  ```

p.class1.class2.class3

  ```html
  <p class="class1 class2 class3"></p>
  ```

### Custom attributes 

p[title="Hello world"]

  ```html
  <p title="Hello world"></p>
  ```

td[rowspan=2 colspan=3 title]

  ```html
  <td rowspan="2" colspan="3" title=""></td>
  ```

[a='value1' b="value2"]

  ```html
  <div a="value1" b="value2"></div>
  ```

### Text: {} 

a{Click me}

  ```html
  <a href="">Click me</a>
  ```

p>{Click }+a{here}+{ to continue}

  ```html
  <p>Click <a href="">here</a> to continue</p>
  ```

### Implicit tag names 

.class

```html
<div class="class"></div>
```

em>.class

  ```html
  <em><span class="class"></span></em>
  ```

ul>.class

  ```html
  <ul>
    <li class="class"></li> 
  </ul>
  ```

table>.row>.col

```html
<table> 
  <tr class="row"> 
    <td class="col"></td>
  </tr> 
</table>
```

HTML 
----

!

```html
<!DOCTYPE html> 
  <html lang="en"> 
    <head> 
      <meta charset="UTF-8" />
      <title>Document </title> 
    </head> 
      <body> </body>
    </html>
```

a

  ```html
  <a href=""></a>
  ```

a:link

  ```html
  <a href="http://"></a>
  ```

a:mail
  ```html
  <a href="mailto:"></a>
  ```

abbr
  ```html
  <abbr title=""></abbr>
  ```

acronym, acr
  ```html
  <acronym title=""></acronym>
  ```

base
  ```html
  <base href="" />
  ```

basefont
  ```html
  <basefont />
  ```

br
  ```html
  <br />
  ```

frame
  ```html
  <frame />
  ```

hr
  ```html
  <hr />
  ```

bdo
```html
<bdo dir=""></bdo>
```

bdo:r
  ```html
  <bdo dir="rtl"></bdo>
  ```

bdo:l
  ```html
  <bdo dir="ltr"></bdo>
  ```

col
  ```html
  <col />
  ```

link
  ```html
  <link rel="stylesheet" href="" />
  ```

link:css

  ```html
  <link rel="stylesheet" href="style.css" />
  ```

link:print
  ```html
  <link rel="stylesheet" href="print.css" media="print" />
  ```

link:favicon
  ```html
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
  ```

link:touch
  ```html
  <link rel="apple-touch-icon" href="favicon.png" />
  ```

link:rss
  ```html
  <link rel="alternate" type="application/rss+xml" title="RSS" href="rss.xml" />
  ```

link:atom
```htlm
<link rel="alternate" type="application/atom+xml" title="Atom" href="atom.xml" />
```

link:import, link:im
  ```html
  <link rel="import" href="component.html" />
  ```

meta
```html
<meta />
```

meta:utf
```html
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
```

meta:win

  ```html
  <meta http-equiv="Content-Type" content="text/html;charset=windows-1251" />
  ```

meta:vp
```html
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
```

meta:compat

  ```html
  <meta http-equiv="X-UA-Compatible" content="IE=7" />
  ```

style

  ```html
  <style></style>
  ```

script

  ```html
  <script></script>
  ```

script:src

  ```html
  <script src=""></script>
  ```

img

  ```html
  <img src="" alt="" />
  ```

img:srcset, img:s

  ```html
  <img srcset="" src="" alt="" />
  ```

img:sizes, img:z

  ```html
  <img sizes="" srcset="" src="" alt="" />
  ```

picture

  ```html
  <picture></picture>
  ```

source, src

  ```html
  <source />
  ```

source:src, src:sc

  ```html
  <source src="" type="" />
  ```

source:srcset, src:s

  ```html
  <source srcset="" />
  ```

source:media, src:m

  ```html
  <source media="(min-width: )" srcset="" />
  ```

source:type, src:t

  ```html
  <source srcset="" type="image/" />
  ```

source:sizes, src:z

  ```html
  <source sizes="" srcset="" />
  ```

source:media:type, src:mt

  ```html
  <source media="(min-width: )" srcset="" type="image/" />
  ```

source:media:sizes, src:mz

  ```html
  <source media="(min-width: )" sizes="" srcset="" />
  ```

source:sizes:type, src:zt

  ```html
  <source sizes="" srcset="" type="image/" />
  ```

iframe

  ```html
  <iframe src="" frameborder="0"></iframe>
  ```

embed

  ```html
  <embed src="" type="" />
  ```

object

  ```html
  <object data="" type=""></object>
  ```

param

  ```html
  <param name="" value="" />
  ```

map

  ```html
  <map name=""></map>
  ```

area

  ```html
  <area shape="" coords="" href="" alt="" />
  ```

area:d

  ```html
  <area shape="default" href="" alt="" />
  ```

area:c

  ```html
  <area shape="circle" coords="" href="" alt="" />
  ```

area:r

  ```html
  <area shape="rect" coords="" href="" alt="" />
  ```

area:p

  ```html
  <area shape="poly" coords="" href="" alt="" />
  ```

form

  ```html
  <form action=""></form>
  ```

form:get

  ```html
  <form action="" method="get"></form>
  ```

form:post

  ```html
  <form action="" method="post"></form>
  ```

label

  ```html
  <label for=""></label>
  ```

input

  ```html
  <input type="text" />
  ```

inp

  ```html
  <input type="text" name="" id="" />
  ```

input:hidden, input:h

  ```html
  <input type="hidden" name="" />
  ```

input:text, input:t

  ```html
  <input type="text" name="" id="" />
  ```

input:search

  ```html
  <input type="search" name="" id="" />
  ```

input:email

  ```html
  <input type="email" name="" id="" />
  ```

input:url

  ```html
  <input type="url" name="" id="" />
  ```

input:password, input:p

  ```html
  <input type="password" name="" id="" />
  ```

input:datetime


  ```html
  <input type="datetime" name="" id="" />
  ```

input:date

  ```html
  <input type="date" name="" id="" />
  ```

input:datetime-local

  ```html
  <input type="datetime-local" name="" id="" />
  ```

input:month


  ```html
  <input type="month" name="" id="" />
  ```

input:week
  ```html
  <input type="week" name="" id="" />
  ```

input:time
  ```html
  <input type="time" name="" id="" />
  ```

input:tel
  ```html
  <input type="tel" name="" id="" />
  ```

input:number
  ```html
  <input type="number" name="" id="" />
  ```

input:color
  ```html
  <input type="color" name="" id="" />
  ```

input:checkbox, input:c
  ```html
  <input type="checkbox" name="" id="" />
  ```

input:radio, input:r
  ```html
  <input type="radio" name="" id="" />
  ```

input:range
  ```html
  <input type="range" name="" id="" />
  ```

input:file, input:f
  ```html
  <input type="file" name="" id="" />
  ```

input:submit, input:s

  ```html
  <input type="submit" value="" />
  ```

input:image, input:i

  ```html
  <input type="image" src="" alt="" />
  ```

input:button, input:b

  ```html
  <input type="button" value="" />
  ```

isindex

  ```html
  <isindex />
  ```

input:reset
  ```html
  <input type="reset" value="" />
  ```

select

  ```html
  <select name="" id=""></select>
  ```

select:disabled, select:d
  ```html
  <select name="" id="" disabled="disabled"></select>
  ```

option, opt

  ```html
  <option value=""></option>
  ```

textarea

  ```html
  <textarea name="" id="" cols="30" rows="10"></textarea>
  ```

marquee

  ```html
  <marquee behavior="" direction=""></marquee>
  ```

menu:context, menu:c
  ```html
  <menu type="context"></menu>
  ```

menu:toolbar, menu:t
  ```html
  <menu type="toolbar"></menu>
  ```

video

  ```html
  <video src=""></video>
  ```

audio

  ```html
  <audio src=""></audio>
  ```

html:xml

  ```html
  <html xmlns="http://www.w3.org/1999/xhtml"></html>
  ```

keygen

  ```html
  <keygen />
  ```

command

  ```html
  <command />
  ```

button:submit, button:s, btn:s
  ```html
  <button type="submit"></button>
  ```

button:reset, button:r, btn:r
  ```html
  <button type="reset"></button>
  ```

button:disabled, button:d, btn:d
  ```html
  <button disabled="disabled"></button>
  ```

fieldset:disabled, fieldset:d, fset:d, fst:d
  ```html
  <fieldset disabled="disabled"></fieldset>
  ```

bq
  ```html
  <blockquote></blockquote>
  ```

fig
  ```html
  <figure></figure>
  ```

figc
  ```html
  <figcaption></figcaption>
  ```

pic
  ```html
  <picture></picture>
  ```

ifr
  ```html
  <iframe src="" frameborder="0"></iframe>
  ```

emb
  ```html
  <embed src="" type="" />
  ```

obj
  ```html
  <object data="" type=""></object>
  ```

cap
  ```html
  <caption></caption>
  ```

colg
  ```html
  <colgroup></colgroup>
  ```

fst, fset
  ```html
  <fieldset></fieldset>
  ```

btn
  ```html
  <button></button>
  ```

optg
  ```html
  <optgroup></optgroup>
  ```

tarea
  ```html
  <textarea name="" id="" cols="30" rows="10"></textarea>
  ```

leg
  ```html
  <legend></legend>
  ```

sect
  ```html
  <section></section>
  ```

art
  ```html
  <article></article>
  ```

hdr
  ```html
  <header></header>
  ```

ftr
  ```html
  <footer></footer>
  ```

adr
  ```html
  <address></address>
  ```

dlg
  ```html
  <dialog></dialog>
  ```

str
  ```html
  <strong></strong>
  ```

prog
  ```html
  <progress></progress>
  ```

mn
  ```html
  <main></main>
  ```

tem
  ```html
  <template></template>
  ```

datag
  ```html
  <datagrid></datagrid>
  ```

datal
  ```html
  <datalist></datalist>
  ```

kg
  ```html
  <keygen />
  ```

out
  ```html
  <output></output>
  ```

det
  ```html
  <details></details>
  ```

cmd
  ```html
  <command />
  ```

doc  

  ```html
  <html> 
    <head> 
      <meta charset="UTF-8" /> 
        <title>Document</title> 
    </head> 
    <body> </body> 
  </html>
  ```

doc4 

  ```html
  <html> 
    <head> 
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> 
      <title>Document</title> 
    </head> 
    <body></body> 
  </html>
  ```

ri:dpr, ri:d

  ```html
  <img srcset="" src="" alt="" />
  ```

ri:viewport, ri:v

  ```html
  <img sizes="" srcset="" src="" alt="" />
  ```

ri:art, ri:a
  ```html
  <picture> 
    <source media="(min-width: )" srcset="" /> 
    <img src="" alt="" /> 
  </picture>
  ```

ri:type, ri:t


  ```html
  <picture>
     <source srcset="" type="image/" /> 
     <img src="" alt="" /> 
  </picture>
  ```

html:4t

  ```html
  <!doctype html public "-//w3c//dtd html 4.01 Transitional//en" "http://www.w3.org/tr/html4/loose.dtd"> 
  <html lang="en"> 
    <head>
      <meta http-equiv="content-type" 
      content="text/html;charset=utf-8" /> 
      <title>document</title> 
    </head> 
    <body> </body>
  </html>
  ```

html:4s
    
  ```html
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
  <html lang="en">
    <head> 
      <meta http-equiv="Content-Type"
      content="text/html;charset=UTF-8" /> <title>Document</title>
    </head> 
    <body> </body> 
  </html>
  ```

html:xt

    ```html
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"> 
      <head> 
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
        <title>Document</title> 
      </head> 
      <body> </body> 
    </html>
    ```

html:xs

  ```html
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
      <head> <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
      <title>Document</title> 
    </head> 
    <body> </body> 
  </html>
```

html:xxs

  ```html
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> 
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"> 
    <head> <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
      <title>Document</title> 
    </head> 
    <body> </body> 
  </html>
  ```

html:5

  ```html
  <!DOCTYPE html> 
  <html lang="en"> 
    <head> <meta charset="UTF-8" /> 
      <title>Document</title> 
    </head> 
    <body> </body>
  </html>
  ```

ol+
  ```html
  <ol> 
    <li></li> 
  </ol>
  ```

ul+
  ```html
  <ul> 
    <li></li> 
  </ul>
  ```

dl+
  ```html
  <dl> 
    <dt></dt> 
    <dd></dd> 
  </dl>
  ```

map+
  ```html
  <map name=""> 
    <area shape="" coords="" href="" alt="" /> 
  </map>
  ```
    

table+
  ```html
  <table> 
    <tr> 
      <td></td> 
    </tr> 
  </table>
  ```

colgroup+, colg+
  ```html
  <colgroup> <col /> </colgroup>
  ```

tr+
  ```html
  <tr> 
    <td></td> 
  </tr>
  ```

select+
  ```html
  <select name="" id=""> 
    <option value=""></option> 
  </select>
  ```

optgroup+, optg+
  ```html
  <optgroup> 
    <option value=""></option> 
  </optgroup>
  ```

pic+

  ```html
  <picture> 
    <source srcset="" /> 
      <img src="" alt="" />
  </picture>
  ```

!!!
  ```html
  <!DOCTYPE html>
  ```

!!!4t
  ```html
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  ```

!!!4s
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```

!!!xt
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```

!!!xs

  ```html
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  ```

!!!xxs

  ```html
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
  ```

c

  ```html
  <!-- ${child} -->
  ```

cc:ie6

  ```html
  <!--[if lte IE 6]> ${child} <![endif]-->
  ```

cc:ie

  ```html
  <!--[if IE]> ${child} <![endif]-->
  ```

cc:noie

  ```html
  <!--[if !IE]><!--> ${child} <!--<![endif]-->
  ```

CSS 
---
**note**
  - CSS module uses fuzzy search to find unknown abbreviations: `ov:h` == `ov-h` == `ovh` == `oh`.
  - If abbreviation wasn’t found, it is transformed into property name: `foo-bar` → `foo-bar:             |;`
  - You can prefix abbreviations with hyphen to produce vendor-prefixed properties: `-foo`

### Visual Formatting 

pos

  ```css
  position:relative;
  ```

pos:s
  ```css
  position:static;
  ```

pos:a

  ```css
  position:absolute;
  ```

pos:r

  ```css
  position:relative;
  ```

pos:f

  ```css
  position:fixed;
  ```

t

  ```css
  top:;
  ```

t:a

  ```css
  top:auto;
  ```

r

  ```css
  right:;
  ```

r:a

  ```css
  right:auto;
  ```

b

  ```css
  bottom:;
  ```

b:a

  ```css
  bottom:auto;
  ```

l

  ```css
  left:;
  ```

l:a

  ```css
  left:auto;
  ```

z

  ```css
  z-index:;
  ```

z:a

  ```css
  z-index:auto;
  ```

fl

  ```css
  float:left;
  ```

fl:n

  ```css
  float:none;
  ```

fl:l

  ```css
  float:left;
  ```

fl:r

  ```css
  float:right;
  ```

cl

  ```css
  clear:both;
  ```

cl:n

  ```css
  clear:none;
  ```

cl:l

  ```css
  clear:left;
  ```

cl:r

  ```css
  clear:right;
  ```

cl:b

  ```css
  clear:both;
  ```

d

  ```css
  display:block;
  ```

d:n

  ```css
  display:none;
  ```

d:b

  ```css
  display:block;
  ```

d:f

  ```css
  display:flex;
  ```

d:if

  ```css
  display:inline-flex;
  ```

d:i

  ```css
  display:inline;
  ```

d:ib

  ```css
  display:inline-block;
  ```

d:li

  ```css
  display:list-item;
  ```

d:ri

  ```css
  display:run-in;
  ```

d:cp

  ```css
  display:compact;
  ```

d:tb

  ```css
  display:table;
  ```

d:itb

  ```css
  display:inline-table;
  ```

d:tbcp

  ```css
  display:table-caption;
  ```

d:tbcl

  ```css
  display:table-column;
  ```

d:tbclg

  ```css
  display:table-column-group;
  ```

d:tbhg

  ```css
  display:table-header-group;
  ```

d:tbfg

  ```css
  display:table-footer-group;
  ```

d:tbr

  ```css
  display:table-row;
  ```

d:tbrg

  ```css
  display:table-row-group;
  ```

d:tbc

  ```css
  display:table-cell;
  ```

d:rb

  ```css
  display:ruby;
  ```

d:rbb

  ```css
  display:ruby-base;
  ```

d:rbbg

  ```css
  display:ruby-base-group;
  ```

d:rbt

  ```css
  display:ruby-text;
  ```

d:rbtg

  ```css
  display:ruby-text-group;
  ```

v

  ```css
  visibility:hidden;
  ```

v:v

  ```css
  visibility:visible;
  ```

v:h

  ```css
  visibility:hidden;
  ```

v:c

  ```css
  visibility:collapse;
  ```

ov

  ```css
  overflow:hidden;
  ```

ov:v

  ```css
  overflow:visible;
  ```

ov:h

  ```css
  overflow:hidden;
  ```

ov:s

  ```css
  overflow:scroll;
  ```

ov:a

  ```css
  overflow:auto;
  ```

ovx

  ```css
  overflow-x:hidden;
  ```

ovx:v

  ```css
  overflow-x:visible;
  ```

ovx:h

  ```css
  overflow-x:hidden;
  ```

ovx:s

  ```css
  overflow-x:scroll;
  ```

ovx:a

  ```css
  overflow-x:auto;
  ```

ovy

  ```css
  overflow-y:hidden;
  ```

ovy:v

  ```css
  overflow-y:visible;
  ```

ovy:h

  ```css
  overflow-y:hidden;
  ```

ovy:s

  ```css
  overflow-y:scroll;
  ```

ovy:a

  ```css
  overflow-y:auto;
  ```

ovs

  ```css
  overflow-style:scrollbar;
  ```

ovs:a

  ```css
  overflow-style:auto;
  ```

ovs:s

  ```css
  overflow-style:scrollbar;
  ```

ovs:p

  ```css
  overflow-style:panner;
  ```

ovs:m

  ```css
  overflow-style:move;
  ```

ovs:mq

  ```css
  overflow-style:marquee;
  ```

zoo, zm

  ```css
  zoom:1;
  ```

cp

  ```css
  clip:;
  ```

cp:a

  ```css
  clip:auto;
  ```

cp:r

  ```css
  clip:rect(top right bottom left);
  ```

rsz

  ```css
  resize:;
  ```

rsz:n

  ```css
  resize:none;
  ```

rsz:b

  ```css
  resize:both;
  ```

rsz:h

  ```css
  resize:horizontal;
  ```

rsz:v

  ```css
  resize:vertical;
  ```

cur

  ```css
  cursor:${pointer};
  ```

cur:a

  ```css
  cursor:auto;
  ```

cur:d

  ```css
  cursor:default;
  ```

cur:c

  ```css
  cursor:crosshair;
  ```

cur:ha

  ```css
  cursor:hand;
  ```

cur:he

  ```css
  cursor:help;
  ```

cur:m

  ```css
  cursor:move;
  ```

cur:p

  ```css
  cursor:pointer;
  ```

cur:t

  ```css
  cursor:text;
  ```

### Margin & Padding 

m

  ```css
  margin:;
  ```

m:a

  ```css
  margin:auto;
  ```

mt

  ```css
  margin-top:;
  ```

mt:a

  ```css
  margin-top:auto;
  ```

mr

  ```css
  margin-right:;
  ```

mr:a

  ```css
  margin-right:auto;
  ```

mb

  ```css
  margin-bottom:;
  ```

mb:a

  ```css
  margin-bottom:auto;
  ```

ml

  ```css
  margin-left:;
  ```

ml:a

  ```css
  margin-left:auto;
  ```

p

  ```css
  padding:;
  ```

pt

  ```css
  padding-top:;
  ```

pr

  ```css
  padding-right:;
  ```

pb

  ```css
  padding-bottom:;
  ```

pl

  ```css
  padding-left:;
  ```

### Box Sizing 

bxz

  ```css
  box-sizing:border-box;
  ```

bxz:cb

  ```css
  box-sizing:content-box;
  ```

bxz:bb

  ```css
  box-sizing:border-box;
  ```

bxsh

  ```css
  box-shadow:inset hoff voff blur color;
  ```

bxsh:r

  ```css
  box-shadow:inset hoff voff blur spread rgb(0, 0, 0);
  ```

bxsh:ra

  ```css
  box-shadow:inset h v blur spread rgba(0, 0, 0, .5);
  ```

bxsh:n

  ```css
  box-shadow:none;
  ```

w

  ```css
  width:;
  ```

w:a

  ```css
  width:auto;
  ```

h

  ```css
  height:;
  ```

h:a

  ```css
  height:auto;
  ```

maw

  ```css
  max-width:;
  ```

maw:n

  ```css
  max-width:none;
  ```

mah

  ```css
  max-height:;
  ```

mah:n

  ```css
  max-height:none;
  ```

miw

  ```css
  min-width:;
  ```

mih

  ```css
  min-height:;
  ```

### Font 

f

  ```css
  font:;
  ```

f+

  ```css
  font:1em Arial,sans-serif;
  ```

fw

  ```css
  font-weight:;
  ```

fw:n

  ```css
  font-weight:normal;
  ```

fw:b

  ```css
  font-weight:bold;
  ```

fw:br

  ```css
  font-weight:bolder;
  ```

fw:lr

  ```css
  font-weight:lighter;
  ```

fs

  ```css
  font-style:${italic};
  ```

fs:n

  ```css
  font-style:normal;
  ```

fs:i

  ```css
  font-style:italic;
  ```

fs:o

  ```css
  font-style:oblique;
  ```

fv

  ```css
  font-variant:;
  ```

fv:n

  ```css
  font-variant:normal;
  ```

fv:sc

  ```css
  font-variant:small-caps;
  ```

fz

  ```css
  font-size:;
  ```

fza

  ```css
  font-size-adjust:;
  ```

fza:n

  ```css
  font-size-adjust:none;
  ```

ff

  ```css
  font-family:;
  ```

ff:s

  ```css
  font-family:serif;
  ```

ff:ss

  ```css
  font-family:sans-serif;
  ```

ff:c

  ```css
  font-family:cursive;
  ```

ff:f

  ```css
  font-family:fantasy;
  ```

ff:m

  ```css
  font-family:monospace;
  ```

ff:a

  ```css
  font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
  ```

ff:t

  ```css
  font-family: "Times New Roman", Times, Baskerville, Georgia, serif;
  ```

ff:v

  ```css
  font-family: Verdana, Geneva, sans-serif;
  ```

fef

  ```css
  font-effect:;
  ```

fef:n

  ```css
  font-effect:none;
  ```

fef:eg

  ```css
  font-effect:engrave;
  ```

fef:eb

  ```css
  font-effect:emboss;
  ```

fef:o

  ```css
  font-effect:outline;
  ```

fem

  ```css
  font-emphasize:;
  ```

femp

  ```css
  font-emphasize-position:;
  ```

femp:b

  ```css
  font-emphasize-position:before;
  ```

femp:a

  ```css
  font-emphasize-position:after;
  ```

fems

  ```css
  font-emphasize-style:;
  ```

fems:n

  ```css
  font-emphasize-style:none;
  ```

fems:ac

  ```css
  font-emphasize-style:accent;
  ```

fems:dt

  ```css
  font-emphasize-style:dot;
  ```

fems:c

  ```css
  font-emphasize-style:circle;
  ```

fems:ds

  ```css
  font-emphasize-style:disc;
  ```

fsm

  ```css
  font-smooth:;
  ```

fsm:a

  ```css
  font-smooth:auto;
  ```

fsm:n

  ```css
  font-smooth:never;
  ```

fsm:aw

  ```css
  font-smooth:always;
  ```

fst

  ```css
  font-stretch:;
  ```

fst:n

  ```css
  font-stretch:normal;
  ```

fst:uc

  ```css
  font-stretch:ultra-condensed;
  ```

fst:ec

  ```css
  font-stretch:extra-condensed;
  ```

fst:c

  ```css
  font-stretch:condensed;
  ```

fst:sc

  ```css
  font-stretch:semi-condensed;
  ```

fst:se

  ```css
  font-stretch:semi-expanded;
  ```

fst:e

  ```css
  font-stretch:expanded;
  ```

fst:ee

  ```css
  font-stretch:extra-expanded;
  ```

fst:ue

  ```css
  font-stretch:ultra-expanded;
  ```

### Text 

va

  ```css
  vertical-align:top;
  ```

va:sup

  ```css
  vertical-align:super;
  ```

va:t

  ```css
  vertical-align:top;
  ```

va:tt

  ```css
  vertical-align:text-top;
  ```

va:m

  ```css
  vertical-align:middle;
  ```

va:bl

  ```css
  vertical-align:baseline;
  ```

va:b

  ```css
  vertical-align:bottom;
  ```

va:tb

  ```css
  vertical-align:text-bottom;
  ```

va:sub

  ```css
  vertical-align:sub;
  ```

ta

  ```css
  text-align:left;
  ```

ta:l

  ```css
  text-align:left;
  ```

ta:c

  ```css
  text-align:center;
  ```

ta:r

  ```css
  text-align:right;
  ```

ta:j

  ```css
  text-align:justify;
  ```

ta-lst

  ```css
  text-align-last:;
  ```

tal:a

  ```css
  text-align-last:auto;
  ```

tal:l

  ```css
  text-align-last:left;
  ```

tal:c

  ```css
  text-align-last:center;
  ```

tal:r

  ```css
  text-align-last:right;
  ```

td

  ```css
  text-decoration:none;
  ```

td:n

  ```css
  text-decoration:none;
  ```

td:u

  ```css
  text-decoration:underline;
  ```

td:o

  ```css
  text-decoration:overline;
  ```

td:l

  ```css
  text-decoration:line-through;
  ```

te

  ```css
  text-emphasis:;
  ```

te:n

  ```css
  text-emphasis:none;
  ```

te:ac

  ```css
  text-emphasis:accent;
  ```

te:dt

  ```css
  text-emphasis:dot;
  ```

te:c

  ```css
  text-emphasis:circle;
  ```

te:ds

  ```css
  text-emphasis:disc;
  ```

te:b

  ```css
  text-emphasis:before;
  ```

te:a

  ```css
  text-emphasis:after;
  ```

th

  ```css
  text-height:;
  ```

th:a

  ```css
  text-height:auto;
  ```

th:f

  ```css
  text-height:font-size;
  ```

th:t

  ```css
  text-height:text-size;
  ```

th:m

  ```css
  text-height:max-size;
  ```

ti

  ```css
  text-indent:;
  ```

ti:-

  ```css
  text-indent:-9999px;
  ```

tj

  ```css
  text-justify:;
  ```

tj:a

  ```css
  text-justify:auto;
  ```

tj:iw

  ```css
  text-justify:inter-word;
  ```

tj:ii

  ```css
  text-justify:inter-ideograph;
  ```

tj:ic

  ```css
  text-justify:inter-cluster;
  ```

tj:d

  ```css
  text-justify:distribute;
  ```

tj:k

  ```css
  text-justify:kashida;
  ```

tj:t

  ```css
  text-justify:tibetan;
  ```

to

  ```css
  text-outline:;
  ```

to+

  ```css
  text-outline:0 0 #000;
  ```

to:n

  ```css
  text-outline:none;
  ```

tr

  ```css
  text-replace:;
  ```

tr:n

  ```css
  text-replace:none;
  ```

tt

  ```css
  text-transform:uppercase;
  ```

tt:n

  ```css
  text-transform:none;
  ```

tt:c

  ```css
  text-transform:capitalize;
  ```

tt:u

  ```css
  text-transform:uppercase;
  ```

tt:l

  ```css
  text-transform:lowercase;
  ```

tw

  ```css
  text-wrap:;
  ```

tw:n

  ```css
  text-wrap:normal;
  ```

tw:no

  ```css
  text-wrap:none;
  ```

tw:u

  ```css
  text-wrap:unrestricted;
  ```

tw:s

  ```css
  text-wrap:suppress;
  ```

tsh

  ```css
  text-shadow:hoff voff blur #000;
  ```

tsh:r

  ```css
  text-shadow:h v blur rgb(0, 0, 0);
  ```

tsh:ra

  ```css
  text-shadow:h v blur rgba(0, 0, 0, .5);
  ```

tsh+

  ```css
  text-shadow:0 0 0 #000;
  ```

tsh:n

  ```css
  text-shadow:none;
  ```

lh

  ```css
  line-height:;
  ```

lts

  ```css
  letter-spacing:;
  ```

lts-n

  ```css
  letter-spacing:normal;
  ```

whs

  ```css
  white-space:;
  ```

whs:n

  ```css
  white-space:normal;
  ```

whs:p

  ```css
  white-space:pre;
  ```

whs:nw

  ```css
  white-space:nowrap;
  ```

whs:pw

  ```css
  white-space:pre-wrap;
  ```

whs:pl

  ```css
  white-space:pre-line;
  ```

whsc

  ```css
  white-space-collapse:;
  ```

whsc:n

  ```css
  white-space-collapse:normal;
  ```

whsc:k

  ```css
  white-space-collapse:keep-all;
  ```

whsc:l

  ```css
  white-space-collapse:loose;
  ```

whsc:bs

  ```css
  white-space-collapse:break-strict;
  ```

whsc:ba

  ```css
  white-space-collapse:break-all;
  ```

wob

  ```css
  word-break:;
  ```

wob:n

  ```css
  word-break:normal;
  ```

wob:k

  ```css
  word-break:keep-all;
  ```

wob:ba

  ```css
  word-break:break-all;
  ```

wos

  ```css
  word-spacing:;
  ```

wow

  ```css
  word-wrap:;
  ```

wow:nm

  ```css
  word-wrap:normal;
  ```

wow:n

  ```css
  word-wrap:none;
  ```

wow:u

  ```css
  word-wrap:unrestricted;
  ```

wow:s

  ```css
  word-wrap:suppress;
  ```

wow:b

  ```css
  word-wrap:break-word;
  ```

### Background 

bg

  ```css
  background:#000;
  ```

bg+

  ```css
  background:#fff url() 0 0 no-repeat;
  ```

bg:n

  ```css
  background:none;
  ```

bgc

  ```css
  background-color:#fff;
  ```

bgc:t

  ```css
  background-color:transparent;
  ```

bgi

  ```css
  background-image:url();
  ```

bgi:n

  ```css
  background-image:none;
  ```

bgr

  ```css
  background-repeat:;
  ```

bgr:n

  ```css
  background-repeat:no-repeat;
  ```

bgr:x

  ```css
  background-repeat:repeat-x;
  ```

bgr:y

  ```css
  background-repeat:repeat-y;
  ```

bgr:sp

  ```css
  background-repeat:space;
  ```

bgr:rd

  ```css
  background-repeat:round;
  ```

bga

  ```css
  background-attachment:;
  ```

bga:f

  ```css
  background-attachment:fixed;
  ```

bga:s

  ```css
  background-attachment:scroll;
  ```

bgp

  ```css
  background-position:0 0;
  ```

bgpx

  ```css
  background-position-x:;
  ```

bgpy

  ```css
  background-position-y:;
  ```

bgbk

  ```css
  background-break:;
  ```

bgbk:bb

  ```css
  background-break:bounding-box;
  ```

bgbk:eb

  ```css
  background-break:each-box;
  ```

bgbk:c

  ```css
  background-break:continuous;
  ```

bgcp

  ```css
  background-clip:padding-box;
  ```

bgcp:bb

  ```css
  background-clip:border-box;
  ```

bgcp:pb

  ```css
  background-clip:padding-box;
  ```

bgcp:cb

  ```css
  background-clip:content-box;
  ```

bgcp:nc

  ```css
  background-clip:no-clip;
  ```

bgo

  ```css
  background-origin:;
  ```

bgo:pb

  ```css
  background-origin:padding-box;
  ```

bgo:bb

  ```css
  background-origin:border-box;
  ```

bgo:cb

  ```css
  background-origin:content-box;
  ```

bgsz

  ```css
  background-size:;
  ```

bgsz:a

  ```css
  background-size:auto;
  ```

bgsz:ct

  ```css
  background-size:contain;
  ```

bgsz:cv

  ```css
  background-size:cover;
  ```

### Color 

c

  ```css
  color:#000;
  ```

c:r

  ```css
  color:rgb(0, 0, 0);
  ```

c:ra

  ```css
  color:rgba(0, 0, 0, .5);
  ```

op

  ```css
  opacity:;
  ```

### Generated content 

cnt

  ```css
  content:'';
  ```

cnt:n, ct:n

  ```css
  content:normal;
  ```

cnt:oq, ct:oq

  ```css
  content:open-quote;
  ```

cnt:noq, ct:noq

  ```css
  content:no-open-quote;
  ```

cnt:cq, ct:cq

  ```css
  content:close-quote;
  ```

cnt:ncq, ct:ncq

  ```css
  content:no-close-quote;
  ```

cnt:a, ct:a

  ```css
  content:attr();
  ```

cnt:c, ct:c

  ```css
  content:counter();
  ```

cnt:cs, ct:cs

  ```css
  content:counters();
  ```

ct

  ```css
  content:;
  ```

q

  ```css
  quotes:;
  ```

q:n

  ```css
  quotes:none;
  ```

q:ru

  ```css
  quotes:'00AB' '00BB' '201E' '201C';
  ```

q:en

  ```css
  quotes:'201C' '201D' '2018' '2019';
  ```

coi

  ```css
  counter-increment:;
  ```

cor

  ```css
  counter-reset:;
  ```

### Outline 

ol

  ```css
  outline:;
  ```

ol:n

  ```css
  outline:none;
  ```

olo

  ```css
  outline-offset:;
  ```

olw

  ```css
  outline-width:;
  ```

olw:tn

  ```css
  outline-width:thin;
  ```

olw:m

  ```css
  outline-width:medium;
  ```

olw:tc

  ```css
  outline-width:thick;
  ```

ols

  ```css
  outline-style:;
  ```

ols:n

  ```css
  outline-style:none;
  ```

ols:dt

  ```css
  outline-style:dotted;
  ```

ols:ds

  ```css
  outline-style:dashed;
  ```

ols:s

  ```css
  outline-style:solid;
  ```

ols:db

  ```css
  outline-style:double;
  ```

ols:g

  ```css
  outline-style:groove;
  ```

ols:r

  ```css
  outline-style:ridge;
  ```

ols:i

  ```css
  outline-style:inset;
  ```

ols:o

  ```css
  outline-style:outset;
  ```

olc

  ```css
  outline-color:#000;
  ```

olc:i

  ```css
  outline-color:invert;
  ```

### Tables 

tbl

  ```css
  table-layout:;
  ```

tbl:a

  ```css
  table-layout:auto;
  ```

tbl:f

  ```css
  table-layout:fixed;
  ```

cps

  ```css
  caption-side:;
  ```

cps:t

  ```css
  caption-side:top;
  ```

cps:b

  ```css
  caption-side:bottom;
  ```

ec

  ```css
  empty-cells:;
  ```

ec:s

  ```css
  empty-cells:show;
  ```

ec:h

  ```css
  empty-cells:hide;
  ```

### Border 

bd

  ```css
  border:;
  ```

bd+

  ```css
  border:1px solid #000;
  ```

bd:n

  ```css
  border:none;
  ```

bdbk

  ```css
  border-break:close;
  ```

bdbk:c

  ```css
  border-break:close;
  ```

bdcl

  ```css
  border-collapse:;
  ```

bdcl:c

  ```css
  border-collapse:collapse;
  ```

bdcl:s

  ```css
  border-collapse:separate;
  ```

bdc

  ```css
  border-color:#000;
  ```

bdc:t

  ```css
  border-color:transparent;
  ```

bdi

  ```css
  border-image:url();
  ```

bdi:n

  ```css
  border-image:none;
  ```

bdti

  ```css
  border-top-image:url();
  ```

bdti:n

  ```css
  border-top-image:none;
  ```

bdri

  ```css
  border-right-image:url();
  ```

bdri:n

  ```css
  border-right-image:none;
  ```

bdbi

  ```css
  border-bottom-image:url();
  ```

bdbi:n

  ```css
  border-bottom-image:none;
  ```

bdli

  ```css
  border-left-image:url();
  ```

bdli:n

  ```css
  border-left-image:none;
  ```

bdci

  ```css
  border-corner-image:url();
  ```

bdci:n

  ```css
  border-corner-image:none;
  ```

bdci:c

  ```css
  border-corner-image:continue;
  ```

bdtli

  ```css
  border-top-left-image:url();
  ```

bdtli:n

  ```css
  border-top-left-image:none;
  ```

bdtli:c

  ```css
  border-top-left-image:continue;
  ```

bdtri

  ```css
  border-top-right-image:url();
  ```

bdtri:n

  ```css
  border-top-right-image:none;
  ```

bdtri:c

  ```css
  border-top-right-image:continue;
  ```

bdbri

  ```css
  border-bottom-right-image:url();
  ```

bdbri:n

  ```css
  border-bottom-right-image:none;
  ```

bdbri:c

  ```css
  border-bottom-right-image:continue;
  ```

bdbli

  ```css
  border-bottom-left-image:url();
  ```

bdbli:n

  ```css
  border-bottom-left-image:none;
  ```

bdbli:c

  ```css
  border-bottom-left-image:continue;
  ```

bdf

  ```css
  border-fit:repeat;
  ```

bdf:c

  ```css
  border-fit:clip;
  ```

bdf:r

  ```css
  border-fit:repeat;
  ```

bdf:sc

  ```css
  border-fit:scale;
  ```

bdf:st

  ```css
  border-fit:stretch;
  ```

bdf:ow

  ```css
  border-fit:overwrite;
  ```

bdf:of

  ```css
  border-fit:overflow;
  ```

bdf:sp

  ```css
  border-fit:space;
  ```

bdlen

  ```css
  border-length:;
  ```

bdlen:a

  ```css
  border-length:auto;
  ```

bdsp

  ```css
  border-spacing:;
  ```

bds

  ```css
  border-style:;
  ```

bds:n

  ```css
  border-style:none;
  ```

bds:h

  ```css
  border-style:hidden;
  ```

bds:dt

  ```css
  border-style:dotted;
  ```

bds:ds

  ```css
  border-style:dashed;
  ```

bds:s

  ```css
  border-style:solid;
  ```

bds:db

  ```css
  border-style:double;
  ```

bds:dtds

  ```css
  border-style:dot-dash;
  ```

bds:dtdtds

  ```css
  border-style:dot-dot-dash;
  ```

bds:w

  ```css
  border-style:wave;
  ```

bds:g

  ```css
  border-style:groove;
  ```

bds:r

  ```css
  border-style:ridge;
  ```

bds:i

  ```css
  border-style:inset;
  ```

bds:o

  ```css
  border-style:outset;
  ```

bdw

  ```css
  border-width:;
  ```

bdt, bt

  ```css
  border-top:;
  ```

bdt+

  ```css
  border-top:1px solid #000;
  ```

bdt:n

  ```css
  border-top:none;
  ```

bdtw

  ```css
  border-top-width:;
  ```

bdts

  ```css
  border-top-style:;
  ```

bdts:n

  ```css
  border-top-style:none;
  ```

bdtc

  ```css
  border-top-color:#000;
  ```

bdtc:t

  ```css
  border-top-color:transparent;
  ```

bdr, br

  ```css
  border-right:;
  ```

bdr+

  ```css
  border-right:1px solid #000;
  ```

bdr:n

  ```css
  border-right:none;
  ```

bdrw

  ```css
  border-right-width:;
  ```

bdrst

  ```css
  border-right-style:;
  ```

bdrst:n

  ```css
  border-right-style:none;
  ```

bdrc

  ```css
  border-right-color:#000;
  ```

bdrc:t

  ```css
  border-right-color:transparent;
  ```

bdb, bb

  ```css
  border-bottom:;
  ```

bdb+

  ```css
  border-bottom:1px solid #000;
  ```

bdb:n

  ```css
  border-bottom:none;
  ```

bdbw

  ```css
  border-bottom-width:;
  ```

bdbs

  ```css
  border-bottom-style:;
  ```

bdbs:n

  ```css
  border-bottom-style:none;
  ```

bdbc

  ```css
  border-bottom-color:#000;
  ```

bdbc:t

  ```css
  border-bottom-color:transparent;
  ```

bdl, bl

  ```css
  border-left:;
  ```

bdl+

  ```css
  border-left:1px solid #000;
  ```

bdl:n

  ```css
  border-left:none;
  ```

bdlw

  ```css
  border-left-width:;
  ```

bdls

  ```css
  border-left-style:;
  ```

bdls:n

  ```css
  border-left-style:none;
  ```

bdlc

  ```css
  border-left-color:#000;
  ```

bdlc:t

  ```css
  border-left-color:transparent;
  ```

bdrs

  ```css
  border-radius:;
  ```

bdtrrs

  ```css
  border-top-right-radius:;
  ```

bdtlrs

  ```css
  border-top-left-radius:;
  ```

bdbrrs

  ```css
  border-bottom-right-radius:;
  ```

bdblrs

  ```css
  border-bottom-left-radius:;
  ```

### Lists 

lis

  ```css
  list-style:;
  ```

lis:n

  ```css
  list-style:none;
  ```

lisp

  ```css
  list-style-position:;
  ```

lisp:i

  ```css
  list-style-position:inside;
  ```

lisp:o

  ```css
  list-style-position:outside;
  ```

list

  ```css
  list-style-type:;
  ```

list:n

  ```css
  list-style-type:none;
  ```

list:d

  ```css
  list-style-type:disc;
  ```

list:c

  ```css
  list-style-type:circle;
  ```

list:s

  ```css
  list-style-type:square;
  ```

list:dc

  ```css
  list-style-type:decimal;
  ```

list:dclz

  ```css
  list-style-type:decimal-leading-zero;
  ```

list:lr

  ```css
  list-style-type:lower-roman;
  ```

list:ur

  ```css
  list-style-type:upper-roman;
  ```

lisi

  ```css
  list-style-image:;
  ```

lisi:n

  ```css
  list-style-image:none;
  ```

### Print 

pgbb

  ```css
  page-break-before:;
  ```

pgbb:au

  ```css
  page-break-before:auto;
  ```

pgbb:al

  ```css
  page-break-before:always;
  ```

pgbb:l

  ```css
  page-break-before:left;
  ```

pgbb:r

  ```css
  page-break-before:right;
  ```

pgbi

  ```css
  page-break-inside:;
  ```

pgbi:au

  ```css
  page-break-inside:auto;
  ```

pgbi:av

  ```css
  page-break-inside:avoid;
  ```

pgba

  ```css
  page-break-after:;
  ```

pgba:au

  ```css
  page-break-after:auto;
  ```

pgba:al

  ```css
  page-break-after:always;
  ```

pgba:l

  ```css
  page-break-after:left;
  ```

pgba:r

  ```css
  page-break-after:right;
  ```

orp

  ```css
  orphans:;
  ```

wid

  ```css
  widows:;
  ```

### Others 

!

  ```css
  !important
  ```

@f

  ```css
  @font-face { 
    font-family:; 
    src:url(|);
  }
  ```

@f+

  ```css
  @font-face {
    font-family: 'FontName';
    src: url('FileName.eot');
    src: url('FileName.eot?#iefix')
    format('embedded-opentype'), url('FileName.woff') 
    format('woff'), url('FileName.ttf')
    format('truetype'), url('FileName.svg#FontName') 
    format('svg');
    font-style: normal; 
    font-weight: normal; 
  }
  ```

@i, @import

  ```css
  @import url();
  ```

@kf

  ```css
  @-webkit-keyframes identifier { 
    from { }
    to { }
  }
  @-o-keyframes identifier { 
    from { }
    to { }
  }
  @-moz-keyframes identifier {
    from { }
    to { }
  }
  @keyframes identifier {
    from { }
    to { }
  }
  ```

@m, @media

  ```css
  @media screen { }
  ```

ac

  ```css
  align-content:;
  ```

ac:c

  ```css
  align-content:center;
  ```

ac:fe

  ```css
  align-content:flex-end;
  ```

ac:fs

  ```css
  align-content:flex-start;
  ```

ac:s

  ```css
  align-content:stretch;
  ```

ac:sa

  ```css
  align-content:space-around;
  ```

ac:sb

  ```css
  align-content:space-between;
  ```

ai

  ```css
  align-items:;
  ```

ai:b

  ```css
  align-items:baseline;
  ```

ai:c

  ```css
  align-items:center;
  ```

ai:fe

  ```css
  align-items:flex-end;
  ```

ai:fs

  ```css
  align-items:flex-start;
  ```

ai:s

  ```css
  align-items:stretch;
  ```

anim

  ```css
  animation:;
  ```

anim-

  ```css
  animation:name duration timing-function delay iteration-count direction fill-mode;
  ```

animdel

  ```css
  animation-delay:time;
  ```

animdir

  ```css
  animation-direction:normal;
  ```

animdir:a

  ```css
  animation-direction:alternate;
  ```

animdir:ar

  ```css
  animation-direction:alternate-reverse;
  ```

animdir:n

  ```css
  animation-direction:normal;
  ```

animdir:r

  ```css
  animation-direction:reverse;
  ```

animdur

  ```css
  animation-duration:0s;
  ```

animfm

  ```css
  animation-fill-mode:both;
  ```

animfm:b

  ```css
  animation-fill-mode:backwards;
  ```

animfm:bt, animfm:bh

  ```css
  animation-fill-mode:both;
  ```

animfm:f

  ```css
  animation-fill-mode:forwards;
  ```

animic

  ```css
  animation-iteration-count:1;
  ```

animic:i

  ```css
  animation-iteration-count:infinite;
  ```

animn

  ```css
  animation-name:none;
  ```

animps

  ```css
  animation-play-state:running;
  ```

animps:p

  ```css
  animation-play-state:paused;
  ```

animps:r

  ```css
  animation-play-state:running;
  ```

animtf

  ```css
  animation-timing-function:linear;
  ```

animtf:cb

  ```css
  animation-timing-function:cubic-bezier(0.1, 0.7, 1.0, 0.1);
  ```

animtf:e

  ```css
  animation-timing-function:ease;
  ```

animtf:ei

  ```css
  animation-timing-function:ease-in;
  ```

animtf:eio

  ```css
  animation-timing-function:ease-in-out;
  ```

animtf:eo

  ```css
  animation-timing-function:ease-out;
  ```

animtf:l

  ```css
  animation-timing-function:linear;
  ```

ap

  ```css
  appearance:${none};
  ```

as

  ```css
  align-self:;
  ```

as:a

  ```css
  align-self:auto;
  ```

as:b

  ```css
  align-self:baseline;
  ```

as:c

  ```css
  align-self:center;
  ```

as:fe

  ```css
  align-self:flex-end;
  ```

as:fs

  ```css
  align-self:flex-start;
  ```

as:s

  ```css
  align-self:stretch;
  ```

bfv

  ```css
  backface-visibility:;
  ```

bfv:h

  ```css
  backface-visibility:hidden;
  ```

bfv:v

  ```css
  backface-visibility:visible;
  ```

bg:ie

  ```css
  filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='x.png',sizingMethod='crop');
  ```

cm

  ```css
  /* ${child} */
  ```

colm

  ```css
  columns:;
  ```

colmc

  ```css
  column-count:;
  ```

colmf

  ```css
  column-fill:;
  ```

colmg

  ```css
  column-gap:;
  ```

colmr

  ```css
  column-rule:;
  ```

colmrc

  ```css
  column-rule-color:;
  ```

colmrs

  ```css
  column-rule-style:;
  ```

colmrw

  ```css
  column-rule-width:;
  ```

colms

  ```css
  column-span:;
  ```

colmw

  ```css
  column-width:;
  ```

d:ib+

  ```css
  display: inline-block; *display: inline; *zoom: 1;
  ```

fx

  ```css
  flex:;
  ```

fxb

  ```css
  flex-basis:;
  ```

fxd

  ```css
  flex-direction:;
  ```

fxd:c

  ```css
  flex-direction:column;
  ```

fxd:cr

  ```css
  flex-direction:column-reverse;
  ```

fxd:r

  ```css
  flex-direction:row;
  ```

fxd:rr

  ```css
  flex-direction:row-reverse;
  ```

fxf

  ```css
  flex-flow:;
  ```

fxg

  ```css
  flex-grow:;
  ```

fxsh

  ```css
  flex-shrink:;
  ```

fxw

  ```css
  flex-wrap: ;
  ```

fxw:n

  ```css
  flex-wrap:nowrap;
  ```

fxw:w

  ```css
  flex-wrap:wrap;
  ```

fxw:wr

  ```css
  flex-wrap:wrap-reverse;
  ```

jc

  ```css
  justify-content:;
  ```

jc:c

  ```css
  justify-content:center;
  ```

jc:fe

  ```css
  justify-content:flex-end;
  ```

jc:fs

  ```css
  justify-content:flex-start;
  ```

jc:sa

  ```css
  justify-content:space-around;
  ```

jc:sb

  ```css
  justify-content:space-between;
  ```

mar

  ```css
  max-resolution:res;
  ```

mir

  ```css
  min-resolution:res;
  ```

op+

  ```css
  opacity: ; filter: alpha(opacity=);
  ```

op:ie

  ```css
  filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
  ```

op:ms

  ```css
  -ms-filter:'progid:DXImageTransform.Microsoft.Alpha(Opacity=100)';
  ```

ord

  ```css
  order:;
  ```

ori

  ```css
  orientation:;
  ```

ori:l

  ```css
  orientation:landscape;
  ```

ori:p

  ```css
  orientation:portrait;
  ```

tov

  ```css
  text-overflow:${ellipsis};
  ```

tov:c

  ```css
  text-overflow:clip;
  ```

tov:e

  ```css
  text-overflow:ellipsis;
  ```

trf

  ```css
  transform:;
  ```

trf:r

  ```css
  transform: rotate(angle);
  ```

trf:rx

  ```css
  transform: rotateX(angle);
  ```

trf:ry

  ```css
  transform: rotateY(angle);
  ```

trf:rz

  ```css
  transform: rotateZ(angle);
  ```

trf:sc

  ```css
  transform: scale(x, y);
  ```

trf:sc3

  ```css
  transform: scale3d(x, y, z);
  ```

trf:scx

  ```css
  transform: scaleX(x);
  ```

trf:scy

  ```css
  transform: scaleY(y);
  ```

trf:scz

  ```css
  transform: scaleZ(z);
  ```

trf:skx

  ```css
  transform: skewX(angle);
  ```

trf:sky

  ```css
  transform: skewY(angle);
  ```

trf:t

  ```css
  transform: translate(x, y);
  ```

trf:t3

  ```css
  transform: translate3d(tx, ty, tz);
  ```

trf:tx

  ```css
  transform: translateX(x);
  ```

trf:ty

  ```css
  transform: translateY(y);
  ```

trf:tz

  ```css
  transform: translateZ(z);
  ```

trfo

  ```css
  transform-origin:;
  ```

trfs

  ```css
  transform-style:preserve-3d;
  ```

trs

  ```css
  transition:prop time;
  ```

trsde

  ```css
  transition-delay:time;
  ```

trsdu

  ```css
  transition-duration:time;
  ```

trsp

  ```css
  transition-property:prop;
  ```

trstf

  ```css
  transition-timing-function:tfunc;
  ```

us

  ```css
  user-select:${none};
  ```

wfsm

  ```css
  -webkit-font-smoothing:${antialiased};
  ```

wfsm:a

  ```css
  -webkit-font-smoothing:antialiased;
  ```

wfsm:n

  ```css
  -webkit-font-smoothing:none;
  ```

wfsm:s, wfsm:sa

  ```css
  -webkit-font-smoothing:subpixel-antialiased;
  ```

wm

  ```css
  writing-mode:lr-tb;
  ```

wm:btl

  ```css
  writing-mode:bt-lr;
  ```

wm:btr

  ```css
  writing-mode:bt-rl;
  ```

wm:lrb

  ```css
  writing-mode:lr-bt;
  ```

wm:lrt

  ```css
  writing-mode:lr-tb;
  ```

wm:rlb

  ```css
  writing-mode:rl-bt;
  ```

wm:rlt

  ```css
  writing-mode:rl-tb;
  ```

wm:tbl

  ```css
  writing-mode:tb-lr;
  ```

wm:tbr

  ```css
  writing-mode:tb-rl;
  ```

XSL 
---

tmatch, tm

  ```xml
  <xsl:template match="" mode=""></xsl:template>
  ```

tname, tn

  ```xml
  <xsl:template name=""></xsl:template>
  ```

call

  ```xml
  <xsl:call-template name="" />
  ```

ap

  ```xml
  <xsl:apply-templates select="" mode="" />
  ```

api

  ```xml
  <xsl:apply-imports />
  ```

imp

  ```xml
  <xsl:import href="" />
  ```

inc

  ```xml
  <xsl:include href="" />
  ```

ch

  ```xml
  <xsl:choose></xsl:choose>
  ```

xsl:when, wh

  ```xml
  <xsl:when test=""></xsl:when>
  ```

ot

  ```xml
  <xsl:otherwise></xsl:otherwise>
  ```

if

  ```xml
  <xsl:if test=""></xsl:if>
  ```

par

  ```xml
  <xsl:param name=""></xsl:param>
  ```

pare

  ```xml
  <xsl:param name="" select="" />
  ```

var

  ```xml
  <xsl:variable name=""></xsl:variable>
  ```

vare

  ```xml
  <xsl:variable name="" select="" />
  ```

wp

  ```xml
  <xsl:with-param name="" select="" />
  ```

key

  ```xml
  <xsl:key name="" match="" use="" />
  ```

elem

  ```xml
  <xsl:element name=""></xsl:element>
  ```

attr

  ```xml
  <xsl:attribute name=""></xsl:attribute>
  ```

attrs

  ```xml
  <xsl:attribute-set name=""></xsl:attribute-set>
  ```

cp

  ```xml
  <xsl:copy select="" />
  ```

co

  ```xml
  <xsl:copy-of select="" />
  ```

val

  ```xml
  <xsl:value-of select="" />
  ```

each, for

  ```xml
  <xsl:for-each select=""></xsl:for-each>
  ```

tex

  ```xml
  <xsl:text></xsl:text>
  ```

com

  ```xml
  <xsl:comment></xsl:comment>
  ```

msg

  ```xml
  <xsl:message terminate="no"></xsl:message>
  ```

fall

  ```xml
  <xsl:fallback></xsl:fallback>
  ```

num

  ```xml
  <xsl:number value="" />
  ```

nam

  ```xml
  <namespace-alias stylesheet-prefix="" result-prefix="" />
  ```

pres

  ```xml
  <xsl:preserve-space elements="" />
  ```

strip

  ```xml
  <xsl:strip-space elements="" />
  ```

proc

  ```xml
  <xsl:processing-instruction name="">
  </xsl:processing-instruction>
  ```

sort

  ```xml
  <xsl:sort select="" order="" />
  ```

choose+

    ```xml
    <xsl:choose> 
      <xsl:when test=""> 
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise> 
    </xsl:choose>
    ```

xsl

  ```xml
  <?xml version="1.0" encoding="UTF-8"?> 
  <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  </xsl:stylesheet>
  ```

!!!

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  ```

