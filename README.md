# UWletterhead — UW Letterhead LaTeX Class

A LaTeX **class** for official letters of the
**[Faculty of Mathematics, Informatics and Mechanics](https://www.mimuw.edu.pl/)** of the
**[University of Warsaw](https://en.uw.edu.pl/) (UW)**. The command `\UWheader` prints the header of
the letter (the logos of the University and of the Faculty, and up to four lines: the faculty, the
institute, the function and the person), every page gets the footer with the address, the phone
number and the e-mail address, and the commands `\UWdate`, `\UWaddressee` and `\UWsignature` place
the date, the addressee and the signature. The class is based on the standard class `letter`.

- **Website:** https://mskrzypczak.github.io/UWletterhead/
- **Manual:** https://mskrzypczak.github.io/UWletterhead/manual.pdf
- **Download** (class, logos, fonts, examples and manual in one folder): https://mskrzypczak.github.io/UWletterhead/UWletterhead.zip

> The layout follows the [Identification Codebook](https://promocja.uw.edu.pl/identyfikacja-wizualna/ksiega-identyfikacji-wizualnej/)
> of the University of Warsaw. The names of the units and of the people in the examples and in the
> templates are those of the years 2017–2020, so please check them against the current ones.

---

## Quick start

```bash
# build locally (requires latexmk); the PDF lands in dist/
latexmk -pdf examples/test.tex
# or plain pdflatex, twice (the second run puts the logos and the footer in place):
cd examples && pdflatex test && pdflatex test
```

```bash
# run the tests (from the root of the repository)
bash tests/run.sh
```

## Files

```
.
├── UWletterhead.cls             # the LaTeX class
├── manual.tex                   # the manual of the class
├── UWlogoPL.pdf, UWlogoEN.pdf   # logos of the University (Polish, English)
├── MIMlogo.pdf                  # logo of the Faculty
├── Arimo-*.ttf, Arimo-*.tfm     # the font Arimo (option arimo) and its metrics
├── T1Arimo.fd, T1-WGL4.enc      # font definition and encoding of Arimo
├── LICENSE, Arimo-LICENSE.txt   # licenses of the class and of the font
├── CHANGELOG.txt                # history of changes
├── .latexmkrc                   # latexmk config (output to dist/), also used by the workflow
├── examples/
│   ├── test.tex                 # a letter in Polish (the example on the website)
│   ├── example1.tex             # a letter in English
│   ├── example2.tex             # a two-page letter of the Dean, in Polish
│   ├── example3.tex             # an annotated example of the options and commands
│   ├── units_list.tex           # the header settings of the units of the Faculty
│   └── UWletterhead.cls, ...    # links to the class, the logos and the font files
├── templates/                   # official letterhead templates in PDF (for \UWoverlap)
├── tests/                       # the tests: run.sh and the test documents
├── site/index.html, logo.png    # the website
└── .github/workflows/latex.yml  # GitHub Actions: test, build & publish
```

## GitHub Actions

On every **push** and **pull request** (and when started by hand):
- Puts the date of the build and the contents of `test.tex`, `example3.tex`, `UWletterhead.cls` and
  `CHANGELOG.txt` into the website
- Runs the tests (`tests/run.sh`)
- Builds PDFs from `manual.tex` and from the examples `test.tex`, `example1.tex`, `example2.tex` and
  `example3.tex`
- Bundles the class with its logos and fonts, the examples, the manual, the licenses and
  `CHANGELOG.txt` into the folder `UWletterhead/` and into `UWletterhead.zip` and
  `UWletterhead.tar.gz`, and the templates into `templates.zip` and `templates.tar.gz`
- Converts `test.pdf` into the picture `test.svg` shown on the website
- Uploads the PDFs as build artifacts
- Publishes the website, the PDFs, the bundle and the templates to **GitHub Pages** (from `main` only)

### Badges
[![Build LaTeX](https://github.com/mskrzypczak/UWletterhead/actions/workflows/latex.yml/badge.svg)](https://github.com/mskrzypczak/UWletterhead/actions/workflows/latex.yml)

> In a fork, go to **Settings → Pages** and ensure “Build and deployment” is set to **GitHub Actions**.

## Using the class

Keep your `.tex` file next to `UWletterhead.cls`, the logos (`UWlogo*.pdf`, `MIMlogo.pdf`) and, for
the option `arimo`, the font files (`Arimo-*.ttf`, `Arimo-*.tfm`, `T1Arimo.fd`, `T1-WGL4.enc`), as in
the folder `UWletterhead/` of the download, and run pdfLaTeX twice: the second run puts the logos,
the footer and the page numbers in place. For example, `examples/example1.tex`:

```latex
\documentclass[11pt, english]{UWletterhead}

\renewcommand{\UWinstitute}{Institute of Informatics}

\renewcommand{\UWphone}{+48 22 55 44 460}
\renewcommand{\UWemail}{iinf@mimuw.edu.pl}

\begin{document}
\UWheader

\UWdate{Warsaw, \today}

\UWaddressee[0.6\textwidth]{Prof. Donald Knuth}

Dear Professor Knuth,

I write to you according to the conversation\ldots

\UWsignature[0.6\textwidth]{Yours Sincerely,\\[5mm]Micha{\l} Skrzypczak}

\end{document}
```

The options, the commands and the layout are described in the
[manual](https://mskrzypczak.github.io/UWletterhead/manual.pdf).

## License

The class and the examples are under the MIT license — see `LICENSE`. The Arimo fonts
(`Arimo-*.ttf`, with their metrics `Arimo-*.tfm`) were designed by Steve Matteson, are copyrighted
by Google and are licensed under the Apache License 2.0 — see `Arimo-LICENSE.txt`. The logos of the
University and of the Faculty (`UWlogo*.pdf`, `MIMlogo.pdf`) and the official templates in
`templates/` belong to the University of Warsaw and are to be used according to its
[visual identification rules](https://promocja.uw.edu.pl/identyfikacja-wizualna/).
