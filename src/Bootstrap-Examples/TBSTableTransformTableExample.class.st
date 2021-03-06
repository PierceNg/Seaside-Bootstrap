"
Transform a normal HTML table example  
"
Class {
	#name : #TBSTableTransformTableExample,
	#superclass : #TBSBootstrapTableExample,
	#category : 'Bootstrap-Examples-Widgets-Table'
}

{ #category : #accessing }
TBSTableTransformTableExample class >> exampleName [
 
	^'Table - Transform'
]

{ #category : #rendering }
TBSTableTransformTableExample >> renderExampleOn: html [
	html tbsButtonGroup with: [ 
		html tbsButton id: 'transform'; beDefault; with: [ 
			html tbsGlyphIcon  iconTransfer.
			html span: 'Transform']]. 

		html tbsButtonGroup with: [ 
		html tbsButton id: 'destroy'; beDefault; with: [ 
			html tbsGlyphIcon  iconTrash.
			html span: 'Destroy']].
	
	html table 
		id: 'table-transform'; 
		attributeAt: 'data-toolbar' put: '#transform-buttons';
		with: [ 
			html tableHead: [ html tableRow: [ html tableHeading: 'Item ID'; tableHeading: 'Item name'; tableHeading: 'Item Price' ]].
			1 to: 10 do: [:each |
				html tableRow: [ 
					html tableData: each asString.
					html tableData: 'test', each asString.
					html tableData: '$', each asString. ]
			].
		]. 
	 html script: self toogleTableTransformScript
	

 
]

{ #category : #scripts }
TBSTableTransformTableExample >> toogleTableTransformScript [

	^'$(function () {
        var $table = $(''#table-transform'');
        $(''#transform'').click(function () {
            $table.bootstrapTable();
        });
        $(''#destroy'').click(function () {
            $table.bootstrapTable(''destroy'');
        });
    });'
]
