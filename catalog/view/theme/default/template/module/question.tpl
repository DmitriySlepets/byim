<?php if ($question_status) { ?>
  <div class="tab-pane" id="tab-question">
    <?php if ($page_product_customer_status) { ?>
	  <?php if ($questions > 2) { ?>
        <div class="buttons clearfix">
		  <?php if ($page_product_customer_logged_status) { ?>
            <div class="pull-right"><a class="btn btn-primary" id="add-new-question-product-top"><?php echo $button_add; ?></a></div>
			<?php } else { ?>
		    <div class="pull-right"><?php echo $text_question_logged; ?></div>
		  <?php } ?>
	    </div>
	  <?php } ?>
	<?php } ?>
	<div id="question"></div>
	<?php if ($page_product_customer_status) { ?>
	  <div class="buttons clearfix">
	    <?php if ($page_product_customer_logged_status) { ?>
		  <div class="pull-right"><a class="btn btn-primary" id="add-new-question-product-bottom"><?php echo $button_add; ?></a></div>
		  <?php } else { ?>
		  <div class="pull-right"><?php echo $text_question_logged; ?></div>
		<?php } ?>
	  </div>
	<?php } ?>
  </div>
  <div class="modal fade" id="new-question-product" tabindex="-1" role="dialog" aria-labelledby="new-question-label" aria-hidden="true">
    <div id="new-question-product-box"></div>
  </div>
<script type="text/javascript"><!--
$('#question').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#question').fadeOut('slow');

    $('#question').load(this.href);

    $('#question').fadeIn('slow');
});

$('#question').load('index.php?route=module/question/info&product_id=<?php echo $product_id; ?>');
//--></script> 
<script type="text/javascript"><!--
$('#add-new-question-product-top, #add-new-question-product-bottom').on('click', function() {						
	$('#new-question-product').modal('show');
	$('#new-question-product-box').load('index.php?route=information/question/add&product_id=<?php echo $product_id; ?>');	
});
//--></script>
<script type="text/javascript"><!--
$(".modal").on("show.bs.modal", function(){
    var $bodyWidth = $("body").width();
    $("body").css({'overflow-y': "hidden"}).css({'padding-right': ($("body").width()-$bodyWidth)});
});

$(".modal").on("hidden.bs.modal", function(){
    $("body").css({'padding-right': "0", 'overflow-y': "auto"});
});
--></script>
<?php } ?>
