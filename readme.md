# Elephant

##Overview

Elephant is application for reading commands from `input.txt` file execute them for creating different shapes and write result to `output.txt`

#### Setting gems

```sh
$ bundle install
```

#### Run Application:

```sh
$ ruby app.rb
```

#### Drawing commands

Сommands for drawing are in the `inputs.txt`

```
 C 20 4
 L 1 2 6 2
 L 6 3 6 4
 L 8 1 8 10
 R 16 1 20 3
 R 10 0 14 2
 B 10 3 o
 B 1 4 *
```

#### Drawing result

Drawing result are in `output.txt`

```

----------------------
|                    |
|                    |
|                    |
|                    |
----------------------

----------------------
|                    |
|XXXXXX              |
|                    |
|                    |
----------------------

----------------------
|                    |
|XXXXXX              |
|     X              |
|     X              |
----------------------

----------------------
|       X            |
|XXXXXX X            |
|     X X            |
|     X X            |
----------------------

----------------------
|       X       XXXXX|
|XXXXXX X       X   X|
|     X X       XXXXX|
|     X X            |
----------------------

----------------------
|       X X   X XXXXX|
|XXXXXX X XXXXX X   X|
|     X X       XXXXX|
|     X X            |
----------------------

----------------------
|       XoX   XoXXXXX|
|XXXXXX XoXXXXXoX   X|
|     X XoooooooXXXXX|
|     X Xoooooooooooo|
----------------------

----------------------
|       XoX   XoXXXXX|
|XXXXXX XoXXXXXoX   X|
|*****X XoooooooXXXXX|
|*****X Xoooooooooooo|
----------------------

```

