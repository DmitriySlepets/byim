<?php if ($modules) { ?>
<aside id="column-left" class="col-sm-3 ">
  <?php $oldModule = ''; ?>
  <?php foreach ($modules as $module) { ?>
  <?php 	if($oldModule != $module){
				echo $module;
				$oldModule = $module;
			} ?>
  <?php } ?>
</aside>
<?php } ?>