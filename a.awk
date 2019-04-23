BEGIN {
    nExtratos = 0;
    nParagrafos = 0;
    nFrases = 0;
}
/<ext.*>/  { print $0; nExtratos++;}
/<p.*>/   { print $0; nParagrafos++;}
/<s.*>/   { print $0; nFrases++;}
END {
    print "Extratos " nExtratos
    print "Paragrafos: " nParagrafos
    print "Frases: " nFrases
}
