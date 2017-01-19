CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'UserToolbar';
 
	config.toolbar_UserToolbar =
	[
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		{ name: 'styles', items : [ 'FontSize' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		'/',
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'SpellChecker' ] },
		{ name: 'links', items : [ 'Link','Unlink' ] },
		{ name: 'insert', items : [ 'Table','HorizontalRule','Smiley','SpecialChar' ] },
		{ name: 'document', items : [ 'Source','Preview' ] },
		{ name: 'tools', items : [ 'About' ] }
	];
};