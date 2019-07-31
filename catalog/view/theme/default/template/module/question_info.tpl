<link href="catalog/view/javascript/summernote/question.css" rel="stylesheet" />
<?php if ($questions) { ?>
  <?php foreach ($questions as $question) { ?>
	<div class="form-question question-product">
	  <div class="title-question">
		<span data-toggle="tooltip" title="<?php echo $text_author; ?> <?php echo $question['questioner']; ?>"><i class="fa fa-user"></i></span>
		<span class="text-danger"><?php echo $question['date_added']; ?></span>
		<span> &bull; </span>
		<span class="text-primary"><?php echo $text_question_category; ?></span>
		<span class="text-success"><?php echo $question['category']; ?></span>
		<div>
		  <span class="text-danger"><?php echo $text_question_subject; ?></span>
		  <span class="text-success"><?php echo $question['subject']; ?></span>
		</div>
	  </div>
	  <?php echo $question['text_question']; ?>
	</div>
	<?php if ($question['text_answer'] != '') { ?>
	  <div class="form-answer answer-product">
		<div class="title-answer text-primary"><?php echo $text_answer; ?></div>
		<?php echo $question['text_answer']; ?>
	  </div>
	<?php }?>
  <?php }?>
  <div class="buttons clearfix">
	<div class="pull-right"><?php echo $pagination; ?></div>
  </div>
  <?php } else {?>
  <div class="form-group">
	<div class="col-sm-12"><?php echo $text_no_question; ?></div>
  </div>
<?php }?>
