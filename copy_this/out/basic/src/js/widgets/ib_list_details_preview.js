( function ( $ ) {
    
    ib_list_details_preview = {
        
        previewtextselector: '.ib_list_details_preview-previewtext',

        quickview : function () {
            var text = $(ib_list_details_preview.previewtextselector).attr('data-ib_list_details_preview-previewtext');
            $('.QuickviewIcon').remove();
            $('.product').each(function() {
                var $this = $(this),
                    anid = $this.attr('data-ib_list_details_preview-anid'),
                    url = location.href + '?cl=details&anid='+anid+'&fnc=loadPreview',
                    preview = $('<div>'+text+'</div>').addClass('ib_list_details_preview-previewbox').css('display', 'none');
                $('body').prepend(preview);
                $this.hover(function() {
                    var offset = $this.offset();
                    preview.css({
                        'top':offset.top + 40, 
                        'left':offset.left + 60
                    });
                    preview.show();
                }, function() {
                    preview.hide();
                });
                preview.hover(function() {
                    $(this).show();
                }, function() {
                    $(this).hide();
                });
                preview.click(function() {
                    var QuickviewBackdrop = $('<div></div>').addClass('QuickviewBackdrop').css('display', 'none');
                    var QuickviewBox = $('<div></div>').addClass('QuickviewBox').css('display', 'none');
                    var topOffset = ($(window).height() - 450) / 2;
                    QuickviewBox.css('top', topOffset);
                    $('body').prepend(QuickviewBackdrop);
                    $('body').prepend(QuickviewBox);
                    QuickviewBackdrop.fadeTo('fast', 0.3);
                    var QuickviewPreload = $('<div></div>').addClass('QuickviewPreload');
                    QuickviewBox.append(QuickviewPreload);
                    QuickviewBox.fadeIn('fast', function() { 
                        var loadURL = url;
                        QuickviewBox.load(loadURL, function() {
                            QuickviewPreload.hide();
                        }); 
                    });
                    QuickviewBackdrop.click(function() {
                        QuickviewBox.fadeOut('fast', function() {
                            $(this).remove();
                        });
                        QuickviewBackdrop.fadeOut('fast', function() {
                            $(this).remove();
                        });
                    });
                });
            });
        }     
    }
 
    $.widget("ui.ib_list_details_preview", ib_list_details_preview );

} )( jQuery );
