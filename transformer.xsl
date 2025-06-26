<?xml version="1.0" encoding="UTF-8"?>

<!-- 
	COMANDO TERMINALE OUTPUT XML:
	cd saxon
	java -jar saxon-he-12.5.jar -s:..\La_Rassegna.xml -xsl:..\transformer.xsl -o:..\Rassegna.html 
-->

<!--STANDARD XML-->
<!--FOGLIO DI STILE XSLT-->
<!--version="2.0" VERSIONE DEL LINGUAGGIO 2.0-->
<!--xmlns:xsl="http://www.w3.org/1999/XSL/Transform" NAMESPACE DI XSLT ASSOCIATO AL PREFISSO xsl-->
<!--xmlns:tei="http://www.tei-c.org/ns/1.0" NAMESPACE TEI P5 ASSOCIATO AL PREFISSO tei-->
<!--xmlns="http://www.w3.org/1999/xhtml" NAMESPACE DI DEAFULT PER GLI ELEMENTI IN OUTPUT (TUTTI GLI ELEMENTI SENZA PREFISSO SARANNO CONSIDERATI HTML)-->
<xsl:stylesheet 
    version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <!--TEMPLATE ROOT DEL FILE-->
	<xsl:template match="/">
        <!--HTML-->
		<html>
            <!--HEAD HTML-->
			<head>
                <!--TITOLO DEL DOCUMENTO-->
				<title>
					<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
				</title>
                <!--META E LINK-->
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
				<link rel="icon" type="image/png" href="img/logo-unipi.png"/>
				<link rel="stylesheet" type="text/css" href="style.css"/>
				<script src="script.js"></script>
			</head>
            <!--BODY-->
			<body>
				<!-- NAVBAR -->
				<nav class="navbar navbar-expand-lg">
					<div id="navbar" class="container-fluid">
						<div class="logo-box">
							<img id="logo" src="img/logo-unipi.png" alt="Logo"/>
						</div>
						<a class="navbar-brand" href="#">
							<p id="titolo">Progetto Codifica di Testi</p>
						</a>
						<button id="openBTN" class="navbar-toggler" type="button">
							<span class="navbar-toggler-icon">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</span>
						</button>
						<ul class="navbar-nav desktop-nav">
							<li class="nav-item">
								<a class="nav-link" href="#presentazione">La Rassegna</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#box-articolo1">Destra e Sinistra</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#box-articolo2">La legge sull'istruzione obbligatoria</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#box-articolo3">Sull'incremento del delitto in Italia</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#box-bibliography">Bibliografie</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#box-news">Notizie</a>
							</li>
						</ul>
						<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="titoloOFF">
							<div class="offcanvas-header">
								<img id="logo-interno" src="img/logo-unipi.png" alt="Logo"/>
								<span id="closeButton" aria-label="Close" class="close">x</span>
							</div>
							<div class="separator"></div>
							<div class="offcanvas-body">
								<ul id="ul" class="navbar-nav">
									<li class="nav-item">
										<a class="nav-link" href="#presentazione">La Rassegna</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#box-articolo1">Destra e Sinistra</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#box-articolo2">La legge sull'istruzione obbligatoria</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#box-articolo3">Sull'incremento del delitto in Italia</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#box-bibliography">Bibliografie</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#box-news">Notizie</a>
									</li>
								</ul>
								<div class="separator2"></div>
							</div>
						</div>
					</div>
				</nav>
                <!--LIGUETTA PER APRIRE MENU EVIDENZIA-->
				<div class="hover-trigger"></div>
                <!--MENU EVIDENZIA-->
				<div id="sidebar-evidenzia">
					<div class="evidenzia-section">
						<h4>Bottoni a scelta singola</h4>
						<div class="btn-container">
							<button id="need_explanation" class="highlight-btn">Spiegazioni 
								<i class="fas fa-magnifying-glass"></i>
							</button>
							<button id="verbum" class="highlight-btn">Verbum</button>
							<button id="central_theme" class="highlight-btn">Temi centrali</button>
						</div>
					</div>
					<div class="evidenzia-section">
						<h4>Bottoni a scelta multipla</h4>
						<div class="btn-container">
							<button id="num" class="highlight-btn">Numeri</button>
							<button id="date" class="highlight-btn">Date</button>
							<button id="place" class="highlight-btn">Luoghi 
								<i class="fas fa-magnifying-glass"></i>
							</button>
							<br/>
							<button id="persName_real" class="highlight-btn">Personaggi reali 
								<i class="fas fa-magnifying-glass"></i>
							</button>
							<button id="persName_fictional" class="highlight-btn">Personaggi fittizzi</button>
							<button id="occupation" class="highlight-btn">Ruolo nella società</button>
							<button id="org" class="highlight-btn">Organizzazioni</button>
							<br/>
							<button id="term_politici" class="highlight-btn">Termini politici</button>
							<button id="term_juridical" class="highlight-btn">Termini giuridici</button>
							<button id="term_literature" class="highlight-btn">Termini letterari</button>
							<button id="foreign" class="highlight-btn">Parole straniere</button>
							<button id="satirical" class="highlight-btn">Parole satiriche</button>
							<button id="metaphorical" class="highlight-btn">Parole metaforiche</button>
							<br/>
							<button id="law" class="highlight-btn">Leggi 
								<i class="fas fa-magnifying-glass"></i>
							</button>
							<button id="literature_work" class="highlight-btn">Opere</button>
							<br/>
							<button id="quote" class="highlight-btn">Citazioni</button>
							<button id="speech" class="highlight-btn">Discrsi diretti/indiretti</button>
							<br/>
							<button id="orig" class="highlight-btn">Normalizzazioni 
								<i class="fas fa-magnifying-glass"></i>
							</button>
							<button id="sic" class="highlight-btn">Correzioni 
								<i class="fas fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
                <!--BOTTONE PER IMMAGINI/TESTO-->
				<button class="scopricodifica">Mostra Immagini</button>
				<!--APPLY TEMPLATE DEL TEIHEADER-->
				<xsl:apply-templates select="tei:TEI/tei:teiHeader"/>
				<!--APPLY TEMPLATE DEL GROUP-->
				<xsl:apply-templates select="tei:TEI/tei:text/tei:group"/>
				<!--FOOTER-->
				<footer class="site-footer">
					<div class="container">
						<p>
						<strong>Creato da: </strong>

							<!--DICHIARO DUE VARIABILI P1 E P2 CHE RAPPRESENTANO I DUE PERSNAME -->
							<xsl:variable name="p1" select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[1]"/>
							<xsl:variable name="p2" select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[2]"/>

							<!-- ESTRAGGO IL NOME E IL LINK DI P1 -->
							<xsl:value-of select="$p1/text()"/>
							<xsl:if test="$p1/@ref">
						<xsl:text> (</xsl:text>
							<a href="{$p1/@ref}">Profilo GitHub</a>
						<xsl:text>)</xsl:text>
						</xsl:if>

						<xsl:text> e </xsl:text>

							<!-- ESTRAGGO IL NOME E IL LINK DI P2 -->
							<xsl:value-of select="$p2/text()"/>
							<xsl:if test="$p2/@ref">
						<xsl:text> (</xsl:text>
							<a href="{$p2/@ref}">Profilo GitHub</a>
						<xsl:text>)</xsl:text>
						</xsl:if>

						<br/>
						<strong>Presso: </strong>
						<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/>,
						<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>
						(<xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>)
						<br/>
						
						</p>
					</div>
				</footer>
			</body>
		</html>
	</xsl:template>
	<!--TEI HEADER-->
	<xsl:template match="tei:teiHeader">
		<div class="box-container" id="presentazione">
            <!--TITOLO PRIMO DIV-->
			<h1>
                <!--APPLY TEMPLATE DEL TITLE-->
				<xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
			</h1>
            <!--BOX DEI RESPONSABILI-->
			<div class="conversione-tei">
				<h2>Conversione TEI P5 a cura di:</h2>
                <!--APPLY TEMPLATE DEL RESPSTMT-->
				<xsl:apply-templates select="tei:fileDesc/tei:titleStmt/tei:respStmt"/>
			</div>
            <!--BOX ARTICOLI PRESENTI-->
			<div class="articoli-presenti">
				<h2>Articoli presenti:</h2>
				<div class="box-info">
                <!--ESTRAGGO TITOLO/VOLUME/NUMERO DELLA RIVISTA-->
					<h3>
                        Da:
						<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title"/>
                        - vol. 
						<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:biblScope[@unit='volume']"/>,
                        n. 
						<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:biblScope[@unit='issue']"/>
					</h3>
                    <!--APPLY TEMPLATES DEL SOURCE DESC-->
					<xsl:apply-templates select="tei:fileDesc/tei:sourceDesc"/>
				</div>
			</div>
            <!--BOTTONI PER SCORRERE I DIV-->
			<div class="tabs-container">
				<button class="tab-button" id="btn-info-rassegna">Informazioni sulla rivista</button>
				<button class="tab-button" id="btn-progetto">Descrizione progetto</button>
				<button class="tab-button" id="btn-tag-usati">Tag utilizzati</button>
			</div>
            <!--BOX INFORMAZIONI RASSEGNA-->
			<div id="info-rassegna" class="tab-content active">
				<div class="box-info-scheda">
                    <!--APPLY TEMPLATES DEL MONOGR-->
					<xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr"/>
				</div>
			</div>
            <!--BOX TAG UTILIZZATI-->
			<div id="tag-usati" class="tab-content">
				<div class="box-info-scheda">
                    <!--APPLY TEMPLATES DEL TAGS DECL-->
					<xsl:apply-templates select="tei:encodingDesc/tei:tagsDecl"/>
                    <!--APPLY TEMPLATES DEL EDITORIAL DECL-->
					<xsl:apply-templates select="tei:encodingDesc/tei:editorialDecl"/>
				</div>
			</div>
            <!--BOX DESCRIZIONE DEL PROGETTO-->
			<div id="progetto" class="tab-content">
				<div class="box-info-scheda">
                    <!--APPLY TEMPLATES DELLA DESCRIZIONE DEL PROGETTO-->
					<xsl:apply-templates select="tei:encodingDesc/tei:projectDesc"/>
				</div>
			</div>
		</div>
	</xsl:template>
    <!--TEI RESPSTMT-->
	<xsl:template match="tei:respStmt">
		<ul>
		<!-- PER OGNI PERSNAME ALL'INTERNO DI RESPSTMT ESTRAGGO NOME E LINK -->
		<xsl:for-each select="tei:persName">
			<li>
				<i class="fas fa-user-graduate icon-gap"></i>
			<xsl:value-of select="."/>
			<xsl:if test="@ref">
				<xsl:text> (</xsl:text>
			<a href="{@ref}">Profilo GitHub</a>
				<xsl:text>)</xsl:text>
				</xsl:if>
			</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
    <!--TEI SOURCEDESC-->
	<xsl:template match="tei:sourceDesc">
        <!--PER OGNI ANALYTIC IN TEI:BIBLSTRUCT-->
		<xsl:for-each select="tei:biblStruct/tei:analytic">
			<div class="articolo">
				<i class="fas fa-newspaper icon-gap"></i>
				<a href="{tei:title/@ref}">
                    <!--ESTRAGGO IL TITOLO DELL'ARTICOLO-->
					<xsl:value-of select="tei:title"/>
				</a>, pagine: 
                <!--CREO UNA VARIABILE CON L'ID DELL'ANALYTIC CORRENTE-->
				<xsl:variable name="id" select="@xml:id"/>
                <!--ESTRAGGO IL BIBLSCOPE DI OGNI ARTICOLO-->
				<xsl:value-of select="../tei:monogr/tei:biblScope[@corresp = $id]"/>
                lingua:
                <!--ESTRAGGO LA LINGUA DELL'ARTICOLO -->
				<xsl:value-of select="tei:textLang"/>.
      
			</div>
		</xsl:for-each>
	</xsl:template>
    <!--TEI MONOGR-->
	<xsl:template match="tei:monogr">
		<h3>
            <!--ESTRAGGO TITOLO/VOLUME/NUMERO DELLA RIVISTA-->
			<xsl:value-of select="tei:title"/> - vol. 
			<xsl:value-of select="tei:biblScope[@unit='volume']"/>, n. 
			<xsl:value-of select="tei:biblScope[@unit='issue']"/>
		</h3>
		<h4>Direttori e fondatori:</h4>
        <!--PER OGNI NAME PRESENTE IN RESPSTMT-->
		<xsl:for-each select="tei:respStmt/tei:name">
			<p>
                <!--ESTRAGGO I NOMI DEI DIRETTORI E FONDATORI-->
				• <xsl:value-of select="."/>.
			</p>
		</xsl:for-each>
		<h4>Dettagli di pubblicazione:</h4>
		<p>
			<strong>Data: </strong>
            <!--ESTRAGGO LA DATA DI PUBBLICAZIONE-->
			<xsl:value-of select="tei:imprint/tei:date"/>.
		</p>
		<p>
            <!--ESTRAGGO IL LUOGO DI PUBBLICAZIONE-->
			<strong>Luogo: </strong>
			<xsl:value-of select="tei:imprint/tei:pubPlace"/>.
		</p>
		<p>
            <!--ESTRAGGO L'EDITORE DI PUBBLICAZIONE-->
			<strong>Editore: </strong>
			<xsl:value-of select="tei:imprint/tei:publisher"/>.
		</p>
		<p>
            <!--ESTRAGGO IL LINK DELLA RASSEGNA-->
			<strong>Link: </strong>
			<a href="{tei:idno}">La Rassegna Settimanale.</a>
		</p>
	</xsl:template>
	<!--TAGSDECL-->
	<xsl:template match="tei:tagsDecl">
		<!-- TABELLA STRUTTURALI -->
		<h3>Tag strutturali</h3>
		<table class="tags-table">
			<thead>
			<tr>
				<th>Tag</th>
				<th>Descrizione</th>
			</tr>
			</thead>
			<tbody>
			<!--PER OGNI TAGUSAGE CON REND STRUCTURAL ALL'INTERNO DI NAMESPACE CREA UNA RIGA-->
			<xsl:for-each select="tei:namespace/tei:tagUsage[@rend='structural']">
				<tr>
				<td class="tag-name">&lt;<xsl:value-of select="@gi"/>&gt;</td>
				<td class="tag-description"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>

		<!-- TABELLA SEMANTICI -->
		<h3>Tag semantici</h3>
		<table class="tags-table">
			<thead>
			<tr>
				<th>Tag</th>
				<th>Descrizione</th>
			</tr>
			</thead>
			<tbody>
			<!--PER OGNI TAGUSAGE CON REND SEMANTIC ALL'INTERNO DI NAMESPACE CREA UNA RIGA-->
			<xsl:for-each select="tei:namespace/tei:tagUsage[@rend='semantic']">
				<tr>
				<td class="tag-name">&lt;<xsl:value-of select="@gi"/>&gt;</td>
				<td class="tag-description"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>

		<!-- NORMALIZZAZIONE / CORREZIONI -->
		<h3>Tag di normalizzazione/correzione</h3>
		<table class="tags-table">
			<thead>
			<tr>
				<th>Tag</th>
				<th>Descrizione</th>
			</tr>
			</thead>
			<tbody>
			<!--PER OGNI TAGUSAGE CON REND NORM_CORR ALL'INTERNO DI NAMESPACE CREA UNA RIGA-->
			<xsl:for-each select="tei:namespace/tei:tagUsage[@rend='norm_corr']">
				<tr>
				<td class="tag-name">&lt;<xsl:value-of select="@gi"/>&gt;</td>
				<td class="tag-description"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>

		<!-- TAG PER COLLEGAMENTO IMMAGINI -->
		<h3>Tag legati all’immagine</h3>
		<table class="tags-table">
			<thead>
			<tr>
				<th>Tag</th>
				<th>Descrizione</th>
			</tr>
			</thead>
			<tbody>
			<!--PER OGNI TAGUSAGE CON REND IMAGE ALL'INTERNO DI NAMESPACE CREA UNA RIGA-->
			<xsl:for-each select="tei:namespace/tei:tagUsage[@rend='image']">
				<tr>
				<td class="tag-name">&lt;<xsl:value-of select="@gi"/>&gt;</td>
				<td class="tag-description"><xsl:value-of select="."/></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

    <!--TEI EDITORIALDECL-->
	<xsl:template match="tei:editorialDecl">
		<h3>Decisioni editoriali:</h3>
        <!--APPLY TEMPLATES DELLE DECISIONI EDITORIALI-->
		<xsl:apply-templates select="tei:normalization"/>
		<xsl:apply-templates select="tei:correction"/>
	</xsl:template>
    <!--TEI CORRECTION-->
	<xsl:template match="tei:correction">
		<h4>Correzioni:</h4>
		<p>
            <!--ESTRAGGO LA DESCRIZIONE DI CORRECTION-->
			<xsl:value-of select="tei:p"/>
		</p>
	</xsl:template>
    <!--TEI NORMALIZATION-->
	<xsl:template match="tei:normalization">
		<h4>Normalizzazioni:</h4>
		<p>
            <!--ESTRAGGO LA DESCRIZIONE DI NORMALIZATION-->
			<xsl:value-of select="tei:p"/>
		</p>
	</xsl:template>
    <!--TEI PROJECT DESC-->
	<xsl:template match="tei:projectDesc">
		<h3>Descrizione progetto</h3>
        <!--PER OGNI PARAGRAFO DENTRO PROJECT DESC-->
		<xsl:for-each select="tei:p">
			<p>
                <!--ESEGUO APPLY TEMPLATES PER ESTRARRE IL TESTO E FAR PARTIRE TUTTI I TEMPLATES INTERNI (AD ESEMPIO TEI:REF)-->
				<xsl:apply-templates/>
			</p>
		</xsl:for-each>
	</xsl:template>
    <!--TEI REF-->
	<xsl:template match="tei:ref">
        <!--CREO IL LINK CON TARGET L'ATTRIBUTO TARGET DEL REF E ESTRGGO IL TESTO-->
		<a href="{@target}" target="_blank">
			<xsl:value-of select="."/>
		</a>
	</xsl:template>
	<!--TEI GROUP-->
	<xsl:template match="tei:group">
        <!--APPLY TEMPLATES DEI TESTI DENTRO GROUP-->
		<xsl:apply-templates select="tei:text"/>
	</xsl:template>
    <!--TEI TEXT-->
	<xsl:template match="tei:text">
        <!--APPLY TEMPLATES DEL BODY DENTRO TEXT-->
		<xsl:apply-templates select="tei:body"/>
	</xsl:template>
	<!--TEI BODY-->
	<xsl:template match="tei:body">
        <!--APPLY TEMPLATES DI ARTICOLI/BIBLIOGRAFIA/NOTIZIE-->
		<xsl:apply-templates select="tei:div[@type='article']"/>
		<xsl:apply-templates select="tei:div[@type='news']"/>
		<xsl:apply-templates select="tei:div[@type='bibliography']"/>
	</xsl:template>
    <!--TEI ARTICOLI-->
	<xsl:template match="tei:div[@type='article']">
        <!--DICHIARO LA VARIABILE CON L'ID DELL DIV ARTICOLO-->
		<xsl:variable name="articleId" select="@xml:id"/>
        <!--CREO IL BOX DELL'ARTICOLO CON ID: BOX- + VARIABILE-->
		<div class="box-container" id="box-{$articleId}">
            <!--APPLY TEMPLATES DELL'HEAD DI OGNI ARTICOLO-->
			<xsl:apply-templates select="tei:head"/>
            <!--CHOOSE SULLA VARIABILE PER CAPIRE A CHI ASSEGNARE LE IMMAGINI E I RELATIVI ZONE-->
			<xsl:choose>
                <!--IF VARIABILE = ARTICOLO 1-->
				<xsl:when test="$articleId = 'articolo1'">
                    <!--BOX IMMAGINE 1 ARTICOLO 1-->
					<div class="box-container-immagini" style="position: relative;" id="img1-{$articleId}">
                        <!--IMMAGINE 1 ARTICOLO 1-->
						<img src="img/sinistradestra_1.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 1 ARTICOLO 1
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina1" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina1']"/>
					</div>
                    <!--BOX IMMAGINE 2 ARTICOLO 1-->
					<div class="box-container-immagini" style="position: relative;" id="img2-{$articleId}">
                        <!--IMMAGINE 2 ARTICOLO 1-->
						<img src="img/sinistradestra_2.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 2 ARTICOLO 1
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina2" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina2']"/>
					</div>
				</xsl:when>
                <!--STESSA LOGICA DELL'ARTICOLO 1 PER I SUCCESSIVI-->
				<xsl:when test="$articleId = 'articolo2'">
					<div class="box-container-immagini" style="position: relative;" id="img1-{$articleId}">
						<img src="img/legge_istruzione_1.png" alt="Immagine articolo 2"/>
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina3']"/>
					</div>
					<div class="box-container-immagini" style="position: relative;" id="img2-{$articleId}">
						<img src="img/legge_istruzione_2.png" alt="Immagine articolo 2"/>
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina4']"/>
					</div>
				</xsl:when>
				<xsl:when test="$articleId = 'articolo3'">
					<div class="box-container-immagini" style="position: relative;" id="img1-{$articleId}">
						<img src="img/delitto_in_italia_1.png" alt="Immagine articolo 3"/>
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina5']"/>
					</div>
					<div class="box-container-immagini" style="position: relative;" id="img2-{$articleId}">
						<img src="img/delitto_in_italia_2.png" alt="Immagine articolo 3"/>
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina6']"/>
					</div>
				</xsl:when>
			</xsl:choose>
            <!--APPLY TEMPLATES DEL DIV PAGE DENTRO GLI ARTICOLI-->
			<xsl:apply-templates select="tei:div[@type='page']"/>
		</div>
	</xsl:template>
    <!--TEI BIBLIOGRAFIA-->
	<xsl:template match="tei:div[@type='bibliography']">
        <!--DICHIARO LA VARIABILE CON L'ID DEL DIV BIBLIOGRAFIA-->
		<xsl:variable name="bibliographyId" select="@xml:id"/>
        <!--CREO BOX CONTAINER CON ID: BOX- + VARIABILE-->
		<div class="box-container" id="box-{$bibliographyId}">
            <!--APPLY TEMPLATES DEGLI HEAD CON REND LV1 POICHE' BIBLIOGRAFIA HA ANCHE UN SUBTITLE-->
			<xsl:apply-templates select="tei:head[@rend='lv1']"/>
            <!--CHOOSE SULLA VARIABILE PER CAPIRE A CHI ASSEGNARE LE IMMAGINI E I RELATIVI ZONE-->
			<xsl:choose>
                <!--IF VARIABILE = BIBLIOGRAFIA-->
				<xsl:when test="$bibliographyId = 'bibliography'">
                    <!--BOX IMMAGINE 1 BIBLIOGRAFIA-->
					<div class="box-container-immagini" style="position: relative;" id="img1-{$bibliographyId}">
                        <!--IMMAGINE 1 BIBLIOGRAFIA-->
						<img src="img/bibliografia1.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 1 BIBLIOGRAFIA
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina7" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina7']"/>
					</div>
                    <!--BOX IMMAGINE 2 BIBLIOGRAFIA-->
					<div class="box-container-immagini" style="position: relative;" id="img2-{$bibliographyId}">
                        <!--IMMAGINE 2 BIBLIOGRAFIA-->
						<img src="img/bibliografia2.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 2 BIBLIOGRAFIA
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina8" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina8']"/>
					</div>
                    <!--BOX IMMAGINE 3 BIBLIOGRAFIA-->
					<div class="box-container-immagini" style="position: relative;" id="img3-{$bibliographyId}">
                        <!--IMMAGINE 3 BIBLIOGRAFIA-->
						<img src="img/bibliografia3.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 3 BIBLIOGRAFIA
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina9" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina9']"/>
					</div>
				</xsl:when>
			</xsl:choose>
            <!--APPLY TEMPLATES DEL DIV PAGE DENTRO BIBLIOGRAFIA-->
			<xsl:apply-templates select="tei:div[@type='page']"/>
		</div>
	</xsl:template>
    <!--TEI NEWS-->
	<xsl:template match="tei:div[@type='news']">
        <!--DICHIARO LA VARIABILE CON L'ID DEL DIV NEWS-->
		<xsl:variable name="newsId" select="@xml:id"/>
        <!--CREO BOX CONTAINER CON ID: BOX- + VARIABILE-->
		<div class="box-container" id="box-{$newsId}">
            <!--APPLY TEMPLATES DEGLI HEAD DI NEWS-->
			<xsl:apply-templates select="tei:head"/>
            <!--CHOOSE SULLA VARIABILE PER CAPIRE A CHI ASSEGNARE LE IMMAGINI E I RELATIVI ZONE-->
			<xsl:choose>
                <!--IF VARIABILE = NEWS-->
				<xsl:when test="$newsId = 'news'">
                    <!--BOX IMMAGINE 1 NEWS-->
					<div class="box-container-immagini" style="position: relative;" id="img1-{$newsId}">
                        <!--IMMAGINE 1 NEWS-->
						<img src="img/notizie.png" alt="Immagine articolo 1"/>
                        <!--APPLY TEMPLATES DELLE ZONE DELL'IMMAGINE 3 BIBLIOGRAFIA
                        CON // -> Cerco un elemento tei:zone con attributo rend="zone-pagina10" ovunque nel documento, a qualsiasi profondità -->
						<xsl:apply-templates select="//tei:zone[@rend='zone-pagina10']"/>
					</div>
				</xsl:when>
			</xsl:choose>
            <!--APPLY TEMPLATES DEL DIV PAGE DENTRO NEWS-->
			<xsl:apply-templates select="tei:div[@type='page']"/>
		</div>
	</xsl:template>
    <!--TEI PAGE-->
	<xsl:template match="tei:div[@type='page']">
        <!--DICHIARO LA VARIABILE CON L'ID DEL DIV PAGE-->
		<xsl:variable name="pageId" select="@xml:id"/>
        <!--CREO BOX CONTAINER CON ID: BOX- + VARIABILE-->
		<div class="box-container-articoli" id="page-{$pageId}">
			<div class="columns-wrapper">
                <!--APPLY TEMPLATES DELLA COLONNA SINISTRA-->
				<xsl:apply-templates select="tei:div[@type='sectionSX']"/>
                <!--APPLY TEMPLATES DELLA COLONNA DESTRA-->
				<xsl:apply-templates select="tei:div[@type='sectionDX']"/>
			</div>
		</div>
	</xsl:template>
    <!--TEI COLONNA SINISTRA-->
	<xsl:template match="tei:div[@type='sectionSX']">
        <!--DICHIARO LA VARIABILE CON L'ID DEL DIV COLONNA SINISTRA-->
		<xsl:variable name="sectionId" select="@xml:id"/>
        <!--CREO UN DIV CON ID DELLA VARIABILE-->
		<div class="section-left" id="{$sectionId}">
            <!--CONTROLLO SE UNO DEGLI ANTENATI DELLA COLONNA SINISTRA = DIV TYPE="page" REND="prima_pagina_articolo"
            COSI SO SE SIAMO IN UNA COLONNA DOVE DEVO RIPORTARE ALL'INIZIO DEL TESTO IL TITOLO DELL'ARTICOLO-->
			<xsl:if test="ancestor::tei:div[@type='page'][@rend='prima_pagina_articolo']">
				<h1>
                    <!--ESTRAGGO L'HEAD
                    - ancestor::tei:div[@type='article']
                    Cerca tra tutti gli antenati (cioè: genitore, nonno, bisnonno, ecc.) del nodo il primo <div> con attributo @type='article'.
                    - /tei:head
                    Una volta trovato quell’antenato <div type="article">, questa parte seleziona il figlio <tei:head> al suo interno.
                    -->
					<xsl:value-of select="ancestor::tei:div[@type='article']/tei:head"/>
				</h1>
			</xsl:if>
            <!--APPLY TEMPLATES DEI PARAGRAFI-->
			<xsl:apply-templates select="tei:p"/>
            <!--IF SE ESISTE ALMENO UN TEI:NOTE A QUALSIASI PROFONDITA (//) ALL'INTERNO DEL NODO CORRENTE (.) ESEGUE IL BLOCCO-->
			<xsl:if test=".//tei:note">
				<div class="box-note">
                    <!--PER OGNI NOTA PRESENTE A QUALSIASI PROFONDITA ALL'INTERNO DEL NODO CORRENTE-->
					<xsl:for-each select=".//tei:note">
						<div class="nota">
                            <!--ESTRAGGO CON APPLY TEMPLATES COSI DA MANTENERE LA SUA STRUTTURA INTERNA (ES LB)-->
							<xsl:apply-templates/>
						</div>
					</xsl:for-each>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
    <!--STESSA LOGICA DI COLONNA SINISTRA-->
	<xsl:template match="tei:div[@type='sectionDX']">
		<xsl:variable name="sectionId" select="@xml:id"/>
		<div class="section-right" id="{$sectionId}">
			<xsl:if test="ancestor::tei:div[@type='page'][@rend='prima_pagina_bibliografia']">
				<h1>
					<xsl:apply-templates select="ancestor::tei:div[@type='bibliography']/tei:head"/>
				</h1>
			</xsl:if>
			<xsl:if test="ancestor::tei:div[@type='page'][@rend='prima_pagina_notizie']">
				<h1>
					<xsl:apply-templates select="ancestor::tei:div[@type='news']/tei:head"/>
				</h1>
			</xsl:if>
			<xsl:apply-templates select="tei:p"/>
			<xsl:if test=".//tei:note">
				<div class="box-note">
					<xsl:for-each select=".//tei:note">
						<div class="nota">
							<xsl:apply-templates/>
						</div>
					</xsl:for-each>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!--TEI HEAD-->
	<xsl:template match="tei:head">
		<h1>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	<!--TEI P-->
	<xsl:template match="tei:p">
		<p>
            <!--APPLY TEMPLATES DEI NODI FIGLI DEL CORRENTE MA NON TE NOTE PERCHE' LI ABBIAMO GIA ESTRATTI NELLE COLONNE SX E DX-->
			<xsl:apply-templates select="node()[not(self::tei:note)]"/>
		</p>
	</xsl:template>
    <!--TEI LB-->
	<xsl:template match="tei:lb">
		<br/>
	</xsl:template>
    <!--TEI LG-->
	<xsl:template match="tei:lg">
		<div class="lg">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
    <!--TEI L-->
	<xsl:template match="tei:l">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>
    <!--TEI NOTE DISATTIVATO PERCHE' LE HO GIA' ESTRATTE IN COLONNA SX E DX-->
	<xsl:template match="tei:note"></xsl:template>
    <!-- TEI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:seg[@type='need_explanation']">
        <!--DICHIARO LA VARIABILE CON IL CORRESP DELL' RS LEVANDO #-->
		<xsl:variable name="gloss_corresp" select="substring-after(@corresp, '#')" />
        <!--DICHIARO LA VARIABILE CON LA FUNZIONE GENERATE ID PER CREARE ID UNICI-->
		<xsl:variable name="unique_id" select="generate-id()" />
        <!--DEFINISCO LO SPAN PRINCIPALE-->
		<span class="need_explanation">
            <!--CREO UN ATTRIBUTO ID A SPAN PRINCIPALE CON L'ID UNICO-->
			<xsl:attribute name="id">
				<xsl:value-of select="$unique_id"/>
			</xsl:attribute>
            <!--CREO UN ATTRIBUTO DATA CORRESP CON LA VARIABILE DEL CORRESP DI SEG-->
			<xsl:attribute name="data-corresp">
				<xsl:value-of select="$gloss_corresp"/>
			</xsl:attribute>
            <!--APPLY TEMPLATES PER ESTRARRE TESTO STRUTTURATO (ES LB)-->
			<xsl:apply-templates/>
            <!--DICHIARO LA VARIABILE GLOSS CHE HA COME VALORE UN NODO ENTRYFREE
            - ancestor::tei:text
            Risale l’albero XML fino all’antenato <tei:text> più vicino. Serve per riferirsi al blocco principale del testo.
            - /tei:back
            Dalla radice <tei:text>, accede alla sezione <back>.
            - /tei:div[@type='gloss_need_explanation']
            Dentro <back>, cerca un <div> che abbia: type="gloss_need_explanation".
            - /tei:entryFree[@xml:id = $gloss_corresp]
            Seleziona la entryFree il cui attributo xml:id è uguale al valore della variabile $gloss_corresp.                
            -->
			<xsl:variable name="gloss" select="ancestor::tei:text/tei:back/tei:div[@type='gloss_need_explanation']/tei:entryFree[@xml:id = $gloss_corresp]"/>
            <!--IF SE ESISTE QUINDI SE E' STATO TROVATO ALMENO UN ENTRYFREE CON L'ID CERCATO-->
			<xsl:if test="$gloss">
                <!--CREO LO SPAN SECONDARIO-->
				<span>
                    <!--DEFINISCO L'ATTRIBUTO CLASS PER LO SPAN SECONDARIO-->
					<xsl:attribute name="class">
                        <!--FACCIO UNA CHOOSE PER VERIFICARE CHE L'ANTENATO DI RS SIA sectionDX COSI DO LA CLASSE infospanDX
                        ALTRIMENTI SI TRATTA DI sectionSX ALLORA DO LA CLASSE infospanSX-->
						<xsl:choose>
							<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
							<xsl:otherwise>infospanSX</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
                    <!--CREO L'ATTRIBUTO DATA-BOX-FOR E DO COME ID L'ID UNICO-->
					<xsl:attribute name="data-box-for">
						<xsl:value-of select="$unique_id"/>
					</xsl:attribute>
					<strong>Nome: </strong>
                    <!--ESTRAGGO IL CONTENUTO DEL NODO RS ALL'INTERNO DELL'ELEMENTO ENTRYFREE SALVATO NELLA VARIABILE-->
					<xsl:value-of select="$gloss/tei:seg[@type='need_explanation']"/>
					<br/>
					<strong>Spiegazione: </strong>
                    <!--ESTRAGGO IL CONTENUTO DEL NODO DEF ALL'INTERNO DELL'ELEMENTO ENTRYFREE SALVATO NELLA VARIABILE-->
					<xsl:value-of select="$gloss/tei:def"/>
				</span>
			</xsl:if>
		</span>
	</xsl:template>
    <!--TEI RS[@type='law'] STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:rs[@type='law']">
		<xsl:variable name="gloss_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="law">
			<xsl:attribute name="id">
				<xsl:value-of select="$unique_id"/>
			</xsl:attribute>
			<xsl:attribute name="data-corresp">
				<xsl:value-of select="$gloss_corresp"/>
			</xsl:attribute>
			<xsl:apply-templates/>
			<xsl:variable name="gloss" select="ancestor::tei:text/tei:back/tei:div[@type='gloss_law']/tei:entryFree[@xml:id = $gloss_corresp]"/>
			<xsl:if test="$gloss">
				<span>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
							<xsl:otherwise>infospanSX</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="data-box-for">
						<xsl:value-of select="$unique_id"/>
					</xsl:attribute>
					<strong>Nome: </strong>
					<xsl:value-of select="$gloss/tei:rs[@type='law']"/>
					<br/>
					<strong>Spiegazione: </strong>
					<xsl:value-of select="$gloss/tei:def"/>
				</span>
			</xsl:if>
		</span>
	</xsl:template>
    <!--TEI tei:placeName | tei:country[@corresp='#Ita'] STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:placeName[@corresp] | tei:country[@corresp]">
		<xsl:variable name="place_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="place">
			<xsl:attribute name="id">
				<xsl:value-of select="$unique_id"/>
			</xsl:attribute>
			<xsl:attribute name="data-corresp">
				<xsl:value-of select="$place_corresp"/>
			</xsl:attribute>
			<xsl:apply-templates/>
			<xsl:variable name="place_list" select="ancestor::tei:text/tei:back/tei:listPlace/tei:place[@xml:id = $place_corresp]"/>
			<xsl:if test="$place_list">
				<span>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
							<xsl:otherwise>infospanSX</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="data-box-for">
						<xsl:value-of select="$unique_id"/>
					</xsl:attribute>
					<strong>Nome luogo: </strong>
					<xsl:value-of select="$place_list/tei:placeName"/>
					<br/>
					<xsl:if test="$place_list/tei:bloc[@type='continent']">
						<strong>Continente: </strong>
						<xsl:value-of select="$place_list/tei:bloc[@type='continent']"/>
						<br/>
					</xsl:if>
					<xsl:if test="$place_list/tei:bloc[@type='subcontinent']">
						<strong>Subcontinente: </strong>
						<xsl:value-of select="$place_list/tei:bloc[@type='subcontinent']"/>
						<br/>
					</xsl:if>
					<xsl:if test="$place_list/tei:country">
						<strong>Paese: </strong>
						<xsl:value-of select="$place_list/tei:country"/>
						<br/>
					</xsl:if>
					<xsl:if test="$place_list/tei:region">
						<strong>Regione: </strong>
						<xsl:value-of select="$place_list/tei:region"/>
						<br/>
					</xsl:if>
					<xsl:if test="$place_list/tei:settlement">
						<strong>Città: </strong>
						<xsl:value-of select="$place_list/tei:settlement"/>
						<br/>
					</xsl:if>
					<strong>Link: </strong>
					<a href="{$place_list/tei:idno}">
						<xsl:value-of select="$place_list/tei:idno"/>
					</a>
					<br/>
				</span>
			</xsl:if>
		</span>
	</xsl:template>
    <!--TEI PERSNAME[@type='real'] STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:persName[@type='real']">
		<xsl:variable name="person_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="persName_real">
			<xsl:attribute name="id">
				<xsl:value-of select="$unique_id"/>
			</xsl:attribute>
			<xsl:attribute name="data-corresp">
				<xsl:value-of select="$person_corresp"/>
			</xsl:attribute>
			<xsl:apply-templates/>
			<xsl:variable name="person_list" select="ancestor::tei:text/tei:back/tei:listPerson/tei:person[@xml:id = $person_corresp]"/>
			<xsl:if test="$person_list">
				<span>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
							<xsl:otherwise>infospanSX</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="data-box-for">
						<xsl:value-of select="$unique_id"/>
					</xsl:attribute>
					<strong>Nome: </strong>
					<xsl:value-of select="$person_list/tei:persName/tei:forename"/>
					<br/>
					<strong>Cognome: </strong>
					<xsl:value-of select="$person_list/tei:persName/tei:surname"/>
					<br/>
					<strong>Nascita: </strong>
					<xsl:value-of select="$person_list/tei:birth"/>
					<br/>
					<strong>Morte: </strong>
					<xsl:value-of select="$person_list/tei:death"/>
					<br/>
					<strong>Nota: </strong>
					<xsl:value-of select="$person_list/tei:note"/>
					<br/>
					<strong>Link: </strong>
					<a href="{$person_list/tei:idno}">
						<xsl:value-of select="$person_list/tei:idno"/>
					</a>
					<br/>
				</span>
			</xsl:if>
		</span>
	</xsl:template>
    <!--TEI CHOICE[@change='modernization'] STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:choice[@change='modernization']">
		<xsl:variable name="modernization_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="choice">
			<span class="reg">
				<xsl:apply-templates select="tei:reg"/>
			</span>
			<span class="orig">
				<xsl:attribute name="id">
					<xsl:value-of select="$unique_id"/>
				</xsl:attribute>
				<xsl:attribute name="data-corresp">
					<xsl:value-of select="$modernization_corresp"/>
				</xsl:attribute>
				<xsl:apply-templates select="tei:orig"/>
				<xsl:variable name="modernization" select="ancestor::tei:text/tei:back/tei:div[@type='gloss_modernization']/tei:entryFree[@xml:id = $modernization_corresp]"/>
				<xsl:if test="$modernization">
					<span style="display: none;">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
								<xsl:otherwise>infospanSX</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="data-box-for">
							<xsl:value-of select="$unique_id"/>
						</xsl:attribute>
						<strong>Originale: </strong>
						<xsl:value-of select="$modernization/tei:orig"/>
						<br/>
						<strong>Normalizzata: </strong>
						<xsl:value-of select="$modernization/tei:reg"/>
					</span>
				</xsl:if>
			</span>
		</span>
	</xsl:template>
    <!--TEI CHOICE[@change='abbreviation'] STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:choice[@change='abbreviation']">
		<xsl:variable name="abbreviation_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="choice">
			<span class="reg">
				<xsl:apply-templates select="tei:expan"/>
			</span>
			<span class="orig">
				<xsl:attribute name="id">
					<xsl:value-of select="$unique_id"/>
				</xsl:attribute>
				<xsl:attribute name="data-corresp">
					<xsl:value-of select="$abbreviation_corresp"/>
				</xsl:attribute>
				<xsl:apply-templates select="tei:abbr"/>
				<xsl:variable name="abbreviation" select="ancestor::tei:text/tei:back/tei:div[@type='gloss_abbreviation']/tei:entryFree[@xml:id = $abbreviation_corresp]"/>
				<xsl:if test="$abbreviation">
					<span style="display: none;">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
								<xsl:otherwise>infospanSX</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="data-box-for">
							<xsl:value-of select="$unique_id"/>
						</xsl:attribute>
						<strong>Abbreviata: </strong>
						<xsl:value-of select="$abbreviation/tei:abbr"/>
						<br/>
						<strong>Espansa: </strong>
						<xsl:value-of select="$abbreviation/tei:expan"/>
					</span>
				</xsl:if>
			</span>
		</span>
	</xsl:template>
    <!--TEI CHOICE CHANGE[@change='correction']" STESSA LOGICA DI SEG TYPE="need_explanation"-->
	<xsl:template match="tei:choice[@change='correction']">
		<xsl:variable name="correction_corresp" select="substring-after(@corresp, '#')" />
		<xsl:variable name="unique_id" select="generate-id()" />
		<span class="choice">
			<span class="corr">
				<xsl:apply-templates select="tei:corr"/>
			</span>
			<span class="sic">
				<xsl:attribute name="id">
					<xsl:value-of select="$unique_id"/>
				</xsl:attribute>
				<xsl:attribute name="data-corresp">
					<xsl:value-of select="$correction_corresp"/>
				</xsl:attribute>
				<xsl:apply-templates select="tei:sic"/>
				<xsl:variable name="correction" select="ancestor::tei:text/tei:back/tei:div[@type='gloss_correction']/tei:entryFree[@xml:id = $correction_corresp]"/>
				<xsl:if test="$correction">
					<span style="display: none;">
						<xsl:attribute name="class">
							<xsl:choose>
								<xsl:when test="ancestor::tei:div[@type='sectionDX']">infospanDX</xsl:when>
								<xsl:otherwise>infospanSX</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:attribute name="data-box-for">
							<xsl:value-of select="$unique_id"/>
						</xsl:attribute>
						<strong>Errore: </strong><xsl:value-of select="$correction/tei:sic"/><br/>
						<strong>Correzione: </strong><xsl:value-of select="$correction/tei:corr"/>
					</span>
				</xsl:if>
			</span>
		</span>
	</xsl:template>
    <!--TEI SEG[@type='verbum']-->
	<xsl:template match="tei:seg[@type='verbum']">
		<span class="verbum">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI SEG[@type='speech']-->
	<xsl:template match="tei:seg[@type='speech']">
		<span class="speech">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI SEG[@type='central_theme']"-->
	<xsl:template match="tei:seg[@type='central_theme']">
		<span class="central_theme">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI DATE-->
	<xsl:template match="tei:date">
		<span class="date">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI NUM-->
	<xsl:template match="tei:num">
		<span class="num">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI TERM[@type = 'political_alignment' or @type = 'political_structure' or @type = 'political_ideology' or @type = 'political_instruments-->
	<xsl:template match="tei:term[@type = 'political_alignment' or
                              @type = 'political_structure' or
                              @type = 'political_ideology' or
                              @type = 'political_instruments']">
		<span class="term_politici">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI TERM[@type = 'juridical']-->
	<xsl:template match="tei:term[@type = 'juridical']">
		<span class="term_juridical">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI TERM[@type = 'literature'] -->
	<xsl:template match="tei:term[@type = 'literature']">
		<span class="term_literature">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI RS[@type='occupation'] -->
	<xsl:template match="tei:rs[@type='occupation']">
		<span class="occupation">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI Q-->
	<xsl:template match="tei:q">
		<span class="quote">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI ORGNAME-->
	<xsl:template match="tei:orgName">
		<span class="org">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI TITLE[@type='literature_work']-->
	<xsl:template match="tei:title[@type='literature_work']">
		<span class="literature_work">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI DISCTINCT[@type='metaphorical']-->
	<xsl:template match="tei:distinct[@type='metaphorical']">
		<span class="metaphorical">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI DISCTINCT[@type='satirical']-->
	<xsl:template match="tei:distinct[@type='satirical']">
		<span class="satirical">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI PERSNAME[@type='fictional']-->
	<xsl:template match="tei:persName[@type='fictional']">
		<span class="persName_fictional">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI NAME[@type='fictional']-->
	<xsl:template match="tei:name[@type='fictional']">
		<span class="persName_fictional">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI FOREIGN-->
	<xsl:template match="tei:foreign">
		<span class="foreign">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
    <!--TEI HI-->
	<xsl:template match="tei:hi">
        <!--CHOOSE PER CONTROLLARE SE HI HA REND ITALIC O BOLD IN CASO POSITIVO DA LE CLASSI IN CASO NEGATIVO NO-->
		<xsl:choose>
			<xsl:when test="@rend = 'italic'">
				<span class="hi italic">
					<xsl:apply-templates/>
				</span>
			</xsl:when>
			<xsl:when test="@rend = 'bold'">
				<span class="hi bold">
					<xsl:apply-templates/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span class="hi">
					<xsl:apply-templates/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
    <!--TEI SEG[@type='subtitle']-->
	<xsl:template match="tei:seg[@type='subtitle']">
		<div class="subtitle">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
    <!--TEI ZONE-->
	<xsl:template match="tei:zone">
        <!--DICHIARO LA VARIABILE IMGWIDTH A SECONDA DELLA PAGINA CHE HA 
        IN REND LA ZONE DIAMO WIDTH DIVERSE PERCHE' LA WIDTH DELL'IMMAGINE CAMBIA PER OGNI IMMAGINE-->
		<xsl:variable name="imgWidth">
            <!--CHOOSE PER SCEGLIERE QUALE WIDTH DARE SE NON TROVA NESSUNO CHE COINCIDE DA 1-->
			<xsl:choose>
				<xsl:when test="@rend = 'zone-pagina1'">2263.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina2'">1581.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina3'">1581.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina4'">1660.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina5'">1660.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina6'">1591.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina7'">1565.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina8'">1562.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina9'">1612.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina10'">1582.33334</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
        <!--DICHIARO LA VARIABILE IMGHEIGHT A SECONDA DELLA PAGINA CHE HA 
        IN REND LA ZONE DIAMO HEIGHT DIVERSE PERCHE' LA HEIGHT DELL'IMMAGINE CAMBIA PER OGNI IMMAGINE-->
		<xsl:variable name="imgHeight">
			<xsl:choose>
                <!--CHOOSE PER SCEGLIERE QUALE HEIGHT DARE SE NON TROVA NESSUNO CHE COINCIDE DA 1-->
				<xsl:when test="@rend = 'zone-pagina1'">2903.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina2'">1974.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina3'">1974.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina4'">1969.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina5'">1969.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina6'">1971.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina7'">1953.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina8'">1949.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina9'">1946.33334</xsl:when>
				<xsl:when test="@rend = 'zone-pagina10'">1963.33334</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
        <!--DICHIARO LA VARIABILE COORDS E UTILIZZO LA FUNZIONE TOKENIZE
        COSI DIVIDO L'ATTRIBUTO  @points PRESENTE IN ZONE IN UNA SEQUENZA DI 4 STRINGHE CON COORDINATE SEPARATE DA UNO SPAZIO:
        ('100,200', '400,200', '400,600', '100,600')
        -->
		<xsl:variable name="coords" select="tokenize(@points, '\s+')" />
        <!--DICHIARIAMO LE NOSTRE COORDINATE APPLICO TOKENIZE E NUMBER AI GRUPPI TROVATI
        COSI SEPARO AD ESEMPIO ('100','200') E LI FACCIO DIVENTARE NUMERI (100, 200)
        ATTENZIONE: NON MI SERVONO TUTTI I VALORI DEI POINTS PERCHE' STO CERCANDO DI FARE UN RETTANGOLO (IL TOTALE SAREBBERO 8 VARIABILI OGNI PUNTO HA LA SUA X E Y)
        ESTRAGGO INFATTI SOLO: X1 Y1 X3 Y3
        POICHE' PER RICREARE IL RETTANGOLO POSSO:
        left = x1
        top = y1
        width = x3 − x1
        height = y3 − y1
        -->
		<xsl:variable name="x1" select="number(tokenize($coords[1], ',')[1])"/>
		<xsl:variable name="y1" select="number(tokenize($coords[1], ',')[2])"/>
		<xsl:variable name="x3" select="number(tokenize($coords[3], ',')[1])"/>
		<xsl:variable name="y3" select="number(tokenize($coords[3], ',')[2])"/>
		<!--DEFINISCO LE COORDINATE IN PERCENTUALE COSI DA ADATTARLE ALL'HTML-->
		<xsl:variable name="left" select="100 * $x1 div $imgWidth"/>
		<xsl:variable name="top" select="100 * $y1 div $imgHeight"/>
		<xsl:variable name="width" select="100 * ($x3 - $x1) div $imgWidth"/>
		<xsl:variable name="height" select="100 * ($y3 - $y1) div $imgHeight"/>
        <!--CREO L'ELEMENTO ZONE RETTANGO IN HTML-->
		<div class="image-zone zone-{@type}"
         style="position:absolute;
                left:{format-number($left, '#.##')}%;
                top:{format-number($top, '#.##')}%;
                width:{format-number($width, '#.##')}%;
                height:{format-number($height, '#.##')}%;"></div>
	</xsl:template>
</xsl:stylesheet>
