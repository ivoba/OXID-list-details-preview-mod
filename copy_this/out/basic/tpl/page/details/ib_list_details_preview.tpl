[{ assign var="currency" value=$oView->getActCurrency() }]
[{ assign var="product" value=$oView->getProduct() }]
[{ assign var="oManufacturer" value=$product->getManufacturer()}]
<div id="QuickviewContainer">
    <div class="QuickviewTop">
        <div onclick="$('div.QuickviewBox').fadeOut('fast', function() { $(this).remove(); }); $('div.QuickviewBackdrop').fadeOut('fast', function() { $(this).remove(); }); return false;">close<img src="[{$oViewConf->getImageUrl()}]layer_close.png" alt="." height="16" width="16" /></div>
    </div>
    <div class="QuickviewContent">
        <div class="QuickviewLeftcontent">
            <div class="teaser-text"><h2><strong>[{ $oManufacturer->oxmanufacturers__oxtitle->value}]</strong></h2>
                <div class="icons">
                [{if $oManufacturer }]
                [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                <img src="[{$oManufacturer->getIconUrl()}]" alt="[{ $oManufacturer->oxmanufacturers__oxtitle->value}]">
                [{/if}]
                [{/if}]
                </div>
            </div>
            <div class="clearboth"></div>
            <h2>[{$product->oxarticles__oxtitle->value}]</h2>
            <img src="[{ $oView->getActPicture() }]"  alt="[{ $product->oxarticles__oxtitle->value|strip_tags }]">
        </div>
        <div class="QuickviewRightheader">
            <h2><a href="[{$product->getLink()}]">[{ oxmultilang ident="IB_LISTDETAILSPREVIEW_GOTOPRODUCT" }]</a></h2>
        </div>
        <div class="QuickviewRightcontent">
            <p>[{ $product->oxarticles__oxshortdesc->value }]</p>
            <div class="orderbar">
                [{if $oView->getVariantList()}]
                        [{foreach from=$oView->getVariantList() name=variants item=variant_product}]
                        [{include file="inc/ib_list_details_preview_orderbar.tpl" product=$variant_product size="thinest" altproduct=$product->getId() class=lastinlist testid="Variant_"|cat:$variant_product->oxarticles__oxid->value}]
                        [{/foreach}]
                [{else}]
                    [{include file="inc/ib_list_details_preview_orderbar.tpl" product=$product }]
                [{/if}]
            </div>
        </div>
    </div>
</div>
