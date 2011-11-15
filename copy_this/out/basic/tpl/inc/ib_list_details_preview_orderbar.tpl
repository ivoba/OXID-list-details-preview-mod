<form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    <input type="hidden" name="fnc" value="tobasket">
    <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
    <div class="row">
        <div class="s1">
            [{if $altproduct}]
            <a href="[{ $product->getLink() }]">
            [{/if}]
            <img src="[{$product->getIconUrl(1)}]" />
            [{if $altproduct}]
            </a>
            [{/if}]
        </div>
        <div class="s2"><p>[{ oxmultilang ident="INC_PRODUCTITEM_ARTNOMBER" }]: [{ $product->oxarticles__oxartnum->value }]</p>
            <p>[{if $altproduct}]
                <a href="[{ $product->getLink() }]">
                [{/if}]
                [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
                [{if $altproduct}]
                </a>
                [{/if}]
            </p>
            <p>
                [{if $product->getStockStatus() == -1}]
            <div class="flag red">
                [{ if $product->oxarticles__oxnostocktext->value  }]
                [{ $product->oxarticles__oxnostocktext->value  }]
                [{elseif $oViewConf->getStockOffDefaultMessage() }]
                [{ oxmultilang ident="DETAILS_NOTONSTOCK" }]
                [{/if}]

                [{ if $product->getDeliveryDate() }]
                <br>[{ oxmultilang ident="DETAILS_AVAILABLEON" }] [{ $product->getDeliveryDate() }]
                [{/if}]
            </div>
            [{elseif $product->getStockStatus() == 1}]

            <div class="flag orange">
                <b>[{ oxmultilang ident="DETAILS_LOWSTOCK" }]</b>
            </div>
            [{elseif $product->getStockStatus() == 0}]

            <div class="flag green">
                [{ if $product->oxarticles__oxstocktext->value  }]
                [{ $product->oxarticles__oxstocktext->value  }]
                [{elseif $oViewConf->getStockOnDefaultMessage() }]
                [{ oxmultilang ident="DETAILS_READYFORSHIPPING" }]
                [{/if}]
            </div>
            [{/if}]
            [{if $product->isBuyable() }]
            [{include file="inc/del_time.tpl"}]
            [{/if}]
            </p>
            <div class="wishlist">
                [{if $oViewConf->getShowWishlist()}]
                [{if $oxcmp_user }]
                <a id="linkToWishList" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$product->oxarticles__oxnid->value`&anid=`$product->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="DETAILS_ADDTOWISHLIST" }]</a>
                [{else}]
                <a id="test_LoginToWish" class="reqlogin" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$product->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="DETAILS_LOGGINTOACCESSWISHLIST" }]</a>
                [{/if}]
                [{/if}]
            </div>
        </div>
        <div class="s4" id="[{ $product->getId() }]">
            <div class="price">
            [{if $product->getFTPrice()}]
            <span class="old">[{ oxmultilang ident="DETAILS_REDUCEDFROM" }] <del><span class="f_r_price">[{ $product->getFTPrice()}]</span> [{ $currency->sign}]</del></span><br/>
                <span class="desc">[{ oxmultilang ident="DETAILS_REDUCEDTEXT" }]</span><br/>
                <sub class="only">[{ oxmultilang ident="DETAILS_NOWONLY" }]</sub>
            [{/if}]
            [{if $product->getFPrice()}]
            <div class="price [{if $product->getFTPrice()}]green[{else}]black[{/if}]"><span class="f_price">[{ $product->getFPrice() }]</span> [{ $currency->sign}]</div>
            [{else}]
            <big>&nbsp;</big>
            [{/if}]
            </div>
            <p class="dinfo">
                [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
		[{if $_oPrice && $_oPrice->getVat() > 0 }]
                [{ oxmultilang ident="DETAILS_PLUSSHIPPING" }]
                [{else}]
                [{ oxmultilang ident="DETAILS_PLUSSHIPPING_PLUS" }]
                [{/if}]
                <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="DETAILS_PLUSSHIPPING2" }]</a></sup>
                [{/oxifcontent}]
            </p><br/>
            <input name="am" value="1" type="hidden" />
            <input type="submit" name="tobasket" class="btn" value="[{ oxmultilang ident="DETAILS_ADDTOCART" }]"/>
        </div>
        <div class="clearboth"></div>
    </div>
</form>
