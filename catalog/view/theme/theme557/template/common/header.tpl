<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>"/>
	<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>"/>
	<?php } else { 
				switch ($_SERVER['REQUEST_URI']){
					case '/sitemap/':
						echo '<meta name="description" content="Карта сайта - навигация с важными ссылками нашего сайта."/>';
						break;
					case '/okur-tekstil.html':
						echo '<meta name="description" content="Информация о производителе женской одежды и аксессуаров Okur Tekstil."/>';
						break;
					case '/leon-jeans-tekstil.html':
						echo '<meta name="description" content="Информация о производителе женской одежды и аксессуаров Leon Jeans Tekstil."/>';
						break;
					case '/tare-tekstil-ltd.html':
						echo '<meta name="description" content="Информация о производителе женской одежды и аксессуаров Tare Tekstil Ltd."/>';
						break;
				} 
			} ?>
			
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>"/>
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
		<link rel="shortcut icon" type="image/x-icon" href="/image/catalog/favicon.ico"/> <!-- Добавил иконку для Яндекса -->
		<link href="<?php echo $icon; ?>" rel="icon"/>
	<?php } ?>

	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href='//fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700,300italic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Mr+De+Haviland' rel='stylesheet' type='text/css'>


	<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/magnificent.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" rel="stylesheet">
	<?php foreach ($styles as $style) { ?>
		<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
			  media="<?php echo $style['media']; ?>"/>
	<?php } ?>
	<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>


	<!--custom script-->
	<?php foreach ($scripts as $script) { ?>
		<?php if (strcmp($script, 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js') != 0) { ?>
			<script src="<?php echo $script; ?>" type="text/javascript"></script>
		<?php } ?>
	<?php } ?>
	<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'>
		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img
			src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
			height="42" width="820"
			alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
		</a>
	</div><![endif]-->
	<?php echo $google_analytics; ?>
	<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">
	<script type="text/javascript">(window.Image ? (new Image()) : document.createElement('img')).src = 'https://vk.com/rtrg?p=VK-RTRG-158668-9y9li';</script>
	<script type="text/javascript" src="//vk.com/js/api/openapi.js?147"></script>
</head>
<body class="<?php echo $class; ?>">
<p id="gl_path" class="hidden"><?php echo $theme_path; ?></p>
<!-- swipe menu -->
<div class="swipe">
	<div class="swipe-menu">
		<ul>

			<li>
				<a rel="nofollow" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i>
					<span><?php echo $text_account; ?></span></a>
			</li>
			<?php if ($logged) { ?>
				<li>
					<a rel="nofollow" href="<?php echo $order; ?>"><i class="fa fa-file-text-o"></i><?php echo $text_order; ?></a>
				</li>
				<li>
					<a rel="nofollow" href="<?php echo $transaction; ?>"><i class="fa fa-exchange"></i><?php echo $text_transaction; ?>
					</a>
				</li>
				<li>
					<a rel="nofollow" href="<?php echo $download; ?>"><i class="fa fa-download"></i><?php echo $text_download; ?></a>
				</li>
				<li>
					<a rel="nofollow" href="<?php echo $logout; ?>"><i class="fa fa-unlock"></i><?php echo $text_logout; ?></a>
				</li>
			<?php } else { ?>
				<li>
					<a class="hidden-link" rel="nofollow" href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a>
				</li>
				<li>
					<a class="hidden-link" rel="nofollow" href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a>
				</li>
			<?php } ?>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $wishlist; ?>" id="wishlist-total2" title="<?php echo $text_wishlist; ?>"><i
						class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span>
				</a>
			</li>
			<li>
				<a rel="nofollow" href="<?php echo $shopping_cart; ?>" onclick="yaCounter38314050.reachGoal('click2'); ga('send', 'event', 'Order2', 'view2');" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a>
			</li>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $checkout; ?>" onclick="yaCounter38314050.reachGoal('click2'); ga('send', 'event', 'Order2', 'view2');" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i>
					<span><?php echo $text_checkout; ?></span></a>
			</li>
		</ul>
		<?php if ($maintenance == 0) { ?>
			<ul class="foot">
				<?php if ($informations) { ?>
					<?php foreach ($informations as $information) { ?>
						<li>
							<a rel="nofollow" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
						</li>
					<?php } ?>
				<?php } ?>
			</ul>
		<?php } ?>
		<ul class="foot foot-1">
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
			</li>
			<!--<li>
				<a rel="nofollow" href="<?php echo $return; ?>"><?php echo $text_return; ?></a>
			</li>-->
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
			</li>
		</ul>

		<ul class="foot foot-2">
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a>
			</li>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a>
			</li>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a>
			</li>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $special; ?>"><?php echo $text_special; ?></a>
			</li>
		</ul>
		<ul class="foot foot-3">
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
			</li>
			<li>
				<a class="hidden-link" rel="nofollow" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
			</li>
		</ul>
	</div>
</div>
<div id="page">
	<div class="shadow"></div>
	<div class="toprow-1">
		<a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
	</div>

	<header class="header">
		<nav id="top-links" class="nav">
			<div class="container">
				<?php //echo $search; ?>
				<?php echo $currency; ?>
				<?php echo $language; ?>
				<ul class="list-inline">
					<li class="first">
						<a href="<?php echo $home; ?>"><i
								class="fa fa-home"></i><span><?php echo $text_home; ?></span>
						</a>
					</li>
					<li class="dropdown">
						<a rel="nofollow" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"
						   class="dropdown-toggle"
						   data-toggle="dropdown"><i class="fa fa-user"></i>
							<span><?php echo $text_account; ?></span>
							<span class="caret"></span></a>
						<ul class="dropdown-menu dropdown-menu-left">
							<?php if ($logged) { ?>
								<li>
									<a rel="nofollow" href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
								</li>
								<li>
									<a rel="nofollow" href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
								</li>
								<li>
									<a rel="nofollow" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
								</li>
								<li>
									<a rel="nofollow" href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
								</li>
								<li>
									<a rel="nofollow" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
								</li>
							<?php } else { ?>
								<li>
									<a rel="nofollow" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
								</li>
								<li>
									<a rel="nofollow" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
								</li>
							<?php } ?>
						</ul>
					</li>
					<li>
						<a rel="nofollow" href="<?php echo $wishlist; ?>" id="wishlist-total"
						   title="<?php echo $text_wishlist; ?>"><i
								class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a>
					</li>
					<li>
						<a rel="nofollow" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i
								class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span>
						</a>
					</li>
					<li>
						<a rel="nofollow" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i
								class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a>
					</li>
                                        <li>
						<a rel="nofollow" href="index.php?route=information/information&information_id=9" title="Как сделать заказ"><i
								class="fa fa-info-circle"></i> <span>Как сделать заказ</span></a>
					</li>
                                        <li>
						<a rel="nofollow" href="index.php?route=information/information&information_id=6" title="Доставка и оплата"><i
								class="fa fa-info-circle"></i> <span>Доставка и оплата</span></a>
					</li>
                                        <li>
						<a rel="nofollow" href="index.php?route=information/information&information_id=4" title="Возврат"><i
								class="fa fa-info-circle"></i> <span>Возврат</span></a>
					</li>
					<li>
						<a rel="nofollow" href="contact-us/" title="Контактная информация"><i
								class="fa fa-map"></i> <span>Контакты</span></a>
					</li>
                                        <li>
						<a rel="nofollow" href="tel:80445553590" title="Телефон"><i
								class="fa fa-phone"></i> <span>8 (044) 555-35-90</span></a>
					</li>
				</ul>
				
				<?php echo $search; ?>
					
				</div>
			</nav>
		<div class="container">
		<div class="header_top">
			<div id="logo" class="logo">
				<?php if ($logo) { ?>
					<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
														alt="<?php echo $name; ?>" class="img-responsive"/></a>
				<?php } else { ?>
					<h1>
						<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
					</h1>
				<?php } ?>
			</div>
			<?php echo $cart; ?>
		</div>
		</div>

		<?php if ($categories) { ?>
			<div class="container">
				<div id="menu-gadget" class="menu-gadget">
					<div id="menu-icon" class="menu-icon"><?php echo $text_category; ?></div>
					<?php if ($categories_tm) {
						echo $categories_tm;
					} ?>
				</div>
			</div>
		<?php } ?>
		<?php if ($categories) { ?>
			<div id="tm_menu" class="nav__primary menu-wrap">
				<div class="container">
					<?php if ($categories_tm) {
						echo $categories_tm;
					} ?>
					<div class="clear"></div>
				</div>
			</div>
		<?php } ?>
	</header>



