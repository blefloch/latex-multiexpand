Variations on the `\expandafter` TeX primitive
==============================================
* E-mail: blflatex@gmail.com
* Released under the LaTeX Project Public License v1.3c or later
  See http://www.latex-project.org/lppl.txt

The package defines `\multiexpand`, `\multiexpandafter`, `\MultiExpand`
and `\MultiExpandAfter`, replacing large chains of `\expandafter`.
These four commands take as an argument the number of expansion to be
done.  If eTeX is available, this number is evaluated using `\numexpr`.

Say we want to expand `\C` five times before `\A` and `\B` in `\A\B\C`.
The traditional approach would be to insert 31 `\expandafter` before
`\A` and the same number before `\B`.  With this package one can use
any of

    \expandafter\A\expandafter\B\romannumeral\multiexpand{5}\C

    \expandafter\A\romannumeral\multiexpandafter{5}\B\C

    \MultiExpandAfter{2}\A\MultiExpandAfter{5}\B\C

    \MultiExpandAfter{2}\A\MultiExpandAfter{2}\B\MultiExpand{5}\C

In one step of expansion (triggered by the `\expandafter`'s),
`\romannumeral\multiexpand{5}` expands the following token 5 times,
whereas `\romannumeral\multiexpandafter{5}` expands the token after
that 5 times.  The macros `\MultiExpandAfter` and `\MultiExpand`
take two steps of expansion, but do not require `\romannumeral`.
Another example is that in two steps of expansion,

    \MultiExpandAfter{2}\a\MultiExpandAfter{3}{%
      \MultiExpandAfter{9}\b\MultiExpandAfter{10}\c\d}

expands `\d` 10 times, then `\c` 7 times (9-2), then `\b` once (3-2).

The package can be built from the file `multiexpand.dtx' by running

    pdflatex multiexpand.dtx
    pdflatex multiexpand.dtx

