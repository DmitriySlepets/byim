<footer>
  <div class="container">
	<div class="row">
		<div class="col-sm-3">
            <div class="footer_box">
				<!-- VK Widget -->
				<div id="vk_groups"></div>
				<script type="text/javascript">
				VK.Widgets.Group("vk_groups", {mode: 3}, 109646873);
				</script>

            	<?php if ($footer_top) { ?>
				<div class="footer">
					<?php if ($maintenance == 0){ ?>
							<?php echo $footer_top; ?>
						<?php } ?>
				</div>
				<?php } ?>
            </div>
        </div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="footer_box">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-2">
		<?php if ($informations) { ?>
			<div class="footer_box">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		<div class="col-sm-3">
			<div class="footer_box">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
		</div>
	</div>
  </div>
</div>
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
					<!--noindex-->
					<p class="requisites">ИП Тыкназ Дарья Борисовна УНП 690581260
					<br>Свидетельство о государственной регистрации выдано Борисовским райисполкомом 29 июня 2012.
					<br>Регистрационный номер в Торговом реестре Республики Беларусь:335095 от 13.06.2016.
					<br>Юридический адрес: Республика Беларусь, г.Борисов, ул.Краснознаменная, 60-81.
					<!--<br>Фактический адрес: Республика Беларусь, г.Минск, пр.Дзержинского, 106.--></p>
					<!--/noindex-->
				</div>
				<div class="col-sm-3">
					<ul class="socials">
						<li><a href="https://vk.com/sohido" target="_blank"><i class="fa fa-vk fa-2x"></i></a></li>
						<li><a href="https://www.instagram.com/sohido.by/" target="_blank"><i class="fa fa-instagram fa-2x"></i></a></li>
						<li><a href="https://ok.ru/group/53074384453773" target="_blank"><i class="fa fa-odnoklassniki fa-2x"></i></a></li>
						<li><a href="https://www.facebook.com/groups/183753922089087/" target="_blank"><i class="fa fa-facebook fa-2x"></i></a></li>
					</ul>
				</div>
				<div class="col-sm-3">
					<div class="phone">
						Мы на связи!
						<br><a href="tel:80445553590<?php /* echo $contact;*/ ?>"><i class="fa fa-phone"></i> <span><?php echo $telephone; ?></span></a>
						<br><a href="tel:80295553556<?php /* echo $contact;*/ ?>"><i class="fa fa-phone"></i> <span>8 (029) 555-35-56</span></a>
					</div>
				</div>
				<div class="col-sm-6 payment">
					<img src="/image/catalog/shop/payment/belkart.jpg" alt="Belkart">
					<img src="/image/catalog/shop/payment/mastercard.jpg" alt="MasterCard">
					<img src="/image/catalog/shop/payment/mastercard-securecode.jpg" alt="MasterCard SecureCode">
					<img src="/image/catalog/shop/payment/visa.jpg" alt="VISA">
					<img src="/image/catalog/shop/payment/verified by visa.jpg" alt="Verified by VISA">
					<a target="_blank" href="https://webpay.by/" rel="nofollow"><img src="/image/catalog/shop/payment/webpay.jpg" alt="Webpay"></a>
				</div>
			</div>
		</div>
	</div>
</footer>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
<script type="text/javascript" src="//vk.com/js/api/openapi.js?147"></script>

<!-- VK Widget -->
<div id="vk_community_messages"></div>
<script type="text/javascript">
  VK.Widgets.CommunityMessages("vk_community_messages", 109646873, {disableExpandChatSound: "1",disableNewMessagesSound: "1",tooltipButtonText: "Есть вопрос?"});
</script>
</div>

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(43093824, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/43093824" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

</body></html>
