-emmet.txt-        -Emmet- for Vim

             Emmet: vim plugins for HTML and CSS hi-speed coding
=====================================================================================

RACCOURCIS:
===========

Expand : <C-y>,

SNIPPETS DEFINTIION
====================
see [snippets.json](https://github.com/emmetio/emmet/blob/master/lib/snippets.json)


CONTENTS                                                      *emmet-contents*
========

Introduction           |emmet-introduction|
Install                |emmet-install|
Tutorial               |emmet-tutorial|
  1. Expand abbreviation            |emmet-expand-abbr|              |<C-y>,|
  2. Expand word                    |emmet-expand-word|              |<C-y>;|
  3. Update tag                     |emmet-update-tag|               |<C-y>u|
  4. Wrap with abbreviation         |emmet-wrap-with-abbreviation|   |v_<C-y>,|
  5. Balance tag inward             |emmet-balance-tag-inward|       |<C-y>d|
  6. Balance tag outward            |emmet-balance-tag-outward|      |<C-y>D|
  7. Go to next edit point          |emmet-goto-next-point|          |<C-y>n|
  8. Go to previous edit point      |emmet-goto-previous-point|      |<C-y>N|
  9. Add and update <img> size      |emmet-update-image-size|        |<C-y>i|
 10. Merge lines                    |emmet-merge-lines|              |<C-y>m|
 11. Remove tag                     |emmet-remove-tag|               |<C-y>k|
 12. Split/join tag                 |emmet-split-join-tag|           |<C-y>j|
 13. Toggle comment                 |emmet-toggle-comment|           |<C-y>/|
 14. Make anchor from URL           |emmet-make-anchor-url|          |<C-y>a|
 15. Make quoted text from URL      |emmet-quoted-text-url|          |<C-y>A|
 16. Code pretty                    |emmet-code-pretty|              |<C-y>c|
 17. Lorem ipsum                    |emmet-lorem-ipsum|
HTML expression syntax |emmet-html-expression-syntax|
  1. Elements                       |emmet-html-syntax-elements|
  2. Nesting operators              |emmet-html-syntax-nesting-operators|
  2.1. Child                        |emmet->|
  2.2. Sibling                      |emmet-+|
  2.3. Climb-up                     |emmet-^|
  2.4. Multiplication               |emmet-star|
  2.5. Grouping                     |emmet-()|
  3. Attribute operators            |emmet-html-syntax-attribute-operators|
  3.1. ID and CLASS                 |emmet-.| |emmet-#|
  3.2. Custom attributes            |emmet-[]|
  3.3. Item numbering               |emmet-$|
  3.3.1. Changing numbering origin and direction |emmet-@|
  3.4. Quote character              |emmet-html-attr-quote-char|
  4. Text                           |emmet-{}|
  5. Implicit tag names             |emmet-html-implicit-tag-names|
  6. Notes on abbreviation formatting |emmet-html-syntax-notes|
  7. Choose position to insert text when wrap abbreviation |emmet-$#|
CSS expression syntax  |emmet-css-expression-syntax|
  1. Properties                     |emmet-css-properties|
  2. Values                         |emmet-css-values|
  3. Units                          |emmet-css-units|
  4. Vendor prefixes                |emmet-css-vendor-prefixes|
Commands               |emmet-commands|
  :Emmet                            |:Emmet|
  :EmmetInstall                     |:EmmetInstall|
Variables              |emmet-variables|
  g:emmet_html5                     |g:emmet_html5|
  g:emmet_docroot                   |g:emmet_docroot|
  g:emmet_curl_command              |g:emmet_curl_command|
  g:user_emmet_complete_tag         |g:user_emmet_complete_tag|
  g:user_emmet_leader_key           |g:user_emmet_leader_key|
  g:user_emmet_install_global       |g:user_emmet_install_global|
  g:user_emmet_install_command      |g:user_emmet_install_command|
  g:user_emmet_settings             |g:user_emmet_settings|
  g:user_emmet_mode                 |g:user_emmet_mode|
Customize              |emmet-customize|
  1. Key mappings                   |emmet-customize-key-mappings|
  2. Indent size                    |emmet-indent-size|
  3. Define tag's behavior          |emmet-define-tags-behavior|
  4. Adding custom snippets         |emmet-custom-snippets|
Filters                |emmet-filters-list|
  Escapes XML-unsafe characters     |emmet-filter-e|
  Add comments around 'important tags' |emmet-filter-c|
  Outputs as a single line          |emmet-filter-s|
  Trim list markers                 |emmet-filter-t|
Links                  |emmet-links|
ToDo                   |emmet-todo|

==============================================================================
INTRODUCTION                                      *emmet-introduction* *emmet*

Emmet is an editor plugin for high-speed HTML, XML, XSL (or any other
structured code format) coding and editing. The core of this plugin is a
powerful abbreviation engine which allows you to expand expressions,
similar to CSS selectors, into HTML code:
>
    div#page>div.logo+ul#navigation>li*5>a
<
can be expanded into:
>
    <div id="page">
        <div class="logo"></div>
        <ul id="navigation">
            <li><a href=""></a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
        </ul>
    </div>
<
Read more about current Emmet syntax
  |emmet-html-expression-syntax|
  |emmet-css-expression-syntax|
  http://docs.emmet.io/abbreviations/

Abbreviation engine has a modular structure which allows you
to expand abbreviations into different languages.
Emmet currently supports CSS, HTML, XML/XSL and HAML, Slim languages
via filters (see |emmet-filter|).

==============================================================================
INSTALL                                                        *emmet-install*

Install the distributed files into Vim runtime directory which is usually
'~/.vim/', or '$HOME/vimfiles' on Windows.

If you install pathogen (https://github.com/tpope/vim-pathogen)
that provided by Tim Pope, you should extract the
file into 'bundle' directory.

==============================================================================
TUTORIAL                                                      *emmet-tutorial*

If you are seeing this file as :help, then you can't edit this file.
You should copy this section and create new buffer, paste and write as
'emmet-tutor.txt'. Formally, open the file to start tutorial.

1. Expand abbreviation                            *emmet-expand-abbr* *<C-y>,*

  Type abbreviation as 'div>p#foo$*3>a' and type '<C-y>,'.
>
  <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
<
2. Expand abbreviation                            *emmet-expand-word* *<C-y>;*

  When you want to expand word except html tokens like below, use this.
>
  <html
  >foo
<
  This will be expanded like:
>
  <html
  ><foo></foo>

3. Update tag                                     *emmet-update-tag* *<C-y>u*

  The begining of tags '<div>' on below
>
  <div>foo</div>
<
  Type '<C-y>u' request 'Enter Abbreviation:'. Then type
>
  .global
<
  This will be expanded like:
>
  <div class=".global">foo</div>
<
4. Wrap with abbreviation            *emmet-wrap-with-abbreviation* *v_<C-y>,*

  Write as below.
>
  test1
  test2
  test3
<
  Then do visual select (line wise) and type '<C-y>,'.
  If you request 'Tag:', then type
>
  ul>li*
<
  Result:
>
  <ul>
      <li>test1</li>
      <li>test2</li>
      <li>test3</li>
  </ul>
<
  If you type tag name, for example
>
  blockquote
<
  then you'll see as following:
>
  <blockquote>
      test1
      test2
      test3
  </blockquote>
<
  See also: |emmet-filter-t|, |emmet-$#|

5. Balance tag inward                      *emmet-balance-tag-inward* *<C-y>d*

  To select inward of '<ul>' tag, type '<C-y>d' in insert mode.
>
  <ul>
  *   <li class="list1"></li>
      <li class="list2"></li>
      <li class="list3"></li>
  </ul>
<
  If cursor is at '*', '<C-y>d' select from begin of '<ul>' to end of '</ul>'.
  If cursor is at first of '<li>', it select '<li class="list1"></li>'.

6. Balance tag outward                    *emmet-balance-tag-outward* *<C-y>D*

  To select outward of '<ul>' tag type '<C-y>D' in insert mode.
>
  <ul>
    * <li class="list1"></li>
      <li class="list2"></li>
      <li class="list3"></li>
  </ul>
<
  If cursor is at '*', '<C-y>D' select from next letter of '<ul>'
  to previous letter of '</ul>'.
  If cursor is at first of '<li>', it select '<li class="list1"></li>'.

7. Go to next edit point                      *emmet-goto-next-point* *<C-y>n*

  To jump next point that need to edit, type '<C-y>n' in insert mode.
>
  * <div id="foo" class="">foo</div>
    <div id="bar" class="bar"></div>
<
  If cursor is at '*', type '<C-y>n' to move a cursor
  into attribute value of '<div>' specified id as 'foo'.
  And type again '<C-y>n' to move a cursor
  into inner of '<div>' specified id as 'bar'.

8. Go to previous edit point              *emmet-goto-previous-point* *<C-y>N*

  To jump previous point that need to edit, type '<C-y>N' in insert mode.
>
  <div id="foo" class="">foo</div>
  <div id="bar" class="bar"></div> *
<
  If cursor is at '*', type '<C-y>N' to move a cursor
  into '<div>' specified id as 'bar'.
  And type again '<C-y>N' to move a cursor
  into attribute value of 'foo'.

9. Add and update <img> size                *emmet-update-image-size* *<C-y>i*

  To add or update 'width' and 'height' attributes of image,
  type '<C-y>i' on '<img>' tag
>
  <img src="foo.png" />
<
  Type '<C-y>i' on '<img>' tag
>
  <img src="foo.png" width="32" height="32" />
<
  If you change image, then type it again. it will be following.
>
  <img src="foo-48.png" width="32" height="48" />
<
  Image size retrieved using 'identify' (ImageMagick.org) (if available)
  or |xxd|.

10. Merge lines                                    *emmet-merge-lines* *<C-y>m*

  To join multi line text like following, type |J|.
>
  <ul>
      <li class="list1"></li>
      <li class="list2"></li>
      <li class="list3"></li>
  </ul>
<
  If you select part of line include '<li>' and type |<C-y>m|,
  it will be following.
>
  <ul>
      <li class="list1"></li><li class="list2"></li><li class="list3"></li>
  </ul>
<
11. Remove tag                                      *emmet-remove-tag* *<C-y>k*

  To remove tag in the block, type '<C-y>k'.
>
  <div class="foo">
      <a>cursor is here</a>
  </div>
<
  Type '<C-y>k' in insert mode, then
>
  <div class="foo">

  </div>
<
  And type '<C-y>k' in there again, then '<div>' will be removed.

12. Split/join tag                             *emmet-split-join-tag* *<C-y>j*

  To join block, type '<C-y>j'.
>
  <div class="foo">
      cursor is here
  </div>
<
  Type '<C-y>j' in insert mode. Then,
>
  <div class="foo" />
<
  And type '<C-y>j' in there again.
>
  <div class="foo">
  </div>
<
13. Toggle comment                             *emmet-toggle-comment* *<C-y>/*

  Move cursor to block
>
  <div>
      hello world
  </div>
<
  Type '<C-y>/' in insert mode.
>
  <!-- <div>
      hello world
  </div> -->
<
  Type '<C-y>/' in there again.
>
  <div>
      hello world
  </div>
<
14. Make anchor from URL                      *emmet-make-anchor-url* *<C-y>a*

  Move cursor to URL
>
  http://www.google.com/
<
  Type '<C-y>a'
>
  <a href="http://www.google.com/">Google</a>
<
  Text retrieved using command, specified by |g:emmet_curl_command|.

15. Make quoted text from URL                 *emmet-quoted-text-url* *<C-y>A*

  Move cursor to URL
>
  https://github.com/
<
  Type '<C-y>A'
>
  <blockquote class="quote">
      <a href="https://github.com/">Secure source code hosting and collaborative development - GitHub</a><br />
      <p>How does it work? Get up and running in seconds by forking a project, pushing an existing repository...</p>
      <cite>https://github.com/</cite>
  </blockquote>
<
  Text retrieved using command, specified by |g:emmet_curl_command|.

16. Code pretty                                   *emmet-code-pretty* *<C-y>c*

  Select code block, for example select following code from 'int main()'.
>
  <p>Writing in C language</p>

  int main() {
    puts("hello world");
  }
<
  Type '<C-y>c'
>
  <span class="Type">int</span>&nbsp;main() {<br />
  &nbsp;&nbsp;puts(<span class="Constant">&quot;hello world&quot;</span>);<br />
  }<br />
<
  To convert text into html used command |:TOhtml|.

17. Lorem ipsum                                            *emmet-lorem-ipsum*

  To insert dummy text (30 words by default).
>
  div>lorem
<
  Type |<C-y>,|
>
  <div>Adipisicing asperiores deleniti ipsum fuga deserunt perferendis
  molestiae sunt excepturi aut quo nihil! Optio accusantium corporis molestiae
  deserunt ab, veritatis commodi. Eius nobis ab deserunt magni iure quo
  laboriosam laboriosam.</div>
<
  For japanese user, put like follow into your |g:user_emmet_settings|:
>
  let g:user_emmet_settings = {
    ...

    \  'custom_expands1' : {
    \    '^\%(lorem\|lipsum\)\(\d*\)$' : function('emmet#lorem#ja#expand'),
    \  },

    ...
<
  You will get japanese dummy text. Text retrieved from url
  'http://www.aozora.gr.jp/cards/000081/files/470_15407.html'
  using command, specified by |g:emmet_curl_command|.

  To insert 3 words of dummy text.
>
  div>lorem3
<
  Type |<C-y>,|
>
  <div>
      Elit libero id.
  </div>
<
==============================================================================
HTML EXPRESSION SYNTAX                          *emmet-html-expression-syntax*

Emmet uses syntax similar to CSS selectors for describing elements' positions
inside generated tree and elements' attributes.

1. Elements                                       *emmet-html-syntax-elements*

  You can use elements' names like 'div' or 'p' to generate HTML tags.
>
    p     ->   <p></p>
    div   ->   <div></div>
<
  You can write any word and transform it into a tag:
>
    foo   ->   <foo></foo>
    bar   ->   <bar></bar>
<
  Emmet knowns set of empty elements:
>
    br    ->   <br />   or <br>
    meta  ->   <meta /> or <meta>
<
  To choose between HTML '>' and XHTML ' />' use |g:emmet_html5| or
  |g:user_emmet_settings|:
>
  let g:user_emmet_settings = {
  \    ...
  \    'html': {
  \        ...
  \        'empty_element_suffix': ' />',
  \        ...
  \    },
  \    ...
  \}
<
  Emmet will automatically insert some attributes:
>
    a     ->   <a href="" ></a>
    link  ->   <link rel="stylesheet" href="" />
<
  Set of inserted attributes can be changed using |g:user_emmet_settings|:
>
  let s:emmet_settings = {
  \    ...
  \    'html': {
  \        ...
  \        'default_attributes': {
  \            ...
  \            'a': {'href': ''},
  \            'ins': {'datetime': '${datetime}'},
  \            'iframe': [{'src': ''}, {'frameborder': '0'}],
  \            'textarea': [{'name': ''}, {'id': ''}, {'cols': '30'}, {'rows': '10'}],
  \            ...
  \        },
  \        ...
  \    },
  \    ...
  \}
<
2. Nesting operators                     *emmet-html-syntax-nesting-operators*

  Nesting operators are used to position abbreviation elements
  inside generated tree: whether it should be placed
  inside or near the context element.

  Operator   Description      Link ~
  >          Child            |emmet->|
  +          Sibling          |emmet-+|
  ^          Climb-up         |emmet-^|
  *          Multiplication   |emmet-star|
  ()         Grouping         |emmet-()|

2.1. Child                                                           *emmet->*

  You can use '>' operator to nest elements inside each other:
>
  div>ul>li
<
  will produce
>
  <div>
      <ul>
          <li></li>
      </ul>
  </div>
<
2.2. Sibling                                                         *emmet-+*

  Use '+' operator to place elements near each other, on the same level:
>
  div+p+bq
<
  will output
>
  <div></div>
  <p></p>
  <blockquote></blockquote>
<
2.3. Climb-up                                                        *emmet-^*

  With '>' operator you're descending down the generated tree and
  positions of all sibling elements will be resolved
  against the most deepest element:
>
  div+div>p>span+em
<
  will be expanded to
>
  <div></div>
  <div>
      <p>
          <span></span>
          <em></em>
      </p>
  </div>
<
  With '^' operator, you can climb one level up the tree and change context
  where following elements should appear:
>
  div+div>p>span+em^bq
<
  outputs to
>
  <div></div>
  <div>
      <p>
          <span></span>
          <em></em>
      </p>
      <blockquote></blockquote>
  </div>
<
  You can use as many '^' operators as you like,
  each operator will move one level up:
>
  div+div>p>span+em^^^bq
<
  will output to
>
  <div></div>
  <div>
      <p>
          <span></span>
          <em></em>
      </p>
  </div>
  <blockquote></blockquote>
<
2.4. Multiplication                                               *emmet-star*

  With '*' operator you can define how many times element should be outputted:
>
  ul>li*5
<
  outputs to
>
  <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
  </ul>
<
  Expression may contain several '*' operators:
>
  tr*2>td*3
<
  become
>
  <tr>
      <td></td>
      <td></td>
      <td></td>
  </tr>
  <tr>
      <td></td>
      <td></td>
      <td></td>
  </tr>
<
2.5. Grouping                                                       *emmet-()*

  Parentheses '()' are used by Emmets' power users for grouping subtrees
  in complex abbreviations:
>
  div>(header>ul>li*2>a)+footer>p
<
  expands to
>
  <div>
      <header>
          <ul>
              <li><a href=""></a></li>
              <li><a href=""></a></li>
          </ul>
      </header>
      <footer>
          <p></p>
      </footer>
  </div>
<
  If you're working with browser's DOM, you may think of groups
  as Document Fragments: each group contains abbreviation subtree and
  all the following elements are inserted at the same level
  as the first element of group.

  You can nest groups inside each other and
  combine them with multiplication '*' operator:
>
  (div>dl>(dt+dd)*3)+footer>p
<
  produces
>
  <div>
      <dl>
          <dt></dt>
          <dd></dd>
          <dt></dt>
          <dd></dd>
          <dt></dt>
          <dd></dd>
      </dl>
  </div>
  <footer>
      <p></p>
  </footer>
<
  With groups, you can literally write full page mark-up
  with a single abbreviation, but please don't do that.

3. Attribute operators                 *emmet-html-syntax-attribute-operators*

  Attribute operators are used to modify attributes of outputted elements.
  For example, in HTML and XML you can quickly add 'class' attribute
  to generated element.

  Operator   Description                 Link ~
  .          Attribute 'class'             |emmet-.|
  #          Attribute 'id'                |emmet-#|
  []         Custom attributes             |emmet-[]|
  $          Number                        |emmet-$|
  @          Number origin and direction   |emmet-@|

3.1. ID and CLASS                                          *emmet-.* *emmet-#*

  In CSS, you use 'elem#id' and 'elem.class' notation to reach the elements
  with specified 'id' or 'class' attributes.
  In Emmet, you can use the very same syntax to add these attributes
  to specified element:
>
  span.class1          ->   <span class="class1"></span>
  span.class1.class2   ->   <span class="class1 class2"></span>
  div#wrapper          ->   <div id="wrapper"></div>
  div#wrapper.content  ->   <div id="wrapper" class="content"></div>
<
  More complex expression:
>
  div#header+div.page+div#footer.class1.class2.class3
<
  will output
>
  <div id="header"></div>
  <div class="page"></div>
  <div id="footer" class="class1 class2 class3"></div>
<
3.2. Custom attributes                                              *emmet-[]*

  You can use '[attr]' notation (as in CSS)
  to add custom attributes to your element:
>
  td[title="Hello world!" colspan=3]
<
  outputs
>
  <td title="Hello world!" colspan="3"></td>
<
  You can place as many attributes as you like inside square brackets.

  Attribute values may be omitted:
>
  td[colspan title]
<
  will produce
>
  <td colspan="" title="">
<
  You can use single or double quotes for quoting attribute values.
>
  div[a='value1' b="value2"]
<
  become
>
  <div a="value1" b="value2"></div>
<
  You don't need to quote values if they don't contain spaces:
>
  td[title=hello colspan=3]
<
  will output
>
  <td title="hello" colspan="3"></td>
<
3.3. Item numbering                                                  *emmet-$*

  With multiplication '*' operator you can repeat elements,
  but with '$' you can number them.
  Place '$' operator inside element's name, attribute's name or
  attribute's value to output current number of repeated element:
>
  ul>li.item_$*5
<
  outputs to
>
  <ul>
      <li class="item_1"></li>
      <li class="item_2"></li>
      <li class="item_3"></li>
      <li class="item_4"></li>
      <li class="item_5"></li>
  </ul>
<
  You can use multiple '$' in a row to pad number with zeroes:
>
  ul>li.item_$$$*5
<
  outputs to
>
  <ul>
      <li class="item_001"></li>
      <li class="item_002"></li>
      <li class="item_003"></li>
      <li class="item_004"></li>
      <li class="item_005"></li>
  </ul>
<
  Also '$' can be used in element name and in text (|emmet-{}|):
>
  h$[title=item$]{Header $}*3
<
  transformed to
>
  <h1 title="item1">Header 1</h1>
  <h2 title="item2">Header 2</h2>
  <h3 title="item3">Header 3</h3>
<
3.3.1. Changing numbering origin and direction                         *emmet-@*

  With '@' modifier, you can change
  - numbering direction (ascending or descending) and
  - origin (i. e. start value).

  For example, to change direction, add '@-' after '$':
>
  ul>li.item_$@-*5
<
  outputs to
>
  <ul>
      <li class="item_5"></li>
      <li class="item_4"></li>
      <li class="item_3"></li>
      <li class="item_2"></li>
      <li class="item_1"></li>
  </ul>
<
  To change counter origin value, add '@N' modifier to '$':
>
  ul>li.item_$@3*5
<
  transforms to
>
  <ul>
      <li class="item_3"></li>
      <li class="item_4"></li>
      <li class="item_5"></li>
      <li class="item_6"></li>
      <li class="item_7"></li>
  </ul>
<
  You can use these modifiers together:
>
  ul>li.item_$@-3*5
<
  is transformed to
>
  <ul>
      <li class="item_7"></li>
      <li class="item_6"></li>
      <li class="item_5"></li>
      <li class="item_4"></li>
      <li class="item_3"></li>
  </ul>
>
3.4. Quote character                              *emmet-html-attr-quote-char*

  |g:user_emmet_settings| may be used to change attribute quote character:
>
  let g:user_emmet_settings = {
       ...
  \    'html' : {
           ...
  \        'quote_char': "'",
           ...
  \    },
       ...
  \}
<
  Then abbreviation
>
  a[target=_blank]
<
  will expand to
>
  <a href='' target='_blank'></a>
<
  instead of
>
  <a href="" target="_blank"></a>
<
  Default quote is '"'.

4. Text                                                             *emmet-{}*

  You can use curly braces to add text to element:
>
  a{Click me}
<
  will produce
>
  <a href="">Click me</a>
<
  Note that '{text}' is used and parsed as a separate element
  (like, 'div', 'p' etc), but has a special meaning
  when written right after element. For example,
>
  a{click}
<
  and
>
  a>{click}
<
  will produce the same output, but
>
  a{click}+b{here}
<
  and
>
  a>{click}+b{here}
<
  won't:
>
  <!-- a{click}+b{here} -->
  <a href="">click</a><b>here</b>

  <!-- a>{click}+b{here} -->
  <a href="">click<b>here</b></a>
<
  In second example the '<b>' element is placed inside '<a>' element.
  And that's the difference: when '{text}' is written right after element,
  it doesn't change parent context.
  Here's more complex example showing why it is important:
>
  p>{Click }+a{here}+{ to continue}
<
  produces
>
  <p>Click <a href="">here</a> to continue</p>
<
  In this example, to write 'Click here to continue' inside '<p>' element
  we have explicitly move down the tree with '>' operator after 'p',
  but in case of 'a' element we don't have to, since we need '<a>' element
  with here word only, without changing parent context.

  For comparison, here's the same abbreviation
  written without child '>' operator:
>
  p{Click }+a{here}+{ to continue}
<
  produces
>
  <p>Click </p>
  <a href="">here</a> to continue
<
5. Implicit tag names                          *emmet-html-implicit-tag-names*

  Even with such a powerful abbreviation engine,
  which can expand large HTML structures from short abbreviation,
  writing tag names may be very tedious.

  In many cases you can skip typing tag names and
  Emmet will substitute it for you.
  For example, instead of >
    div.content
<  you can simply write >
    .content
<  and expand it into >
    <div class="content"></div>
<
  Other examples:
>
  .wrapper   ->   <div class="wrapper"></div>
  #popup     ->   <div id="popup"></div>
<
  When you expand abbreviation, Emmet tries to grab parent context,
  e. g. the HTML element, inside which you're expanding the abbreviation.
  If the context was grabbed successfully,
  Emmet uses its name to resolve implicit names.
  Emmet looks at the parent tag name every time
  you're expanding the abbreviation with an implicit name.
  Here's how it resolves the names for some parent elements:

  Inserted element   Parent elements ~
  li                 ul, ol
  tr                 table, tbody, thead, tfoot
  td                 tr
  option             select, optgroup
  span               Inline elements
  div                Block elements

  Take a look at some abbreviations equivalents
  with implicit and explicit tag names:
>
  .wrap>.content              ->   div.wrap>div.content
  em>.info                    ->   em>span.info
  ul>.item*3                  ->   ul>li.item*3
  table>.row>.col             ->   table>tr.row>td.col
  table>#row$*4>[colspan=2]   ->   table>tr#row$*4>td[colspan=2]
<
6. Notes on abbreviation formatting                  *emmet-html-syntax-notes*

  When you get familiar with Emmet's abbreviations syntax,
  you may want to use some formatting to make your abbreviations more readable.
  For example, use spaces between elements and operators, like this:
>
  (header > ul.nav > li*5) + footer
<
  But it won't work, because space is a stop symbol
  where Emmet stops abbreviation parsing.

  Many users mistakenly think that each abbreviation
  should be written in a new line, but they are wrong:
  you can type and expand abbreviation anywhere in the text:

  This is why Emmet needs some indicators (like spaces)
  where it should stop parsing to not expand anything that you don't need.
  If you're still thinking that such formatting is required
  for complex abbreviations to make them more readable:
  -  abbreviations are not a template language,
     they don't have to be "readable",
     they have to be "quickly expandable and removable";
  -  you don't really need to write complex abbreviations.
     Stop thinking that "typing" is the slowest process in web-development.
     You'll quickly find out that constructing a single complex abbreviation
     is much slower and error-prone than constructing and typing
     a few short ones.

7. Choose position to insert text when wrap abbreviation            *emmet-$#*

  When wrap abbreviation (|emmet-wrap-with-abbreviation|) you can choose
  position to insert text using '$#' operator.
  Operator '$#' may be used only inside |emmet-[]| and/or |emmet-{}|.

  For example, do visual select (line wise) following text:
>
  First
  Second
  Third
<
  Then press '<C-y>,' and type
>
  ul>li[ title="[$#]" ]*
<
  Result:
>
  <ul>
      <li title="[First]">First</li>
      <li title="[Second]">Second</li>
      <li title="[Third]">Third</li>
  </ul>
<
  You may type
>
  input[ type=input value=$# ]
<
  to get
>
  <input type="input" value="First">
  <input type="input" value="Second">
  <input type="input" value="Third">
<
  Using '$#' you can type text (|emmet-{}|) only once:
>
  a[title=$#]{foo}
<
  will be expanded to
>
  <a href="" title="foo">foo</a>
<
==============================================================================
CSS EXPRESSION SYNTAX                            *emmet-css-expression-syntax*

1. Properties                         *emmet-css-properties*

  Emmet has a lot of predefined snippets for CSS properties.
>
  <style type="text/css">
  .page {
      m|
  }
  </style>
<
  become
>
  <style type="text/css">
  .page {
      margin: |;
  }
  </style>
<
  In above example '|' denotes a cursor (caret) position.

  Other examples:
>
  t      ->   top: ;
  d      ->   display: ;
  o      ->   outline: ;
  ov     ->   overflow: ;
  cu     ->   cursor: ;
  bdrs   ->   border-radius: ;
<
  '+' operator may be used to insert number of properties:
>
  m1+p2
<
  become
>
  margin: 1px;
  padding: 2px;
<
2. Values                                                   *emmet-css-values*

  Some properties have default values:
>
  c     ->   color: #000;
  bgc   ->   background-color: #FFF;
  zoo   ->   zoom: 1;
<
  To insert predefined property value after abbreviation
  type colon ':' and first character of predefined keyword:
>
  d:n      ->   display: none;
  d:b      ->   display: block;
  d:i      ->   display: inline;
<
  Numerical value can be typed directly after abbreviation:
>
  m10   ->   margin: 10px;
  m2e   ->   margin: 2em;
<
  Use a hyphen '-' to separate some numerical values:
>
  m10-20       ->   margin: 10px 20px;
  p1-2-3       ->   padding: 1px 2px 3px;
<
  To negative values
  precede the first value with hyphen and all the rest with double hyphens:
>
  m-10         ->   margin: -10px;
  m-1--2       ->   margin: -1px -2px;
  p-2--1-0-1   ->   padding: -2px -1px 0 1px;
<
  To insert '!important' append '!' to property abbreviation:
>
  m!     ->   margin:  !important;
  bac!   ->   background:  !important;
<
  You can use special abbreviation 'lg(...)'
  to insert definition of linear gradient. Example:
>
  lg(left, #fc0 30%, red)
<
  will expand to
>
  background-image: -webkit-gradient(left, 0 0, 0 100, from(#fc0 30%), to(red));
  background-image: -webkit-linear-gradient(#fc0 30%, red);
  background-image: -moz-linear-gradient(#fc0 30%, red);
  background-image: -o-linear-gradient(#fc0 30%, red);
  background-image: linear-gradient(#fc0 30%, red);
<
3. Units                                                     *emmet-css-units*

  By default, when you expand an abbreviation with integer value,
  Emmet outputs it with a 'px' unit:
>
  bor2    ->   border: 2px;
  fs100   ->   font-size: 100px;
  miw20   ->   min-width: 20px;
<
  By default, if you're expanding an abbreviation with a float value,
  it is outputted with an 'em' unit:
>
  fs1.5   ->   font-style: 1.5em;
<
  But you can explicitly provide the unit name
  by putting one of characters right after value:

  Character   Unit ~
  p           %
  e           em

  Examples:
>
  fs2e    ->   font-style: 2em;
  w100p   ->   width: 100%;
<
4. Vendor prefixes                                 *emmet-css-vendor-prefixes*

  To automatically create vendor-prefixed copies of property,
  precede abbreviation with a hyphen '-'. For example, abbreviation
>
  -bdrs
<
  will be expanded into
>
  -webkit-border-radius: ;
  -moz-border-radius: ;
  border-radius: ;
<
==============================================================================
COMMANDS                                                      *emmet-commands*

:Emmet {expression}                                                   *:Emmet*
                        Expand {expression} and insert result under cursor.
                        {expression} is |emmet-html-expression|.
                        Also see |g:user_emmet_install_command|.

:EmmetInstall                                                  *:EmmetInstall*
                        Create Emmet mappings to current buffer
                        (|mapping|, |:map-<buffer>|) and,
                        if set |g:user_emmet_complete_tag|,
                        change |'omnifunc'| option to emmet#completeTag()

==============================================================================
VARIABLES                                                    *emmet-variables*

g:emmet_html5                                                  *g:emmet_html5*
                        If set to 1, enable HTML 5 support:
                        - use ">" instead of "/>": >
                             <meta />
                             <meta>
<                        - omit some HTML 4 attributes: >
                             <style type="text/css">
                             <style>
<                        - add attributes without values; >
                             <input checked="checked" />
                             <input checked>
<                        Default value: 1.
                        To disable these set variable to 0: >
                          let g:emmet_html5 = 0
<
g:emmet_docroot                                              *g:emmet_docroot*
                        |Dictionary| used by |<C-y>i|.
                        Dictionary keys is path relative to http server root.
                        Dictionary values is local file system absolute path
                        to http server root directory.
                        Default value is empty dictionary: {}

g:emmet_curl_command                                    *g:emmet_curl_command*
                        Command to download web pages.
                        Used by |emmet-html-syntax-item-numbering-base|,
                        |emmet-html-syntax-item-numbering| and
                        |emmet-lorem-ipsum| (for japanese).
                        Default value: 'curl -s -L -A Mozilla/5.0'

g:user_emmet_complete_tag                          *g:user_emmet_complete_tag*
                        Use omni complete function, provided by Emmet.
                        When user run |:EmmetInstall|,
                        following command will be executed: >
                          setlocal omnifunc=emmet#completeTag
<
g:user_emmet_leader_key                              *g:user_emmet_leader_key*
                        Leading keys to run Emmet functions.
                        Default value: '<C-y>'.
                        |:EmmetInstall| will map Emmet keys to current buffer.
                        See |emmet-customize-key-mappings|.

g:user_emmet_install_global                      *g:user_emmet_install_global*
                        If set to 1, Emmet will create global mappings.
                        Set to 0 to prevent these: >
                          let g:user_emmet_install_global = 0
<                        Default value: 1.
                        See |emmet-customize-key-mappings|.

g:user_emmet_install_command                    *g:user_emmet_install_command*
                        If set to 1, Emmet will create command |:Emmet|.
                        Set to 0 to prevent these: >
                          let g:user_emmet_install_command = 0
<                        Default value: 1.

g:user_emmet_settings                                  *g:user_emmet_settings*
                        |Dictionary|, which contains user settings.
                        User settings will override default settings.
                        Default settings can be found in file
                        'emmet/autoload/emmet.vim';
                        search for variable 's:emmet_settings'.
                        Dictionary has the same structure
                        as 's:emmet_settings'.
                        See also: |emmet-indent-size|,
                        |emmet-define-tags-behavior|, |emmet-custom-snippets|

g:user_emmet_mode                                          *g:user_emmet_mode*
                        String. Choose modes, in which
                        Emmet mappings will be created.
                        Default value: 'a' - all modes.
                        'n' - normal mode.
                        'i' - insert mode.
                        'v' - visual mode.
                        Examples: >
                          " create Emmet mappings only for normal mode
                          let g:user_emmet_mode = 'n'
                          " create Emmet mappings
                          " for insert, normal and visual modes
                          let g:user_emmet_mode = 'inv'
                          " create Emmet mappings for all modes
                          let g:user_emmet_mode = 'a'
<
==============================================================================
CUSTOMIZE                                                    *emmet-customize*

1. Key mapping                                  *emmet-customize-key-mappings*

  To specify leading key for expanding or balance tag, or for all,
  Add this line in your 'vimrc': >
>
  let g:user_emmet_leader_key = '<C-y>'
<
  Note that to expand abbreviation a trailing ',' must be typed, so
  the resultant keymap is '<C-y>,'.

  If you prefer to map for each actions separately, use following valuables:
>
  let g:user_emmet_expandabbr_key = '<C-y>,'
  let g:user_emmet_expandword_key = '<C-y>;'
  let g:user_emmet_update_tag = '<C-y>u'
  let g:user_emmet_balancetaginward_key = '<C-y>d'
  let g:user_emmet_balancetagoutward_key = '<C-y>D'
  let g:user_emmet_next_key = '<C-y>n'
  let g:user_emmet_prev_key = '<C-y>N'
  let g:user_emmet_imagesize_key = '<C-y>i'
  let g:user_emmet_togglecomment_key = '<C-y>/'
  let g:user_emmet_splitjointag_key = '<C-y>j'
  let g:user_emmet_removetag_key = '<C-y>k'
  let g:user_emmet_anchorizeurl_key = '<C-y>a'
  let g:user_emmet_anchorizesummary_key = '<C-y>A'
  let g:user_emmet_mergelines_key = '<C-y>m'
  let g:user_emmet_codepretty_key = '<C-y>c'
<
  Or you can use following <plug> mappings:
>
  imap   <C-y>,   <plug>(emmet-expand-abbr)
  imap   <C-y>;   <plug>(emmet-expand-word)
  imap   <C-y>u   <plug>(emmet-update-tag)
  imap   <C-y>d   <plug>(emmet-balance-tag-inward)
  imap   <C-y>D   <plug>(emmet-balance-tag-outward)
  imap   <C-y>n   <plug>(emmet-move-next)
  imap   <C-y>N   <plug>(emmet-move-prev)
  imap   <C-y>i   <plug>(emmet-image-size)
  imap   <C-y>/   <plug>(emmet-toggle-comment)
  imap   <C-y>j   <plug>(emmet-split-join-tag)
  imap   <C-y>k   <plug>(emmet-remove-tag)
  imap   <C-y>a   <plug>(emmet-anchorize-url)
  imap   <C-y>A   <plug>(emmet-anchorize-summary)
  imap   <C-y>m   <plug>(emmet-merge-lines)
  imap   <C-y>c   <plug>(emmet-code-pretty)
<
  You can make the mapping affected only for a filetype you want.
>
  let g:user_emmet_install_global = 0
  autocmd FileType css imap <tab> <plug>(emmet-expand-abbr)
<
2. Indent size                                             *emmet-indent-size*

  To change indent size of html, add following code in your 'vimrc':
>
  let g:user_emmet_settings = {
  \    'html' : {
  \        'indentation' : ' '
  \    },
  \}
<
  If you prefer to change global indent size then add this:
>
  let g:user_emmet_settings = {
  \    'indentation' : ' '
  \}
<
  Filetype dependent indent size will override global indent size.

3. Define tag's behavior                          *emmet-define-tags-behavior*

  User can create abbreviations and snippets for each filetypes
  using |g:user_emmet_settings|. For details, see official site of Emmet.
  For example, user can add following:
>
  let g:user_emmet_settings = {
  \    'variables' : {
  \        'lang' : 'ja',
  \    },
  \    'html' : {
  \        'filters' : 'html',
  \        'indentation' : ' ',
  \        'expandos' : {
  \            'ol': 'ol>li',
  \            'list': 'ul>li*3',
  \        },
  \        'default_attributes': {
  \            'a': {'href': ''},
  \            'link': [{'rel': 'stylesheet'}, {'href': ''}],
  \        },
  \        'aliases': {
  \            'bq': 'blockquote',
  \            'obj': 'object',
  \            'src': 'source',
  \        },
  \        'empty_elements': 'area,base,basefont,...,isindex,link,meta,...',
  \        'block_elements': 'address,applet,blockquote,...,li,link,map,...',
  \        'inline_elements': 'a,abbr,acronym,...',
  \        'empty_element_suffix': ' />',
  \    },
  \    'perl' : {
  \        'indentation' : '  ',
  \        'aliases' : {
  \            'req' : "require '|'"
  \        },
  \        'snippets' : {
  \            'use' : "use strict\nuse warnings\n\n",
  \            'w' : "warn \"${cursor}\";",
  \        },
  \    },
  \    'php' : {
  \        'extends' : 'html',
  \        'filters' : 'html,c',
  \    },
  \    'css' : {
  \        'filters' : 'fc',
  \    },
  \    'javascript' : {
  \        'snippets' : {
  \            'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
  \            'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
  \            'fn' : "(function() {\n\t${cursor}\n})();",
  \            'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
  \        },
  \    },
  \    'java' : {
  \        'indentation' : '    ',
  \        'snippets' : {
  \            'main': "public static void main(String[] args) {\n\t|\n}",
  \            'println': "System.out.println(\"|\");",
  \            'class': "public class | {\n}\n",
  \        },
  \    },
  \}
<
  As you can see, at first level of tree are filetype names.
  The second level of tree contains definition of abbreviations, snippets and
  values of some options.
                                                               *emmet-snippet*
  Snippets are just blocks of plain code,
  just like in all programmers' editors. You can type anything there and
  it will be outputted 'as-is', without any transformation.

  Bar '|' and '${cursor}' points to cursor position.
  '${child}' points to position of children elements
  (for example, in expression 'p>span' 'span' is children of 'p').
                                                          *emmet-abbreviation*
  Emmet parses tree and retrieves the following data:
  - element name;
  - default attributes;
  - attributes' order;
  - attributes' default values;
  - should element contain closing tag.

  Let's take a closer look on HTML abbreviations' definitions above.
  The 'link' element is defined as
>
  let g:user_emmet_settings = {
       ...
  \    'html': {
           ...
  \        'default_attributes': {
               ...
               'link': [{'rel': 'stylesheet'}, {'href': ''}],
  \        },
           ...
  \        'empty_elements': '...,link,...',
  \        'block_elements': '...,link,...',
  \        'empty_element_suffix': ' />',
  \    },
       ...
  \}
<
  This definition says that tag, generated for 'link' abbreviation,
  should be named 'link' and should contain two attributes:
  'rel' with default value 'stylesheet' and 'href' with empty value
  (exactly in this order), and
  generated element should not contain closing tag.

  When the link abbreviation is expanded,
  you'll receive the following output for HTML syntax:
>
  <link rel="stylesheet" href="" />
<
  You can override default attribute values and add new ones as well:
>
  link[rel=prefetch title="Hello world"]
<
  expands to
>
  <link rel="prefetch" href="" title="Hello world" />
<                                                                *emmet-alias*
  Aliases are short-hands for commonly used abbreviations.
  Aliases can be used to define:
  - short names for long tag names;
  - referencing commonly used abbreviations.
>
  let g:user_emmet_settings = {
       ...
  \    'html': {
           ...
  \        'aliases': {
               ...
               'bq': 'blockquote',
           },
           'expandos': {
               ...
               'ol': 'ol>li',
           },
           ...
  \    },
       ....
  \}
<
  In the example above, when you expand abbreviation,
>
  bq
<
  Emmet will look for 'blockquote' abbreviation's definition.
  If it doesn't exist, it will simply output element
>
  <blockquote></blockquote>
<
  The 'ol' abbreviation actually outputs the same result as 'ol>li' does:
>
  <ol>
      <li></li>
  </ol>
<                                                               *emmet-filter*
  Filters are special post-processors that modify expanded abbreviation
  right before output to the editor. To better understand how filters work,
  let's walk through a simple tutorial.

  Try to expand the following abbreviation:
>
  #content>p.title
<
  As you may expect, it will be expanded into the following HTML code:
>
  <div id="content">
      <p class="title"></p>
  </div>
<
  Now, try to expand this abbreviation:
>
  #content>p.title|e
<
  You'll have a slightly different result:
>
  &lt;div id="content"&gt;
      &lt;p class="title"&gt;&lt;/p&gt;
  &lt;/div&gt;
<
  We've just applied 'e' (escape) filter by appending its name
  after pipe character '|'.
  This filter had escaped all XML-unsafe symbols with entities
  (see |emmet-filter-e|) right before Emmet sent output to the editor.

  Let's do something more interesting. Try to expand this abbreviation:
>
  #content>p.title|haml
<
  Result:
>
  #content
      %p.title
<
  We've just expanded abbreviation as a HAML template.

  As you can see, filtering is a key concept of Emmet. To draw an analogy
  with the browser's DOM model, every time you expand abbreviation
  it first gets transformed into a tree and
  then filter walks on each tree node and modifies its output.
  Filters can do anything: from small tweaks
  as placing whitespace after CSS-rule to more complex tasks
  as outputting result in different syntax. Even HTML output is defined
  as 'html' filter.

  You can apply filter to abbreviation explicitly,
  by adding pipe character '|' and its name right after abbreviation.
  But filters also can be applied implicitly, depending on document type
  you're currently editing. Default filters are defined to each filetype:
>
  let g:user_emmet_settings = {
       ...
  \    'html' : {
           ...
           'filters': 'html',
  \    },
  \    'css' : {
  \        'filters': 'fc',
           ...
  \    },
       ...
  \}
<
  If there's no filter specified, 'html' filter is applied by default.
  If you want to apply more than one filter by default,
  you can write a comma-separated list of filter names in filters section:
>
  let g:user_emmet_settings = {
       ...
  \    'html' : {
           ...
           'filters': 'html,e',
  \    },
       ...
  \}
<
  Now, every time you expand abbreviation in HTML document,
  'html' and 'e' filters will be applied by default.

  But be careful. You always have to place one of the filetype filter
  ('html', 'haml', etc) at first place of default filters,
  otherwise you'll have empty output because syntax filters
  are defining primary output result.

  Number of available filters listed below (|emmet-filters-list|).

4. Adding custom snippets                              *emmet-custom-snippets*

  If you have installed the |webapi| (https://github.com/mattn/webapi-vim)
  for |emmet| you can also add your own snippets
  using a custom 'snippets.json' file.

  Once you have installed the |webapi| add this line to your 'vimrc':
>
  let g:user_emmet_settings = webapi#json#decode(
  \  join( readfile( expand( '~/.snippets_custom.json' ) ), "\n" ) )
<
  You can change the path to your 'snippets_custom.json'
  according to your preferences.

  See http://docs.emmet.io/customization/snippets/
  to find instructions about creating
  your customized 'snippets.json' file.

==============================================================================
FILTERS                                                   *emmet-filters-list*

  Filter described above (see |emmet-filter|).
  Some available filters listed in the following table.
  For more details see http://docs.emmet.io/filters/ and source code.

  Filter   Description                                        Link ~
  html     Applies by default everywhere except HAML files
  haml     Applies by default for 'haml' filetype
  xsl      Applies by default for 'haml' filetype
  e        Escapes XML-unsafe characters                     |emmet-filter-e|
  c        Add comments around 'important tags'              |emmet-filter-c|
  s        Outputs as a single line                          |emmet-filter-s|
  t        Trim list markers                                 |emmet-filter-t|

  'html', 'haml', 'xsl' filters will expand filetype specific abbreviations.
  For full list of available abbreviations and snippets
  see http://docs.emmet.io/cheat-sheet/
  or file 'emmet/autoload/emmet.vim' (search for variable 's:emmet_settings').
  Also see |emmet-define-tags-behavior|.
                                                              *emmet-filter-e*
  'e' (escape) filter replace XML-unsafe characters: '<', '>' and '&'
  to entities: '&lt;', '&gt;', '&amp;'.

  For example
>
  #header|e
<
  will expand to
>
  &lt;div id="header"&gt;&lt;/div&gt;
<
                                                              *emmet-filter-c*
  'c' (comment) filter add comments around 'important tags'.
  By default, 'important tags' are those tags
  with 'id' and/or 'class' attribute.

  For example
>
  #page|c
<
  will be expanded into
>
  <!-- #page -->
  <div id="page"></div>
  <!-- /#page -->
<
  Expression
>
  p.title|c
<
  become
>
  <!-- .title -->
  <p class="title"></p>
  <!-- /.title -->
<
  More complex expression
>
  div>#page>p.title+p|c
<
  will be transformed into
>
  <div>
      <!-- #page -->
      <div id="page">
          <!-- .title -->
          <p class="title"></p>
          <!-- /.title -->
          <p></p>
      </div>
      <!-- /#page -->
  </div>
<
  To insert only second comment use the following code:
>
  let g:user_emmet_settings = {
       ...
  \    'html' : {
           ...
           'comment_type': 'lastonly',
  \    },
       ...
  \}
<
  'comment_type' default value is 'both'.
                                                              *emmet-filter-s*
  's' (single line) filter removes newline characters, so
  abbreviation will be expanded into single line:
>
  ul>li*4|s
<
  becomes to
>
  <ul><li></li><li></li><li></li><li></li></ul>
<
                                                              *emmet-filter-t*
  't' (trim) filter removes trailing whitespace characters and
  list markers, such as '1.', '2.', '3.', '-'.

  For example, do visual select (line wise) following text:
>
  1. First
  2. Second
  3. Third
<
  Then press '<C-y>,' (|emmet-wrap-with-abbreviation|) and type expression
>
  ul>li*|t
<
  Result:
>
  <ul>
      <li>First</li>
      <li>Second</li>
      <li>Third</li>
  </ul>
<
==============================================================================
LINKS                                                            *emmet-links*

Emmet official site:
  http://emmet.io/

Emmet documentation:
  http://docs.emmet.io/

Emmet cheat sheet:
  http://docs.emmet.io/cheat-sheet/

Emmet vim plugin repository:
  https://github.com/mattn/emmet-vim

  Emmet (developed since 2012) is successor of
  zen-coding (developed since 2009).

zen-coding official site:
  http://code.google.com/p/zen-coding/

zen-coding official site:
  http://code.google.com/p/zen-coding/

zen-coding vim plugin repository:
  http://mattn.github.com/zencoding-vim

zen-coding development repository:
  https://github.com/mattn/zencoding-vim

My blog posts about zencoding-vim (japanese):
  http://mattn.kaoriya.net/software/vim/20100222103327.htm
  http://mattn.kaoriya.net/software/vim/20100306021632.htm

Japanese blog posts about zencoding-vim:
  http://d.hatena.ne.jp/idesaku/20100424/1272092255
  http://d.hatena.ne.jp/griefworker/20110118/vim_zen_coding
  http://d.hatena.ne.jp/sakurako_s/20110126/1295988873
  http://looxu.blogspot.jp/2010/02/zencodingvimhtml.html

Tutorial translated in chinese:
  http://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html

==============================================================================
TODO                                                              *emmet-todo*
  * wrapping inline selected.
  * more documents.
  * more contributor.
  * more time to improve emmet.vim.

==============================================================================
vim: filetype=help expandtab textwidth=78 tabstop=8 norightleft foldenable foldlevel=0 :
