<div class="box-cart">
<div id="cart" class="cart">
	<button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle">
		<i class="fa fa-shopping-cart"></i> 
		<strong><?php echo $text_shopping_cart; ?></strong>
		<span id="cart-total" class="cart-total"><?php echo $text_items; ?></span>
		<?php if (isset($text_items2)) { ?><span id="cart-total2" class="cart-total2"><?php echo $text_items2; ?></span><?php } ?>
		<?php if (isset($text_items2)) { ?><span id="cart-total3" class="cart-total3"><?php echo $text_items3; ?></span><?php } ?>
	</button>
  <ul class="dropdown-menu pull-right">
	<?php if ($products || $vouchers) { ?>
	<li>
		<div>
	  <table class="table">
		<?php foreach ($products as $product) { ?>
		<tr>
		  <td class="text-center"><?php if ($product['thumb']) { ?>
			<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a></div>
			<?php } ?></td>
		  <td class="text-left">
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<?php if ($product['option']) { ?>
			<?php foreach ($product['option'] as $option) { ?>
			
			- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
			<?php } ?>
			<?php } ?>
			<?php if ($product['recurring']) { ?>
			<br />
			- <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
			<?php } ?>
			<!--<div> x <?php echo $product['quantity']; ?>  <span class="price-cart"><?php echo $product['total']; ?></span></div>-->
			<div> x <?php echo $product['quantity']; ?>  <span class="price-cart"><?php echo substr(preg_replace("/[^\d.]/", "", $product['total']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $product['total']."00"), 0, '.', ' ').") бел.руб."; ?></span></div>
			</td>
		  
		  <td class="text-right"></td>
		  <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
		</tr>
		<?php } ?>
		<?php foreach ($vouchers as $voucher) { ?>
		<tr>
		  <td class="text-center"></td>
		  <td class="text-left"><?php echo $voucher['description']; ?></td>
		  <td class="text-right">x&nbsp;1</td>
		  <td class="text-right"><?php echo $voucher['amount']; ?></td>
		  <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
		</tr>
		<?php } ?>
	  </table>
		</div>
	</li>
	<li>
	  <div>
		<table class="table total">
		  <?php foreach ($totals as $total) { ?>
		  <tr>
			<td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
			<!--<td class="text-right"><?php echo $total['text']; ?></td>-->
			<td class="text-right"><?php echo substr(preg_replace("/[^\d.]/", "", $total['text']),0,-2)." (".number_format(preg_replace("/[^0-9]/", "", $total['text']."00"), 0, '.', ' ').") бел.руб."; ?></td>
		  </tr>
		  <?php } ?>
		</table>
		<p class="text-right">
			<a class="btn btn-primary" href="<?php echo $cart; ?>" onclick="yaCounter38314050.reachGoal('click2'); ga('send', 'event', 'Order2', 'view2');"><!--<i class="fa fa-shopping-cart"></i>--> <?php echo $text_cart; ?></a>
			<a class="btn btn-primary" href="<?php echo $checkout; ?>" onclick="yaCounter38314050.reachGoal('click2'); ga('send', 'event', 'Order2', 'view2');"><!--<i class="fa fa-share"></i>--> <?php echo $text_checkout; ?></a></p>
	  </div>
	</li>
	<?php } else { ?>
	<li>
	  <p class="text-center"><?php echo $text_empty; ?></p>
	</li>
	<?php } ?>
  </ul>
</div>
</div>
