TestPDF

Purpose
-------
Test code for OS X if PDFPage class's -characterBoundsAtIndex: API can obtain character's
bounds rectangle correctly.

LICENSE
-------
MIT

Target
------
OS X 10.9.2
Xcode 5.1.1

Features
--------
* Able to open PDF and display each characters glyph location on pages.
* Display characters of all text when you click on a PDF page view
* Click on a glyph, to select text view corresponding to the character
* Select on part of text, to display indication of selected glyph ovals

Main Classes
------------

* TSPDFView
Subclass of PDFView. By overriding drawPage methods, it displays overlaid ovals on each 
characters, to make visible of characterBoundsAtIndex API.

Comment
-------
It look good on some English PDFs, but I feel PDFPage's characterBoundsAtIndex
is not acculare enough especially vertical text such as Japanese.

Author
------
Kaz Yoshikawa


