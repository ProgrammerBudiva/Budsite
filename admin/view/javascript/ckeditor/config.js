/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.extraPlugins = 'youtube';
    // config.toolbar = [{ name: 'insert', items:['Image', 'Youtube']}];
    config.youtube_responsive = true;
    config.youtube_controls = true;


    /* Filebrowser routes */

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
    // config.filebrowserImageBrowseLinkUrl = "/admin/index.php?route=common/filemanager&ckedialog=info:txtUrl";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
    // config.filebrowserImageBrowseUrl = "/admin/index.php?route=common/filemanager&ckedialog=info:txtUrl";

    // The location of a script that handles file uploads in the Image dialog.
    // config.filebrowserImageUploadUrl = "/admin/index.php?route=common/filemanager&ckedialog=info:txtUrl";


    config.allowedContent = true;


};
