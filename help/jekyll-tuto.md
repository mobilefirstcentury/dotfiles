---- Jekyl tutorial ----
========================


What is i?
----------

Jekyll is a simple tool that let you have **all the cool features of a full-blown CMS without having to worry about managing a database**.
As Jekyll sites are just static files, hosting is *extremely easy* and *scalable* since all you’re doing is managing a bunch of files.

It is aimed to commmand line savy people.

Jekyll Benefits
---------------

### Simple

Jekyll is really flexible. You can build templates and write content in markdown or even just plain **HTML/CSS**.

### Static

The entire website gets compiled into a static website.
This means you can host it on any server able to serve flat files:
  - on [Github Pages](https://pages.github.com) 
  - on file storage service like [Amazon S3](https://aws.amazon.com/s3) or [Google Cloud Bucket](https://cloud.google.com/storage/docs/json_api/v1/buckets)

In the Jekyll workflow, you create new pages, posts, and templates in `markdown`, `html`, `textile`, or `liquid` files.
Those files are then compiled (or `built`) to create the actual web site (html, css, javascript)

### Scalable

As there's no database, any CDN CDN with HTML caching ([CloudFlare](https://www.cloudflare.com), [CloudFront](https://aws.amazon.com/cloudfront), etc.) will provide inifinite scalibility.


System Requirements
-------------------

### Install Ruby & Ruby Gems properly


Installation
------------

### Install Jekyll tool

    $ gem install jekyll

    # check that Jekyll is properly installed
    $ jekyll -v       


Getting Started
---------------

Create a new blog

    $ cd wherever/you/want/this/project/on/your/computer

    # The `new` command here will create an install of Jekyll with the default theme.
    $ jekyll new my-blog

    # or install a boilerplate theme 
    $ git clone https://github.com/scotch-io/scotch-io.github.io my-blog

    # Let’s jump into our new `my-blog` directory and run the `serve` command:
    $ cd my-blog
    $ jekyll serve      # This command start this server on your machine and starts *watching* your files for changes.


### “serve”, or just “s”

The serve command builds your site, boots up a development server, and starts watching files for changes by default.
Any time a change happens, it will `build` your site automatically (see below).

To run this, just do:

    $ jekyll serve

Stopping the server is as easy as:

    $ <ctrl-c>

### “build”, or just “b”

By default, whenever you `build` your 

You can generate your static site by running:

    $ jekyll build       # website is generated into a folder called `_site`.
    $ jekyll build --destination <destination>  # website is generated into <destination>
    $ jekyll build --watch    # the web site is rebuilt on file changes


Folder and Directory Overview
-----------------------------

Jekyll as a 'Framework' consists in a directory structure and a set files containing content, data and configuration.

### _config.yml

This file hosts global configurations for your entire site in [YAML format](http://yaml.org)
This configuration data is used by the `jekyll` (destination folder for instance) and can also be retrieved in templates:

    {{ site.variable_name }}

### _layouts

where you put your templates. Templates are the HTML that wrap posts and other types of content like pages.

### _includes

The 'partials' ie reusable bits of code for templates for DRY design.
for instance a header repeated in several pages is best served by an include.
### _posts

This folder contains all your posts in markdown format.
Since there’s no database, each post is a separate file formatted like so:

    YEAR-MONTH-DAY-this-is-my-title.md

### _drafts

placeholder for still unpublished blog posts.

### _plugins
[TODO] How to install & configure ?
[TODO] Dresser une liste de Plugin 'standards' qu'on installe dans tous les sites.

Plugins are added here.


**more** [list of available plugins](http://jekyllrb.com/docs/plugins/)

### index.html 

The home page.

### _site

This is the generated static website that must be served by the web serverI, it is rebuilt from scratch everytime the site is (re)generated.

### _data



The 'database' of the site: data can be hold by in `YAML`, `JSON`, or  `CSV` files


### _sass

Jekyll comes Sass-ready. 
Saas files that will be compiled by Jeckyl and served from `_site` folder.

### Any Other Files/Folders

All other files and folders is copied untouched to the static generated sitei: so serving static files (js/img/etc..) is natural.


Configuration
-------------
**note** `_config.yml` is not watched by Jekyll, so don't use it as a data store.
**note** [more information here](http://jekyllrb.com/docs/configuration/).

**what is it?**

Site’s configuration is done in `_config.yml`.
Settings declared in `_config.yml` appear in Jekyl as global variables: 

    {{ site.variable_name }}


**example**

    ```YAML

    # Where things are
    source:      .
    destination: ./_site
    plugins:     ./_plugins
    layouts:     ./_layouts
    data_source: ./_data
    collections: null

    # Handling Reading
    safe:         false
    include:      [".htaccess"]
    exclude:      []
    keep_files:   [".git", ".svn"]
    encoding:     "utf-8"
    markdown_ext: "markdown,mkdown,mkdn,mkd,md"

    # Filtering Content
    show_drafts: null
    limit_posts: 0
    future:      true
    unpublished: false

    # Plugins
    whitelist: []
    gems:      []

    # Conversion
    markdown:    kramdown
    highlighter: rouge
    lsi:         false
    excerpt_separator: "\n\n"

    # Serving
    detach:  false
    port:    4000
    host:    127.0.0.1
    baseurl: "" # does not include hostname

    # Outputting
    permalink:     date
    paginate_path: /page:num
    timezone:      null

    quiet:    false
    defaults: []

    # Markdown Processors
    rdiscount:
      extensions: []

    redcarpet:
      extensions: []

    kramdown:
      auto_ids:       true
      footnote_nr:    1
      entity_output:  as_char
      toc_levels:     1..6
      smart_quotes:   lsquo,rsquo,ldquo,rdquo
      enable_coderay: false

      coderay:
        coderay_wrap:              div
        coderay_line_numbers:      inline
        coderay_line_number_start: 1
        coderay_tab_width:         4
        coderay_bold_every:        10
        coderay_css:               style
    ```


Templating
----------

### Front Matter

**what is it?**
Front Matter is YAML located **at the top of files** for specifying page or template specific variables.

**example**
The following example specifies a page with URI './about' using layout 'page' with h1 title 'about'


    ```YAML
    ---
    layout: page
    title: About
    permalink: /about/
    ---
    ```

    ```html

    <h1>{{ page.title }}</h1>

    Lorem ipsum dolor sit amet
    ```
**more**

  - [list of defaults](http://jekyllrb.com/docs/frontmatter/).
  - [list of possible variable]((http://jekyllrb.com/docs/variables/#page-variables)

### Liquid Templates

Jekyll uses [Liquid Templating Language](https://github.com/Shopify/liquid/wiki) by [Shopify](http://shopify.com). 

**introduction**: [Liquid for Designers](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers). 

#### Includes

Include code from file in `_includes`. 

    {% include my-include.html %}

#### Echoing or Printing

    {{ variable_name }}

#### Tag Markup (doesn’t print)

    {% stuff goes here %}

#### Filters

    {{ 'i am now uppercase'|upcase }}

#### Loops

    {% for post in posts %}
        My title is {{ post.title }}
    {% endfor %}

#### Conditionals

    {% if variable_name %}
        variable_name exists
    {% else %}
        variable_name doesn't exist
    {% endif %}

Creating Pages
--------------

By default, pages can be created in root directory.
They can also be organised in their own `_pages` directory by including in `_config.yml`:

    include: ['_pages']

Then pages can be created in `_pages` directory with `.html` or `.md` extension and a front matter.


Creating Posts
--------------

Posts are special pages than go in `_posts` directory  with special convention name:

    YYYY-MM-DD-my-title-is-called-this.md

Default title and date variables are automatically created and can be overridden with a front-matter:

    ```yaml
    ---
    layout: inner
    title: 'My First Post on Jekyll'
    date: 2015-08-31 13:26:34
    categories: blog development
    tags: cats dogs code
    custom_var: 'meow meow meow'
    ---
    ```

Looping through Posts
---------------------


### Without Pagination


    ```liquid
    {% for post in site.posts %}
      
        <h2>post.title</h2>
        <div class="content">
            {{ post.content }}
        </div>

    {% endfor %}
    ```

### With Pagination

    ```html
    {% for post in paginator.posts %}
        {% include tile.html %}
    {% endfor %}
    ```


Looping through pages
---------------------

    ```liquid
    {% for node in site.pages %}
      
        <h2>node.title</h2>
        <div class="content">
            {{ node.content }}
        </div>

    {% endfor %}
    ```
  
  # each node is an object with  'front matter' variables :

 ```js
 {
  layout: "page",
  title: "About",
  permalink: "/about/",
  content:"",
  dir: "/about/",
  name: "about.md",
  path: "about.md",
  url: "/about/"
 }
 ```


Collections
-----------

### How to
1. define collections in `_config.yml` and optional meta-data
  ```yaml
  collections:
    - products
        output: true  # a specific web page will be rendered for each product
        foo: bar      # other meta-data
  ```
        
2. define default front matter attributes for members of the collection

  ```yaml
  defaults:
    - scope:
        path: "" # ie. anywhere
        type: products
      values:
        layout: product

  ```

3. create `product` layout
  - the layout of the product details pages

4. create `_products` folder in source directory 
**note** products can be deeply nested in `_products` directory (ie : `_products/bags/turkish-chanel.md`)

  - create one file per product with data in the front matter 
  - if no data, insert empty front matter
  - everything **front matter** is the content injected in the layout

  ```yaml
  ---
  title: Awsome Turkish Chanel bag
  permalink: /:collection/:title/
  variants: # here we can add arbitraray nested YAML structure 
    colors:
      - white
      - blue
      - red
    size: 
      - x
      - xl
      - xxl

  ---
  ```
5. create products list page (OPTIONAL)
  - displays all products (ie. members of the `products` collection)
  - as products are listable in templates, every structure is possible
  - for instance:
    + we can a collection for each type of product
    + have a unique 'shop' page that contains every product from every collection
    + use css to display or hide products according to dynamic search criteria


### collection urls
  - collection file `_products/bags/turkish-chanel.md` will generated web page `website.com/bags/turkish-chanel.html`
  - the url can be customized with permalink (in permalink, variable are prefixed with `:`
  - list of available variables

| VARIABLE   | DESCRIPTION                                             |
| ---        | ---                                                     |
| collection | Label of the containing collection                      |
| path       | Path to document relative to the collection's directory |
| name       | Hyphenized document's base filename                     |
| title      | Hyphenized title paramter or name if no title           |
| output_ext | Extension of the output file                            |

### Access to collections from liquid templates
  - the `products` collection is accessible in liquid with `site.products` or `site.collections.products`
  - meta-data can be read through:

| VARIABLE           | DESCRIPTION                                                                |
| ---                | ---                                                                        |
| label              | The name of your collection, e.g. products                                 |
| docs               | An array of documents                                                      |
| files              | An array of static files in the collection                                 |
| relative_directory | The path to the collection's source directory, relative to the site source |
| directory          | The full path to the collections's source directory                        |
| output             | Whether the collection's documents will be output as individual files      |


### Access to collections members document
  - each document accessed in `site.products.docs` as attributes declared in its front end plus the following attributes:

| VARIABLE      | DESCRIPTION                                                        |
| ---           | ---                                                                |
| content       | The unrendered content of the document                             |
| output        | The rendered output of the document, based on the  content         |
| path          | The full path to the document's source file                        |
| relative_path | The path to the document's source file relative to the site source |
| url           | The URL of the rendered collection (if `output` is true)           |
| collection    | The name of the document's collection                              |
  

Data files
----------

“Data files” are flat file database in `.yml`, `.yaml`, `.json`, or even `.csv` format saved `_data` directory.

Data is retrieved from pages, blogs, layouts or templates: 

    ```html                                                                                                                                             (b)
    {{ site.data.filename1.some_variable }}
    {{ site.data.filename2.another_variable }}
    ```

Assets
------
### Native Jekyll
  - '.scss', '.sass' and '.coffee'(with `jekyll-coffeescript` plugin) and even '.svg' files are processed by liquid if they have a front matter
  - generated code is placed in a `_site` directory mirroring source directory

### With Jekyll-asset plugin
[BUG]
  - Dans la version 2.1.12  ( `gem list | grep jekyll-assets | perl -pe 's/.*?(\d\.\d\.\d).*/$1/'` ):
    + les fichiers .scss.liquid ne sont jamais reconnus.
    + les fichiers .scss ayant un front matter ne sont pas reconnus
    + les fichiers .scss sans extension '.liquid' et sans front matter sont reconnus et processés (!)
    + ce comportement est indépendant de la configuration `features: liquid` dans `_config.yml` (!)


#### plugin installation
  - add `gem "jekyll-assets"` to Gemfile
  - add `- jekyll-assets` in `_config.yml`'s `gems` list

#### configuration

1. activate development environment as opposed to production environment `export JEKYLL_ENV=production`
  $ export JEKYLL_ENV=development 
2. specify configuration in `_config.yml`
```yaml
  assets:
    compress:
      css: false | true | default - development: false, production: true
      js: false | true | default - development: false, production: true
    cache: false | directory | default: .asset-cache
    cdn: https://cdn.example.com
    skip_baseurl_with_cdn: false
    skip_prefix_with_cdn: false
    prefix: "/assets"  # generated tags urls will reveive this prefix
    assets:
      - "*.css"
      - "*.scss"
      - "*.js"
      - "*.coffee"
      - "*.png"
      - "*.svg"
    digest: true | false | default - development: false, production: true
    sources:
      - _assets/css
      - _assets/images
      - _assets/javascripts
      - _assets/stylesheets
      - _assets/fonts
      - _assets/img
      - _assets/js
    features:
      liquid: true | false | default: false  # if false only files with '.liquid' extension are processed. if true ALL files are processed
      automatic_img_size: true | false | default: true
      automatic_img_alt : true | false | default: true
```

3. use special jekyll-assets tags in liquid templates 
  - html
    - image, img             | `{% img main.jpg %}` | `{% img '{{ image_path }}' %}` | `<img src="{% asset_path main.jpg %}">` | `<img src="{{ 'logo.png' | asset_path }}" alt="Logo">`
    - javascript, js         | `{% js main %}`
    - stylesheet, css, style | `{% css main %}`
    - asset, asset_source    |
    - asset_path             | `{% asset_path logo.png %}` | `{{ 'logo.png'| asset_path }}`
  - css
    - image, img             | 
    - javascript, js         | 
    - stylesheet, css, style | 
    - asset, asset_source    |
    - asset_path             | `background: url(asset_path("{{ site.background_image }}"));`  



**note**: liquid variables can be inserted in special jekyll-assets tags 

4. use dynamic assets properties
  - {{ assets["bundle.css"].content_type }} => "text/css"
  - {{ assets["images.jpg"].width  }} => 62
  - {{ assets["images.jpg"].height }} => 62

**properties list**
  - logical_path
  - content_type -> type
  - filename
  - basename
  - width
  - height

5. use filters
   - 
[TODO] liste de filtres et exemples

6. `Jekyll build | watch | serve`

**more** [here](http://jekyllrb.com/docs/datafiles/) 


Pagination
----------

### Install Jekyll-paginate plugin

**warning** pagination works only from an 'index.html' page (remember multiple index.html pages are possible in a site) . cf [pagination doc](https://jekyllrb.com/docs/pagination/)
**warning** pagination is incompatible with 'permalink' in front matter

  - declare the gem in `Gemfile`
  ```yaml
  gem "jekyll-paginate" 
  ```
  - declare the plugin: `_config.yml`
  ```yaml
  gems: [jekyll-paginate]
  ```
  - indicate number of items per page: `_config.yml`
  ```yaml
  paginate: 5
  ```
  - indicate source & destination paginated pages: `_config.yml`
  ```yaml
  paginate_path: "blog/page:num" # this will process blog/index.html 
  paginate_path: ...
  ``` 
### variables exposed to templates

| ATTRIBUTE          | DESCRIPTION                                                                    |
| ---                | ---                                                                            |
| page               | current page number                                                            |
| per_page           | number of posts per page                                                       |
| posts              | a list of posts for the current page                                           |
| total_posts        | total number of posts in the site                                              |
| total_pages        | number of pagination pages                                                     |
| previous_page      | page number of the previous pagination page, or nil if no previous page exists |
| previous_page_path | path of previous pagination page, or nil if no previous page exists            |
| next_page          | page number of the next pagination page, or nil if no subsequent page exists   |
| next_page_path     | path of next pagination page, or nil if no subsequent page exists              |


Additional Ressources
--------------------

-   [Jekyll Tipes](http://jekyll.tips/) is the best ressource available
-   [Deployment](http://jekyllrb.com/docs/deployment-methods/)
-   [GitHub Pages](https://pages.github.com/)
-   [Plugins](http://jekyllrb.com/docs/plugins/)
-   [Working with Drafts](http://jekyllrb.com/docs/drafts/)

