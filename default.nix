{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;

let
  myTexlive = with pkgs.texlive; (combine {
    inherit (pkgs.texlive)
    scheme-medium
    latexmk
    cm-unicode  hitec
    biblatex biber
    wrapfig multirow todonotes
    booktabs siunitx doi
    cleveref catoptions fancyhdr
    float ulem datetime glossaries
    subfigure 
    tcolorbox epigraph appendix
    fmtcount mfirstuc xfor datatool environ
    trimspaces listingsutf8 nextpage;
  });
  fontsConf = pkgs.makeFontsConf {
    fontDirectories = [ 
      "${myTexlive}/share/texmf/"
    ];
  };
in
{
  thesis = stdenv.mkDerivation {
    name = "ms-thesis.pdf";
    buildInputs = [myTexlive];
    FONTCONFIG_FILE = fontsConf;
    src = ./.;
    buildPhase = ''
      (cd script && latexmk -xelatex msc-thesis.tex)
    '';
    installPhase = ''
      install -m444 script/msc-thesis.pdf $out
    '';
  };
}
