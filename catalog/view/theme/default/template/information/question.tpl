<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	  <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="well">
	    <div class="row">
	      <div class="col-sm-2">
			<div class="input-group date">
			  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $text_date_added; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
		      <span class="input-group-btn">
				<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
			  </span>
			</div>
		  </div>
		  <div class="col-sm-3">
		    <select name="filter_question_category" onchange="filter();"  class="form-control">
			  <option value=""><?php echo $text_all; ?></option>
			  <option value="*"><?php echo $text_no_category; ?></option>
			  <?php foreach($question_categories as $key=>$question_category){?>
			    <?php if ($filter_question_category == $key) { ?>
				  <option value="<?php echo $key; ?>" selected="selected" ><?php echo $question_category; ?></option>
				  <?php } else {?>
				  <option value="<?php echo $key; ?>"><?php echo $question_category; ?></option>
			    <?php }?>
			  <?php }?>
		    </select>
		  </div>
		  <div class="col-sm-3">
			<input type="text" name="filter_subject" value="<?php echo $filter_subject; ?>" placeholder="<?php echo $text_subject; ?>" class="form-control" />
		  </div>
		  <div class="col-sm-2">
			<input type="text" name="filter_questioner" value="<?php echo $filter_questioner; ?>" placeholder="<?php echo $text_questioner; ?>" class="form-control" />
		  </div>
		  <div class="col-sm-2">
			<div class="input-group">
			  <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $text_product; ?>" class="form-control" />
			  <span class="input-group-btn">
			    <button type="button" onclick="filter();" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_search; ?>"><i class="fa fa-search"></i></button>
			  </span>
		    </div>
		  </div>		  
		</div>
	  </div>
	  <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
		    <?php if ($questions) { ?>
			  <?php foreach ($questions as $question) { ?>
			    <div class="form-question">
				  <div class="title-question">
					<span data-toggle="tooltip" title="<?php echo $text_author; ?> <?php echo $question['questioner']; ?>"><i class="fa fa-user"></i></span>
					<span class="text-danger"><?php echo $question['date_added']; ?></span>
					<span> &bull; </span>
					<span class="text-primary"><?php echo $text_question_category; ?></span>
					<span class="text-success"><?php echo $question['category']; ?></span>
					<div class="pull-right hidden-sm hidden-xs">
					  <span class="text-primary"><?php echo $text_question_subject; ?></span>
					  <span class="text-success"><?php echo $question['subject']; ?></span>
					</div>
					<div class="hidden-md hidden-lg">
					  <span class="text-danger"><?php echo $text_question_subject; ?></span>
					  <span class="text-success"><?php echo $question['subject']; ?></span>
					</div>
				  </div>
				  <?php if ($question['product_name'] != '') { ?>
				    <div class="question-product-box">
					  <a href="<?php echo $question['product_href']; ?>"><img src="<?php echo $question['product_image']; ?>" alt="<?php echo $question['product_name']; ?>" class="img-thumbnail" /><?php echo $question['product_name']; ?></a>
				    </div>
				  <?php }?>
				  <?php echo $question['text_question']; ?>
			    </div>
				<?php if ($question['text_answer'] != '') { ?>
				  <div class="form-answer">
				    <div class="title-answer text-primary"><?php echo $text_answer; ?></div>
				    <?php echo $question['text_answer']; ?>
				  </div>
				<?php }?>
			  <?php }?>
			  <?php } else {?>
			  <div class="form-group">
			    <div class="col-sm-12"><?php echo $text_no_question; ?></div>
			  </div>
			<?php }?>
		  </div>
		  <div class="row">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		  </div>
	    </div>
		<?php if ($page_faq_customer_status) { ?>
		  <div class="panel-footer">
		    <div class="text-right">
		      <?php if ($page_faq_customer_logged_status) { ?>
			    <a class="btn btn-primary" id="add-new-question"><i class="fa fa-plus"></i> <?php echo $text_new_question; ?></a>
				<?php } else { ?>
			    <?php echo $text_question_logged; ?>
			  <?php } ?>
		    </div>
		  </div>
		<?php }?>
	  </div>
	  <?php echo $content_bottom; ?> 
	</div>
    <?php echo $column_right; ?>
  </div>
</div>
<div class="modal fade" id="new-question" tabindex="-1" role="dialog" aria-labelledby="new-question-label" aria-hidden="true">
  <div id="new-question-box"></div>
</div>
<script type="text/javascript"><!--
$('#add-new-question').on('click', function() {						
	$('#new-question').modal('show');
	$('#new-question-box').load('index.php?route=information/question/add');	
});
//--></script>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=information/question';

	var filter_subject = $('input[name=\'filter_subject\']').val();
	
	if (filter_subject) {
		url += '&filter_subject=' + encodeURIComponent(filter_subject);
	}
	
	var filter_questioner = $('input[name=\'filter_questioner\']').val();
	
	if (filter_questioner) {
		url += '&filter_questioner=' + encodeURIComponent(filter_questioner);
	}
	
	var filter_name = $('input[name=\'filter_name\']').val();
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_question_category = $('select[name=\'filter_question_category\']').val();
	
	if (filter_question_category != '') {
		url += '&filter_question_category=' + encodeURIComponent(filter_question_category);
	}
	
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
				
	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=information/question/autocomplete&filter_name=' +  encodeURIComponent(request),
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
		$('input[name=\'filter_name\']').val(item['label']);
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_subject\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=information/question/autocomplete_subject&filter_subject=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['subject'],
						value: item['question_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_subject\']').val(item['label']);
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_questioner\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=information/question/autocomplete_questioner&filter_questioner=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['subject']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_questioner\']').val(item['label']);
	}
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
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?> 