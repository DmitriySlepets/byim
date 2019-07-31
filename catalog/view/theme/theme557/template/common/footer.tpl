<footer>
	<div class="footer_bottom">
  <div class="container">
	<div class="row">
		<!-- VK Widget -->
		<div id="vk_community_messages"></div>
		<script type="text/javascript">
		VK.Widgets.CommunityMessages("vk_community_messages", 109646873, {disableExpandChatSound: "1",disableNewMessagesSound: "1",tooltipButtonText: "Есть вопрос?"});
		</script>
		<div class="col-sm-3">
			<div class="footer_box">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="list-unstyled">
				<li><a rel="nofollow" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-3">

		<?php if ($informations) { ?>
			<div class="footer_box">
				<h5><?php echo $text_information; ?></h5>
				<ul class="list-unstyled">
				<?php foreach ($informations as $information) { ?>
				<li><a rel="nofollow" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		<div class="col-sm-3">
			<div class="footer_box">
				<h5><?php echo $text_account; ?></h5>
				<ul class="list-unstyled">
				<li><a rel="nofollow" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-3">
			<div class="footer_box">
				<h5><?php echo $text_service; ?></h5>
				<ul class="list-unstyled">
				<li><a rel="nofollow" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a rel="nofollow" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
		</div>


	</div>

  </div>
  </div>
	<div class="copyright">
		<div class="container">
			<div class="phone">
				<a href="<?php echo $contact; ?>" rel="nofollow"><i class="fa fa-phone"></i></a> <span><?php echo $telephone; ?></span>
			</div>
			<ul class="socials">
                            <li><a href="https://vk.com/sohido" target="_blank"><i class="fa fa-vk"></i></a></li>
                            <li><a href="https://www.instagram.com/sohido.by/" target="_blank"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="https://ok.ru/group/53074384453773" target="_blank"><i class="fa fa-odnoklassniki"></i></a></li>
                            <li><a href="https://www.facebook.com/groups/183753922089087/" target="_blank"><i class="fa fa-facebook"></i></a></li>
			</ul>
			<?php //echo $powered; ?><!-- [[%FOOTER_LINK]] -->
		</div>
		<div class="container">
			<hr>
		<div class="row info_ip"><!--noindex-->
			<div class="col-sm-2">
				<!-- VK Widget -->
				<div id="vk_groups"></div>
				<script type="text/javascript">
				VK.Widgets.Group("vk_groups", {mode: 3}, 109646873);
				</script>
			</div>
			<div class="col-sm-5 padding-left-40">
				<p><?php echo $powered=str_replace('Работает на <a href="http://opencart-russia.ru">OpenCart</a><br /> ', '', $powered); ?></p>
				<!--noindex-->
				<p>Реквизиты: ИП Тыкназ Дарья Борисовна УНП 690581260</p>
				<p>Свидетельство о государственной регистрации выдано Борисовским райисполкомом 29 июня 2012.</p>
				<p>Регистрационный номер в Торговом реестре Республики Беларусь:335095 от 13.06.2016.</p>
				<p>Юридический адрес: Республика Беларусь, г.Борисов, ул.Краснознаменная, 60-81.</p>
				<p>Фактический адрес: Республика Беларусь, г.Минск, пр.Дзержинского, 106.</p>
			</div>
			<div class="col-sm-5 payment">
					<img src="/image/catalog/shop/payment/belkart.jpg" alt="Belkart">
					<img src="/image/catalog/shop/payment/mastercard.jpg" alt="MasterCard">
					<img src="/image/catalog/shop/payment/mastercard-securecode.jpg" alt="MasterCard SecureCode">
					<img src="/image/catalog/shop/payment/visa.jpg" alt="VISA">
					<img src="/image/catalog/shop/payment/verified by visa.jpg" alt="Verified by VISA">
					<a target="_blank" href="https://webpay.by/" rel="nofollow"><img src="/image/catalog/shop/payment/webpay.jpg" alt="Webpay"></a>
					<br>
					<p>Телефон: +375 (44) 555-35-90</p>
					<p>Режим работы интернет-магазина (обработка заказов):</p>
					<p>Пн-пт с 10:00 до 18:00, суббота и воскресенье - выходной.
					<!--/noindex-->
			</div>
		</div>
		<!-- Yandex.Metrika counter -->
		<script type="text/javascript" >
		   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
		   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
		   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

		   ym(43093824, "init", {
		        clickmap:true,
		        trackLinks:true,
		        accurateTrackBounce:true
		   });
		</script>
		<noscript><div><img src="https://mc.yandex.ru/watch/43093824" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
		<!-- /Yandex.Metrika counter -->
		</div>
	</div>
	<?php if ($footer_top) { ?>
	<div class="footer">
		<?php if ($maintenance == 0){ ?>
				<?php echo $footer_top; ?>
			<?php } ?>
	</div>
	<?php } ?>
</footer>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
</div>

</body></html>
