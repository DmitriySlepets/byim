<div class="col-lg-4">
<div class="instagram  box-social">
	<div class="box-heading">
		<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="box-content">
		<div id="instafeed"></div>
	</div>
</div>
</div>
<script type="text/javascript">
    var userFeed = new Instafeed({
        get: <?php if ($get == 'user') { ?>'user'<?php } else { ?>'tagged'<?php } ?>,
		<?php if ($get == 'tagged') { ?>tagName:'<?php echo $tag_name; ?>',<?php } ?>
		<?php if ($get == 'tagged') { ?>clientId:'<?php echo $clientid; ?>',<?php } ?>
		
        <?php if ($get == 'user') { ?>userId: <?php echo $user_id; ?>,<?php } ?>
		limit:<?php echo $limit; ?>,
        <?php if ($get == 'user') { ?>accessToken: '<?php echo $accesstoken; ?>',<?php } ?>
		template: '<a href="{{link}}"><img src="{{image}}" /></a>'
    });
    userFeed.run();
</script>
