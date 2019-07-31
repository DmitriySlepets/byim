<div class="modal-dialog modal-lg">
  <div class="modal-content">
	<div class="modal-header">
	  <button type="button" class="close" id="button-close-header">&times;</button>
	  <h4 class="modal-title" id="new-question-label"><?php echo $text_new_question; ?></h4>
	</div>
	<div class="modal-body">
	  <div id="alert-question"></div>
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-new-question">
        <div class="form-group required">
		  <label class="col-sm-2 control-label" for="questioner"><?php echo $entry_author; ?></label>
          <div class="col-sm-4">
		    <input type="text" name="questioner" value="<?php echo $questioner; ?>" placeholder="<?php echo $entry_author; ?>" id="questioner" class="form-control" />
			<input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
		  </div>
		  <label class="col-sm-2 control-label" for="email"><?php echo $entry_email; ?></label>
          <div class="col-sm-4">
		    <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="email" class="form-control" />
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-sm-2 control-label" for="input-real-customer"><?php echo $entry_category; ?></label>
          <div class="col-sm-<?php echo $col_cat; ?>">
            <select name="question_category" class="form-control">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($categories as $category) { ?>
                <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
              <?php } ?>
            </select>
          </div>
		  <label class="col-sm-2 control-label <?php echo $label; ?>" for="input-link-product"><?php echo $entry_links_product; ?></label>
          <div class="col-sm-4 <?php echo $label; ?>">
            <select name="links_product" id="input-link-product" class="form-control">
			  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
			  <option value="0"><?php echo $text_no; ?></option>
            </select>
          </div>
		</div>
		<div class="<?php echo $hidden; ?>" id="links-product-box">
		  <div class="form-group">
			<div class="required">
			  <label class="col-sm-2 control-label" for="product-id"><?php echo $entry_product; ?></label>
              <div class="col-sm-10">
		        <input type="text" name="product" value="<?php echo $product; ?>" placeholder="<?php echo $entry_product; ?>" id="product-id" class="form-control" />
				<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
			  </div>
			</div>
		  </div>
		</div>
		<div class="form-group required">
		  <label class="col-sm-2 control-label" for="subject"><?php echo $entry_subject; ?></label>
          <div class="col-sm-10">
		    <input type="text" name="subject" value="" placeholder="<?php echo $entry_subject; ?>" id="subject" class="form-control" />
		  </div>
		</div>
		<div class="form-group required">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-text-question"><?php echo $entry_text_question; ?></label>
			<textarea name="text_question" placeholder="<?php echo $entry_text_question; ?>" id="input-text-question"></textarea>
		  </div>
		</div>
		<input type="hidden" name="status" value="0" />
	  </form>
	</div>
	<div class="modal-footer">
	  <div class="btn-group">
	    <a data-form="form-new-question" class="button-save btn btn-primary btn-lg"><i class="fa fa-save"></i> <?php echo $button_save; ?></a>
	    <a id="button-close-footer" class="btn btn-danger btn-lg"><?php echo $button_cancel; ?> <i class="fa fa-times"></i></a>
	  </div>
	</div>
  </div>
</div>
<link href="catalog/view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="catalog/view/javascript/summernote/summernote.js"></script>
<script type="text/javascript"><!--
$('#input-text-question').summernote({
	height: 150
});
//--></script>
<script type="text/javascript"><!--
$(".button-save").on('click', function(){		
	$('textarea[name=\'text_question\']').html($('#input-text-question').code());
	
	$.ajax({
		url: $('#' + $(this).data('form')).attr('action'),
		type: 'post',
		dataType: 'json',
		data: $('#' + $(this).data('form') + ' input[type=\'text\'], #' + $(this).data('form') + ' input[type=\'hidden\'], #' + $(this).data('form') + ' textarea, #' + $(this).data('form') + ' select'),
		success: function(json) {
			$('.alert, .alert-error').remove();
								
			if (json['error']) {
				if (json['error']['questioner']) {
					$('input[name=\'questioner\']').after('<div class="text-danger alert-error">' + json['error']['questioner'] + '</div>');
				}
				
				if (json['error']['email']) {
					$('input[name=\'email\']').after('<div class="text-danger alert-error">' + json['error']['email'] + '</div>');
				}
				
				if (json['error']['product_id']) {
					$('input[name=\'product_id\']').after('<div class="text-danger alert-error">' + json['error']['product_id'] + '</div>');
				}
				
				if (json['error']['subject']) {
					$('input[name=\'subject\']').after('<div class="text-danger alert-error">' + json['error']['subject'] + '</div>');
				}
				
				if (json['error']['text_question']) {
					$('textarea[name=\'text_question\']').parent().append('<div class="text-danger alert-error">' + json['error']['text_question'] + '</div>');
				}	
			}
								
			if (json['success']) {
				$('#alert-question').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');			
				
				setTimeout(function(){
					$('#new-question').modal('hide');
					$('#new-question-box').empty();
					$('#new-question-product').modal('hide');
					$('#new-question-product-box').empty();
					$('#new-question-account').modal('hide');
					$('#new-question-account-box').empty();
				}, 2000)
			}
		}
	});
});  
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(e) {
	var selectLinksProduct = $('select[name=\'links_product\']');
	var linksProductBox = $('#links-product-box');
	
	function selectedLinksProduct(){
		if(selectLinksProduct.val() == '1'){
			linksProductBox.removeClass('hidden');	
		} else {
			linksProductBox.addClass('hidden');	
		}
	}	
	selectedLinksProduct();
	
	selectLinksProduct.on('change', function(){
		if(selectLinksProduct.val() == '1'){
			linksProductBox.removeClass('hidden');	
		} else {
			linksProductBox.addClass('hidden');	
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=information/question/autocomplete_product&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);		
	}	
});
//--></script>
<script type="text/javascript"><!--
$('#button-close-header, #button-close-footer').on('click', function() {
	$('#new-question').modal('hide');
	$('#new-question-box').empty();		
	$('#new-question-product').modal('hide');
	$('#new-question-product-box').empty();
	$('#new-question-account').modal('hide');
	$('#new-question-account-box').empty();
});
//--></script>