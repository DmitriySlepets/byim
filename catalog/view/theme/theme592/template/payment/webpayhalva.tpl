<div class="content">
<p><?php echo $sub_text_info; ?></p>
<form action="<?php echo $action; ?>" method="post"  id="payments">
	<input type="hidden" name="*scart">
	<input type="hidden" name="wsb_language_id" value="russian">
	<input type="hidden" name="wsb_storeid" value="<?php echo $shop_id; ?>" >
	<input type="hidden" name="wsb_store" value="<?php echo $shop_name; ?>" >
	<input type="hidden" name="wsb_order_num" value="<?php echo $order_id; ?>" >
	<input type="hidden" name="wsb_version" value="2" >

	<input type="hidden" name="wsb_currency_id" value="BYN" >
	<input type="hidden" name="wsb_seed" value="<?php echo $seed; ?>">
	<input type="hidden" name="wsb_signature" value="<?php echo $hash; ?>">
	<input type="hidden" name="wsb_terminal_halva" value="<?php echo $terminal; ?>" >

	<?php echo $wsb_invoice_item_name; ?>
	<?php echo $wsb_invoice_item_quantity; ?>
	<?php echo $wsb_invoice_item_price; ?>

	<input type="hidden" name="wsb_shipping_name" value="<?php echo $wsb_shipping_name; ?>">
	<input type="hidden" name="wsb_shipping_price" value="<?php echo $wsb_shipping_price; ?>">

	<input type="hidden" name="wsb_tax" value="<?php echo $wsb_tax; ?>">
	<input type="hidden" name="wsb_discount_price" value="<?php echo $wsb_discount_price; ?>">


	<input type="hidden" name="wsb_return_url" value="<?php echo $success_url; ?>">
	<input type="hidden" name="wsb_cancel_return_url" value="<?php echo $cancel_url; ?>">
	<input type="hidden" name="wsb_notify_url" value="<?php echo $notify_url; ?>">

	<input type="hidden" name="wsb_email" value="<?php echo $wsb_email; ?>" >
	<input type="hidden" name="wsb_phone" value="<?php echo $wsb_phone; ?>" >

	<input type="hidden" name="wsb_test" value="<?php echo $wsb_test; ?>" >
	<input type="hidden" name="wsb_total" value="<?php echo $summ; ?>" >

	<table width=100% border=0>

	<?php if ($shop_mes!="") { ?>
	<tr>
		<td align=right colspan=4><textarea style="width: 100%;" name="webpayhalva_shop_mes" readonly><?php echo $shop_mes; ?></textarea></td>
	</tr>
	<?php } ?>

	<tr>
		<td align=right><?php echo $total_text . $summ . " BYN"; ?></td>
	</tr>
	</table>

</form>
</div>

<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>


<script type="text/javascript">

$(document).ready(function(){
   $("#button-confirm").click(function(event){
	$.ajax({
 		type: 'GET',
		url: 'index.php?route=payment/webpayhalva/confirm',
		success: function () {
     			$('#payments').submit();
		},

   	});

	return false;
   });
});

</script>
