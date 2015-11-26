#! /usr/bin/env/perl

$latex = 'platex -synctex=1 -halt-on-error %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

if ($^O eq 'darwin') {
	$pdf_previewer = 'open -a /Applications/Preview.app';
} elsif ($^O eq 'linux') {
	$pdf_previewer = 'evince';
}
