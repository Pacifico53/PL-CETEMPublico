BEGIN {
	print "Vou começar"
	print "<h1 align='center'> Processador de CETEMPúblico </h1>\n" > "index.html"
	link = "<li><a href=\"%s\">%s</a><br><hr></li>\n"
	printf(link,"alineaA.html","Extratos, Parágrafos e Frases") > "index.html"
	printf(link,"alineaB.html","Multi-Word-Expressions") > "index.html"
	printf(link,"alineaC.html","Lista dos Verbos PT") > "index.html"
	printf(link,"alineaD.html","Dicionário implícito no Córpora") > "index.html"
	print "<h1 align='center'> Número de Extratos, Parágrafos e Frases </h1>\n" > "alineaA.html"
	print "<h1 align='center'> Multi-Word-Expressions </h1>\n" > "alineaB.html"
	print "<h1 align='center'> Lista dos Verbos PT </h1>\n" > "alineaC.html"
	print "<h1 align='center'> Dicionário implícito no Córpora </h1>\n" > "alineaD.html"

	printf(link,"alineaB1.html","Lista de Mwe") > "alineaB.html"
	printf(link,"alineaB2.html","Número de Ocorrências") > "alineaB.html"




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
/<ext.*>/  { 
			nExtratos++;
		}
/<p.*>/   { 
			nParagrafos++;
		}
/<s.*>/   { 
			nFrases++;
		}
/<mwe.*>/ {
		    getline;
			print "<p>" > "alineaB1.html"
			for(i=0; ($1 != "</mwe>"); i++){
			 	arr[$i] = $1;
			 	print $1 > "alineaB1.html"
				getline;
			 	};
			nMWE++;
			print "</p><hr>" > "alineaB1.html"
			delete arr;
		}

/.*/{

	if($5 == "V"){
		
		if(! a[$4]) {
			nVerbos++
			a[$4]=1
		} 
		else {
			a[$4]++
		}	
	}	

		if($5 != "PU" && (index($5, "NUM")!=0)&& $5 != ""){
			if(!ar[$1]){
				ar[$1]=1;	
				print "<p> Palavra: " $1 "; Lema: " $4 "; Pos: " $5 "</p>" > "alineaD.html"
			}	
		}

}

END {
    print "Extratos " nExtratos
    print "Paragrafos: " nParagrafos
    print "Frases: " nFrases
    print "<p> Número de Extratos: " nExtratos "</p> <p> Número de Paragrafos: " nParagrafos "</p> <p> Número de Frases: " nFrases > "alineaA.html"
    
    print "MWE: " nMWE
    print "Número de Multi-Word-Expressions: " nMWE > "alineaB2.html"
    print "Verbos: " nVerbos
    for( k in a){
		print "<p> Verbo: " k " Numero de Ocorrências: " a[k] > "alineaC.html"
	}
	print "Terminei"
}
