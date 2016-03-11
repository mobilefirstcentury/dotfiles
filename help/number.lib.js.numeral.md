---- Numeral.js Number Formating lib doc ----
=============================================

A javascript library for formatting and manipulating numbers.

[** Github](https://github.com/adamwdraper/Numeral-js) [**
.ZIP](https://github.com/adamwdraper/Numeral-js/zipball/master) [**
.TGZ](https://github.com/adamwdraper/Numeral-js/tarball/master)

Language Chinese Czech Danish Dutch (Belgium) English English (Great
Britain) Finnish French German Italian Japanese Portuguese (Portugal)
Portuguese (Brazil) Russian Spanish Thai Turkish

### Use it

#### In the Browser

    <script src="numeral.min.js"></script>

or include from cdnjs.com

    <script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/1.4.5/numeral.min.js"></script>

#### In Node.js

    npm install numeral

    var numeral = require('numeral');

### Format

Numbers can be formatted to look like currency, percentages, times, or
even plain old numbers with decimal places, thousands, and
abbreviations.

    var string = numeral(1000).format('0,0');
    // '1,000'

#### Numbers

Number

Format

String

#### Currency

Number

Format

String

#### Bytes

Number

Format

String

#### Percentages

Number

Format

String

#### Time

Number

Format

String

### Unformat

Got a formatted string? Use the unformat function to make it useful
again.

    var string = numeral().unformat('($10,000.00)');
    // -10000

String

Function

Number

### Manipulate

Not that you will use these often, but they're there when you need them.

    var number = numeral(1000);

    var added = number.add(10);
    // 1010

Before

Function

After

### Value

The value is always available.

    var number = numeral(1000);

    var string = number.format('0,0');
    // '1,000'

    var value = number.value();
    // 1000

### Set

Set the value of your numeral object.

    var number = numeral();

    number.set(1000);

    var value = number.value();
    // 1000

### Difference

Find the difference between your numeral object and a value

    var number = numeral(1000),
        value = 100;

    var difference = number.difference(value);
    // 900

### Default Formatting

Set a default format so you can use .format() without a string. The
default format to '0,0'

    var number = numeral(1000);

    number.format();
    // '1,000'

    numeral.defaultFormat('$0,0.00');

    number.format();
    // '$1,000.00'

### Custom Zero Formatting

Set a custom output when formatting numerals with a value of 0

    var number = numeral(0);

    numeral.zeroFormat('N/A');

    var zero = number.format('0.0')
    // 'N/A'

### Clone

Go ahead and clone any numeral object while you're at it.

    var a = numeral(1000);
    var b = numeral(a);
    var c = a.clone();

    var aVal = a.set(2000).value();
    // 2000

    var bVal = b.value();
    // 1000

    var cVal = c.add(10).value();
    // 1010

### Languages

Lets make this useable all over the place!

    // load a language
    numeral.language('fr', {
        delimiters: {
            thousands: ' ',
            decimal: ','
        },
        abbreviations: {
            thousand: 'k',
            million: 'm',
            billion: 'b',
            trillion: 't'
        },
        ordinal : function (number) {
            return number === 1 ? 'er' : 'ème';
        },
        currency: {
            symbol: '€'
        }
    });

    // switch between languages
    numeral.language('fr');

As I am not fluent in every language on the planet, please feel free to
create language files of your own by submitting a pull request. Don't
forget to create both the language file (example: languages/fr.js) and
the language test (example: tests/languages/fr.js). Thanks for helping
out.

### Acknowlegements

Numeral.js, while less complex, was inspired by and heavily borrowed
from [Moment.js](http://momentjs.com/)

This is a project by [adamwdraper](http://github.com/adamwdraper)
