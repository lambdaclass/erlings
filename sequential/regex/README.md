regex
=====

Create a function `match/2` that will receive a string and a regex (also a string), and return `true` if it matches or `false` otherwise. 

You won't be using all of Regex, just a small subset of it as follows:


| Syntax        | Meaning                                     | Example  | Matches        | 
| ------------- |:-------------------------------------------:| :------: | :------------: |
| a             | match the specified character               |    k     |       k        |
| .             | matches any character (except newline)      |    .     | a,b,c,d...     |
| ?             | matches 0 or 1 of the previous character    |    aq?   |   a, aq        |
| *             | matches 0 or more of the previous character |    b*    | "", b, bb, bbb |
| ^             | matches the start of a string               |    ^ca   |      ca        |
| $             | matches the end of a string                 |    eb$   |      eb        |


### Considerations

* The given regex won't be invalid (Eg: `"^*"`, `"*?"`)
* I can ignore the existance of the newline character since I expect simple strings as inputs. Thus the character `.` matches anything
* An empty regex matches nothing so `match(SomeString, EmptyRegex)` will return false
* `match/2` can return true as soon it matches something since I don't care about where or what.
