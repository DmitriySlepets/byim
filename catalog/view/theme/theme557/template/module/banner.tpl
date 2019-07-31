<div class="container">
<div id="banner<?php echo $module; ?>" class="banners row">
	<?php foreach ($banners as $banner) { ?>
	<?php if ($banner['link']) { ?>
	<div class="col-sm-4">
		<div class="banner-box">
			<a class="clearfix" href="<?php echo $banner['link']; ?>">
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
				<?php if ($banner['description']) { ?>
				<div class="s-desc"><span><?php echo $banner['description']; ?></span></div>
				<?php } ?>
			</a>
		</div>
	</div>
	<?php } else { ?>
	<div class="col-sm-4">
		<div class="banner-box">
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php if ($banner['description']) { ?>
			<div class="s-desc"><span><?php echo $banner['description']; ?></span></div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php } ?>
	<div class="clear"></div>
</div>
</div>
