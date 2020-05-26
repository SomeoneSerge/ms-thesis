@default_files = ('hconv-poster.tex');
$pdf_previewer = 'start zathura';
$latex = 'latex  %O  --shell-escape %S';
$pdflatex=q/xelatex --shall-escape -synctex=1 %O %S/
