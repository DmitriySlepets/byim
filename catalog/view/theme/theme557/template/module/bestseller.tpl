<div class="box bestsellers">
	<div class="box-heading">
			<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="box-content">
		<div class="row">
			<?php foreach ($products as $product) { ?>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12  product-layout">
				<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
				<?php } ?>
				</div>
				<div class="product-thumb transition" >
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
					<div class="clear"></div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
