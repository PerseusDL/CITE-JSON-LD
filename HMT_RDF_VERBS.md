# RDF use by Homer Multitext Project 2014
## Ontology prefixes in use

Taken from [http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip](http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip) > *.ttl

	@prefix cts: 		<http://www.homermultitext.org/cts/rdf/>
	@prefix cite: 		<http://www.homermultitext.org/cite/rdf/>
	@prefix hmt:        <http://www.homermultitext.org/hmt/rdf/>
	@prefix citedata:   <http://www.homermultitext.org/hmt/citedata/>
	@prefix dcterms: 	<http://purl.org/dc/terms/>
	@prefix rdf: 		<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
	@prefix xsd: 		<http://www.w3.org/2001/XMLSchema#>
	@prefix olo:     	<http://purl.org/ontology/olo/core#>
	@prefix lex:        <http://data.perseus.org/rdfverbs/>
	@prefix pal: 		<http://shot.holycrossedu/rdfverbs/pal/>
	@prefix rdfs:   	<http://www.w3.org/2000/01/rdf-schema#>
	@prefix latepig: 	<http://shot.holycross.edu/rdf/latepig/>

## Predicate properties in use

Extracted from [http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip](http://beta.hpcc.uh.edu/hmt/archival-publications/hmt-rdf-2014.1.zip) > *.ttl using **scripts/rdf_isolate.sh**

## cts
	cts:Edition
	cts:TextGroup
	cts:Translation
	cts:Work
	cts:abbreviatedBy
	cts:belongsTo
	cts:citationDepth
	cts:containedBy
	cts:contains
	cts:hasSequence
	cts:hasTextContent
	cts:lang
	cts:possesses
	cts:translationLang
	cts:xmlns

## cite
    cite:CiteCollection
    cite:CiteUrn
    cite:CtsUrn
    cite:DataNs
    cite:ImageArchive
    cite:abbreviatedBy
    cite:appearsOn
    cite:belongsTo
    cite:canonicalId
    cite:collProperty
    cite:hasExtendedRef
    cite:hasOnIt
    cite:illustratedBy
    cite:illustrates
    cite:isExtendedRef
    cite:license
    cite:next
    cite:ordered
    cite:orderedBy
    cite:possesses
    cite:prev
    cite:propLabel
    cite:propType

## hmt
    hmt:commentedOnBy
    hmt:commentsOn
    hmt:editStatus
    hmt:hasDefaultImage
    hmt:isDefaultImage
    hmt:path
    hmt:statusOf
    hmt:xmlOpen
    hmt:xpTemplate

## citedata
    citedata:captions_Caption
    citedata:captions_Folio
    citedata:captions_Label
    citedata:captions_Text
    citedata:captions_VisualEvidence
    citedata:catships_AttachedTo
    citedata:catships_Entry
    citedata:catships_Label
    citedata:catships_VisualEvidence
    citedata:codices_codex
    citedata:codices_description
    citedata:codices_pageMode
    citedata:comp_folio
    citedata:comp_label
    citedata:comp_rv
    citedata:comp_sequence
    citedata:critsigns_EnglishName
    citedata:critsigns_GreekName
    citedata:critsigns_SignURN
    citedata:critsigns_UnicodeHex
    citedata:critsigns_UnicodeNotes
    citedata:e3_Label
    citedata:e3_RV
    citedata:e3_Sequence
    citedata:e3_URN
    citedata:e4_Label
    citedata:e4_RV
    citedata:e4_Sequence
    citedata:e4_URN
    citedata:edstatus_Meaning
    citedata:edstatus_StatusUrn
    citedata:lexentity_Gloss
    citedata:lexentity_Lemma
    citedata:lexentity_LexURN
    citedata:msA_Label
    citedata:msA_RV
    citedata:msA_Sequence
    citedata:msA_URN
    citedata:msB_Label
    citedata:msB_RV
    citedata:msB_Sequence
    citedata:msB_URN
    citedata:pageroi_Folio
    citedata:pageroi_ImageRoI
    citedata:pageroi_Label
    citedata:pageroi_PageZone
    citedata:proclusSign_CriticalSign
    citedata:proclusSign_ImageRoI
    citedata:proclusSign_OccurrrenceUrn
    citedata:proclusSign_Sequence
    citedata:proclusSign_TextPassage
    citedata:scholia_Comments
    citedata:scholia_CtsUrn
    citedata:scholia_FolioUrn
    citedata:scholia_URN
    citedata:scholia_VisualEvidence
    citedata:textblock_Folio
    citedata:textblock_IliadZone
    citedata:textblock_ImageRoI
    citedata:textblock_Notes
    citedata:tokentypes_ClassId
    citedata:tokentypes_Meaning
    citedata:u4_Label
    citedata:u4_RV
    citedata:u4_Sequence
    citedata:u4_URN
    citedata:vagraphics_Caption
    citedata:vagraphics_Folio
    citedata:vagraphics_Graphic
    citedata:vagraphics_ImageRoi
    citedata:vagraphics_VisualEvidence
    citedata:venAsign_CriticalSign
    citedata:venAsign_OccurrrenceUrn
    citedata:venAsign_Sequence
    citedata:venAsign_TextPassage

## dcterms
	dcterms:title

## rdf
	rdf:Property
	rdf:label
	rdf:type

## xsd
## olo
	olo:item
	olo:next
	olo:previous

## lex
## pal
## rdfs
## latepig