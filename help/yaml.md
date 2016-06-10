---- YAML USer Guide ----
=========================

Tools
-----

### yaml2json/json2yaml

#### what is it?
tool to convert to and from yaml/json on the CLI, on node and in the browser

#### install 
  ```sh
  # from [github repo](https://github.com/jeremyfa/yaml.js)
  $ npm install yamljs -g
  ```

#### cli use
two cli commands are available: yaml2json & json2yaml

##### yaml2json
  ```sh
  # Convert YAML to JSON and output resulting JSON on the console
  yaml2json myfile.yml

  # convert YAML to JSON from input to output 
  echo 'foo:bar' | yaml2json -

  # Store output inside a JSON file
  yaml2json myfile.yml > ouput.json

  # Output "pretty" (indented) JSON
  yaml2json myfile.yml --pretty

  # Save the output inside a file called myfile.json
  yaml2json myfile.yml --pretty --save

  # Watch a full directory and convert any YAML file into its JSON equivalent
  yaml2json mydirectory --pretty --save --recursive

  ```

##### json2yaml
**note** no '--pretty' option on json2yaml since yaml is pretty by design

  ```sh
  # Convert JSON to YAML and store output inside a JSON file
  json2yaml myfile.json > ouput.yml

  # convert JSON to YAML from input to output 
  echo '{"foo":"bar"}' | json2yaml -

  # Output YAML that will be inlined only after 8 levels of indentation
  json2yaml myfile.json --depth 8

  # Save the output inside a file called myfile.json with 4 spaces for each indentation
  json2yaml myfile.json --indentation 4

  # Watch a full directory and convert any JSON file into its YAML equivalent
  $ json2yaml mydirectory --save --recursive
  ```

#### browser use
see [doc](https://github.com/jeremyfa/yaml.js)


### yaml

A YAML cli to query yaml files that also allows template processing.

#### install
  ```sh
  $ npm install -g yaml-cli
  ```
#### Conversion
  # convert a YAML file to JSON
  $ yaml json write file.yml > file.json
  
  # convert JSON file to YAML
  $ yaml json read file.json > file.yml

#### Querying

**example**

  ```yaml
  # data.yml
  ---
  foo:
    bar: 7
    baz:
      - 17
      - "hello word"
  ---
  ```
  
  ```sh
  # get object value
  $ yaml get data.yml foo.bar
  -> 
  7

  # get array value
  $ yaml get data.yml foo.baz.1
  ->
  hello word

  # set value 
  $ yaml set data.yml foo.baz.1 goodbye
  # the file is not modified
  ->
  foo:
    bar: 7
    baz:
      - 17
      - "goodbye"
  ```

#### Templating

Use yaml-cli to create templatable docker files.

1. create template file
```yaml
# in file dockerfile.template
# ---
FROM nginx
COPY {{root}} /usr/share/nginx/html
```
2. create a yaml config file holding instanciation values

```yaml
# in config.yml
root: "build"
```

3. generate real Docker File
  ```sh
  $ yml template config.yml dockerfile.template
  ```


yaml specs
----------
YAML is a data serialization format.
It is a super-set of JSON (.ie JSON format is valid YAML)

### Begining & Ends of YAML Document
  `---` | begining of document
  `...` | end of document (optional -- implicit before a new `---`)

### Comment
  ```yaml
  # this is a comment
  ```

### Arrays (list, sequence)

```yaml
- Mark McGwire
- Sammy Sosa
- Ken Griffey
```
or

```yaml
[ Mark McGwire, Sammy Sosa, Ken Griffey ] 
```

### Object (mapping, associative array)

```yaml
hr  : 65    # Home runs
avg : 0.278 # Batting average
rbi : 147   # Runs Batted In
```
or

```yaml
{ hr: 65, avg: 0.278, rbi: 147 }
```

### Array of Objects
```yaml
-
 name: Mark McGwire
 hr: 65
 avg: 0.278
-
 name: Sammy Sosa
 hr: 63
 avg: 0.288
```
or in a compact form :

```yaml
- name : Mark McGwire
  hr   : 65
  avg  : 0.278
- name : Sammy Sosa
  hr   : 63
  avg  : 0.288
```


### Literal Strings

`|` operator defines literal strings  (newlines are preserved)

```yaml

ascii_art: |

\  // | \/ | ||
 \//  ||\/|| ||
 //   ||  || ||__
//    ||  || |___|

content: yml
```

`>` defines folded strings (newlines become spaces)

```yaml
news : >
 Mark McGwire's
 year are crippled
 by a knee injury.

reaction: I'm sorry for him
```
but newlines are preserved with blank lines and 'rigth' indentation...

```yaml
news: >

 Sammy Sosa completed another
 fine season with great stats.

    63 Home Runs
    0.288 Batting Average
 
 What a year!

reaction: WOW!
```
### quoted strings
double quotes are needed to escape non printable characters

```yaml
unicode: "Sosa did fine.\u263A"
```



### Mappings with complexs keys
Complex keys are possible in mappings with the `? ` (question mark space) operator:

```yaml

? - Detroit Tigers
  - Chicago cubs
:
 - 2001-07-23
```
or 

```yaml
? [ New York Yankees, Atlanta Braves ] : [ 2001-07-02, 2001-08-12, 2001-08-14 ]
```


### Label and reference

Every node can be label and referenced back in the document

```yaml
employes:
 - Mark McGwire
 # Following node labeled with its trigram
 - &SSO Sammy Sosa
managers:
 - *SSO # Subsequent occurrence
 - Ken Griffey
```

### Tags


