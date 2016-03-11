---- Date Object CheatSheet ----
================================

[Source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)

## 1. Instantiating a Date.


var date = new Date();
var date = new Date(milliseconds);
var date = new Date(dateString);
var date = new Date(year, month, day, hours, minutes, seconds, milliseconds);


## 2. Date Object Properties.


date.constructor;  // Returns the function that created the Date object's prototype.
date.prototype;    // Allows you to add properties and methods to an object.


## 3. Date Object Methods.


date.getDate();             // Returns the day of the month (from 1-31).
date.getDay();              // Returns the day of the week (from 0-6).
date.getFullYear();         // Returns the year (four digits).
date.getHours();            // Returns the hour (from 0-23).
date.getMilliseconds();     // Returns the milliseconds (from 0-999).
date.getMinutes();          // Returns the minutes (from 0-59).
date.getMonth();            // Returns the month (from 0-11).
date.getSeconds();          // Returns the seconds (from 0-59).
date.getTime();             // Returns the number of milliseconds since midnight Jan 1, 1970.
date.getTimezoneOffset();   // Returns the time difference between UTC time and local time, in minutes.

date.getUTCDate();          // Returns the day of the month, according to universal time (from 1-31).
date.getUTCDay();           // Returns the day of the week, according to universal time (from 0-6).
date.getUTCFullYear();      // Returns the year, according to universal time (four digits).
date.getUTCHours();         // Returns the hour, according to universal time (from 0-23).
date.getUTCMilliseconds();  // Returns the milliseconds, according to universal time (from 0-999).
date.getUTCMinutes();       // Returns the minutes, according to universal time (from 0-59).
date.getUTCMonth();         // Returns the month, according to universal time (from 0-11).
date.getUTCSeconds();       // Returns the seconds, according to universal time (from 0-59).

date.setDate(day);                           // Sets the day of the month of a date object.
date.setFullYear(year, month, day);          // Sets the year (four digits) of a date object.
date.setHours(hour, min, sec, millisec);     // Sets the hour of a date object.
date.setMilliseconds(millisec);              // Sets the milliseconds of a date object.
date.setMinutes(min, sec, millisec);         // Set the minutes of a date object.
date.setMonth(month, day);                   // Sets the month of a date object.
date.setSeconds(sec, millisec);              // Sets the seconds of a date object.
date.setTime(millisec);                      // Sets a date and time by adding or subtracting a specified number of milliseconds to/from midnight January 1, 1970.

date.setUTCDate(day);                        // Sets the day of the month of a date object, according to universal time.
date.setUTCFullYear(year, month, day);       // Sets the year of a date object, according to universal time (four digits).
date.setUTCHours(hour, min, sec, millisec);  // Sets the hour of a date object, according to universal time.
date.setUTCMilliseconds(millisec);           // Sets the milliseconds of a date object, according to universal time.
date.setUTCMinutes(min, sec, millisec);      // Set the minutes of a date object, according to universal time.
date.setUTCMonth(month, day);                // Sets the month of a date object, according to universal time.
date.setUTCSeconds(sec, millisec);           // Set the seconds of a date object, according to universal time.

date.toDateString();        // Converts the date portion of a Date object into a readable string.
date.toISOString();         // Returns the date as a string, using the ISO standard.
date.toJSON();              // Returns the date as a string, formatted as a JSON date.
date.toLocaleDateString();  // Returns the date portion of a Date object as a string, using locale conventions.
date.toLocaleTimeString();  // Returns the time portion of a Date object as a string, using locale conventions.
date.toLocaleString();      // Converts a Date object to a string, using locale conventions.
date.toString();            // Converts a Date object to a string.
date.toTimeString();        // Convert the time portion of a Date object to a string.
date.toUTCString();         // Converts a Date object to a string, according to universal time.
date.valueOf();             // Returns the primitive value of a Date object.


## 4. Date Object Static Methods.


Date.parse(datestring);  // Parses a date string and returns the number of milliseconds since midnight of January 1, 1970.
Date.UTC(year,month,day,hours,minutes,seconds,millisec);  // Returns the number of milliseconds in a date string since midnight of January 1, 1970, according to universal time.
