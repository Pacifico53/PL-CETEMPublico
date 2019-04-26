BEGIN {
	print "<h1 align='center'> Cetem </h1>\n" > "index.html"
    nExtratos = 0;
    nParagrafos = 0;
    nFrases = 0;
    nMWE = 0;
    nVerbos = 0;
    fazer = 0;
    ser = 0;
    haver = 0;
    estar = 0 ;
}
#/<ext.*>/  { print $0; nExtratos++;}
#/<p.*>/   { print $0; nParagrafos++;}
#/<s.*>/   { print $0; nFrases++;}
/<mwe.*>/ {  getline;
			 print "<p>Inicio: " > "index.html"
			 while($1 != "</mwe>"){
			 	i=0;
			 	arr[$i] = $1;
			 	i++;
			 	print $1 > "index.html"
			 	#print $1;
				getline;
			 	};
			nMWE++;
			#for( key in arr){ printf "%s ", arr[key] }
			print "\n";
			delete arr;
			i=0;}

#expressao pa verificar todo o ficheiro?
/.*/{if($5 == "V"){
	#print $4;
	j=0;
	while($4 != arrr[j] && j<nVerbos) j++;

	if(j==nVerbos){
		arrr[nVerbos] = $4;
		nVerbos++;
		}
	if($4 == "fazer") fazer++;
	if($4 == "ser") ser++;
	if($4 == "haver") haver++;
	if($4 == "estar") estar++;

	}
	#alinea d) sem contar com repetiçoes
	#printf "palavra: %s, Lema: %s, Pos: %s \n" , $1, $4, $5;
}

END {
    print "Extratos " nExtratos
    print "Paragrafos: " nParagrafos
    print "Frases: " nFrases
    print "MWE: " nMWE
    print "Verbos: " nVerbos
    print "n vezes: " fazer
    print "ser: " ser
    print "haver: " haver
    print "estar: " estar
}
