Variations on the `\expandafter` TeX primitive
==============================================
* E-mail: blflatex@gmail.com
* Released under the LaTeX Project Public License v1.3c or later
  See http://www.latex-project.org/lppl.txt

Every TeX programmer knows `\expandafter`, and how messy it can become
when trying to expand several times a very deeply hidden token. For
example, say we want to expand `\C` four times before `\A` and `\B` in
`\A\B\C`.  The traditional approach would be to insert 15 `\expandafter`
before `\A` and the same number before `\B`. This package allows the two
simpler codes

    \expandafter\A\expandafter\B\romannumeral\multiexpand{4}\C

or

    \expandafter\A\romannumeral\multiexpandafter{4}\B\C

In one step of expansion (triggered by the `\expandafter`'s), the
sequence `\romannumeral\multiexpand{4}` expands the following token 4
times, whereas `\romannumeral\multiexpandafter{4}` expands the token
after that 4 times.

The code behaves with braces as `\expandafter` would. Another example is

    \MultiExpandAfter{2}\a\MultiExpandAfter{3}{%
      \MultiExpandAfter{10}\b\MultiExpandAfter{10}\c\d},

which expands `\d` 10 times, then `\c` 8 times, then `\b` once.
The whole process will only take two steps of expansion.

The package can be built from the file `multiexpand.dtx' by running

    pdflatex multiexpand.dtx
    pdflatex multiexpand.dtx
    pdflatex multiexpand-example.tex

The last step is optional: it runs a series of tests.
