<div class="box featured">
	<!--<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>-->
	<div class="box-content">
		<div class="row">
		<?php $f=0; foreach ($products as $product) { $f++ ?>
		<div class="product-layout col-lg-3 col-md-3 col-sm-3 col-xs-12">
			
				<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
				<?php } ?>
				</div>
				
			<div class="product-thumb transition">
				<a class="quickview" data-rel="details" href="#quickview_<?php echo $f?>">
					<?php echo $text_quick; ?>
				</a>
				<div class="quick_info">
					<div id="quickview_<?php echo $f?>" class="quickview-style">
						<div>
							<div class="left col-sm-4">
									<div class="quickview_image image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>" /></a></div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) {?>
											<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturers'];?>"><?php echo $product['author']; ?></a></p>
										<?php }?>
										<?php if ($product['model']) {?>
											<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
										<?php }?>

										<?php if ($product['price']) { ?>
										<div class="price">
										<?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
										<?php } else { ?>
										<!--<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>-->
										<span class="price-new"><?php echo substr(preg_replace("/[^\d.]/", "", $product['special']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['special']."00"), 0, '.', ' ').") бел.руб."; ?></span> <span class="price-old"><?php echo substr(preg_replace("/[^\d.]/", "", $product['price']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['price']."00"), 0, '.', ' ').") бел.руб."; ?></span>
										<?php } ?>
										<?php if ($product['tax']) { ?>
										<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
										<?php } ?>
										</div>
										<?php } ?>
									</div>
									<div class="cart-button">
										<button class="btn btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>'); yaCounter38314050.reachGoal('click1'); ga('send', 'event', 'Order1', 'view1');"><i class="fa fa-shopping-cart"></i></button>
										<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<button class="btn btn-icon" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
									</div>
									<div class="clear"></div>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } else { ?>
										<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } ?>
										<?php } ?>
									</div>
										
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description']; //echo $product['description1'];?>
									</div>
								</div>
						</div>
					</div>
				</div>
			<?php if ($product['special']) { ?>
				<div class="sale"><span></span></div>
			<?php } ?>
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<div class="image">
				<a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
					href="<?php echo $product['href']; ?>">
				<img alt="<?php echo $product['name']; ?>"
					title="<?php echo $product['name']; ?>"
					class="img-responsive"
					data-src="<?php echo $product['thumb']; ?>"
					src="#"/>
				</a>
			</div>
			<div class="caption">
				<?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php if (number_format(preg_replace("/[^0-9]/", "", $product['price']."00"), 0, '.', ' ')==0){ 
                                } else {
                                        echo substr(preg_replace("/[^\d.]/", "", $product['price']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['price']."00"), 0, '.', ' ').") бел.руб.";} //echo $product['price']; ?>
				<?php } else { ?>
				<!--<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>-->
				<span class="price-new"><?php echo substr(preg_replace("/[^\d.]/", "", $product['special']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['special']."00"), 0, '.', ' ').") бел.руб."; ?></span> <span class="price-old"><?php echo substr(preg_replace("/[^\d.]/", "", $product['price']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['price']."00"), 0, '.', ' ').") бел.руб."; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
				<div class="description"><?php echo $product['description']; ?></div>
			</div>
			<div class="cart-button">
				<button class="product-btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>'); yaCounter38314050.reachGoal('click1'); ga('send', 'event', 'Order1', 'view1');">
					<span class="hidden"><?php echo $button_cart; ?></span>
					<i class="fa fa-shopping-cart"></i> 
				</button>
				<a href="<?php echo $product['href']; ?>" class="btn details" title="<?php echo $button_details; ?>" >
					<span><?php echo $button_details; ?></span>
				</a>
				
			</div>
			</div>
		</div>
		<?php } ?>
		</div>
	</div>
</div>
