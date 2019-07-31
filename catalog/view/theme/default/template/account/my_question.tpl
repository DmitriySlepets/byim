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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $text_my_question; ?></h1>
	  <?php if ($questions) { ?>
	  <div class="table-responsive">
        <table class="table table-bordered question">
		  <thead>
			<tr>
			  <td class="text-center"><?php echo $column_date_added; ?></td>
			  <td class="text-left"><?php echo $column_category; ?></td>
			  <td class="text-left"><?php echo $column_subject; ?></td>
			  <td class="text-left"><?php echo $column_product; ?></td>
			</tr>
		  </thead>
		  <?php foreach ($questions as $question) { ?>
			<tbody>            
			  <tr>
				<td class="text-center"><?php echo $question['date_added']; ?></td>
				<td class="text-left"><?php echo $question['category']; ?></td>
				<td class="text-left"><?php echo $question['subject']; ?></td>
				<td class="text-left">
				  <?php if ($question['product_id'] != '0') { ?>
				    <a href="<?php echo $question['product_href']; ?>"><img src="<?php echo $question['product_image']; ?>" alt="<?php echo $question['product']; ?>" class="img-thumbnail" /> <?php echo $question['product']; ?></a>
				    <?php } else { ?>
				    <?php echo $question['product']; ?>
				  <?php } ?>
				</td>
			  </tr>
			  <tr>
			    <td class="text-left" colspan="4">
				  <div class="form-question-account">
				    <div class="title-account"><?php echo $entry_question; ?></div>
					<?php echo $question['text_question']; ?>
				  </div>
				  <?php if ($question['text_answer'] != '') { ?>
				    <div class="form-answer-account">
					  <div class="title-account"><?php echo $text_answer; ?></div>
					  <?php echo $question['text_answer']; ?>
					</div>
				  <?php } ?>
				</td>
			  </tr>
		    </tbody>
		  <?php } ?>
		</table>
	  </div>
	  <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
	  <?php } ?>
	  <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a></div>
		<?php if ($page_account_customer_status) { ?>
		  <div class="pull-right"><a class="btn btn-primary" id="add-new-question-account"><?php echo $button_add; ?></a></div>
		<?php } ?>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<div class="modal fade" id="new-question-account" tabindex="-1" role="dialog" aria-labelledby="new-question-label" aria-hidden="true">
  <div id="new-question-account-box"></div>
</div>
<script type="text/javascript"><!--
$('#add-new-question-account').on('click', function() {						
	$('#new-question-account').modal('show');
	$('#new-question-account-box').load('index.php?route=information/question/add');	
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
<?php echo $footer; ?>