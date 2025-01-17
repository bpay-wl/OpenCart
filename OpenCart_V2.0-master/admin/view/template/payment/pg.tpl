<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-payment" data-toggle="tooltip" title="<?php echo $button_save;?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel;?>" data-toggle="tooltip" title="<?php echo $button_cancel;?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
               <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning): ?>
        <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning;?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php endif;; ?>
        <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3></div>
            <div class="panel-body">
                <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-pay-id"><?php echo $entry_pay_id;?></label>
                        <div class="col-sm-10">
                            <input type="text" name="PG_pay_id" value="<?php echo $PG_pay_id;?>" placeholder="<?php echo $entry_pay_id;?>" id="input-pay-id" class="form-control" />
                            <?php if($error_pay_id): ?>
                            <div class="text-danger"><?php echo $error_pay_id;?></div>
                            <?php endif;; ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-salt"><span data-toggle="tooltip" title="<?php echo $help_salt;?>"><?php echo $entry_salt;?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="PG_salt" value="<?php echo $PG_salt;?>" placeholder="<?php echo $entry_salt;?>" id="input-salt" class="form-control" />
                            <?php if($error_salt): ?>
                            <div class="text-danger"><?php echo $error_salt;?></div>
                            <?php endif;; ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_test;?></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if($PG_test): ?>
                                <input type="radio" name="PG_test" value="1" checked="checked" />
                                <?php echo $text_yes;?>
                                <?php else: ?>
                                <input type="radio" name="PG_test" value="1" />
                                <?php echo $text_yes;?>
                                <?php endif;; ?>
                            </label>
                            <label class="radio-inline">
                                <?php if(!$PG_test):?>
                                <input type="radio" name="PG_test" value="0" checked="checked" />
                                <?php echo $text_no;?>
                                <?php else:?>
                                <input type="radio" name="PG_test" value="0" />
                                <?php echo $text_no;?>
                                <?php endif;; ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total;?>"><?php echo $entry_total;?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="PG_total" value="<?php echo $PG_total;?>" placeholder="<?php echo $entry_total;?>" id="input-total" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status;?></label>
                        <div class="col-sm-10">
                            <select name="PG_order_status_id" id="input-order-status" class="form-control">
                                <?php foreach($order_statuses as $order_status){ ?>
                                <?php if($order_status['order_status_id'] == $PG_order_status_id):?>
                                <option value="<?php echo $order_status['order_status_id'];?>" selected="selected"><?php echo $order_status['name'];?></option>
                                <?php else:?>
                                <option value="<?php echo $order_status['order_status_id'];?>"><?php echo $order_status['name'];?></option>
                                <?php endif; ?>
                                <?php }?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone;?></label>
                        <div class="col-sm-10">
					 
                            <select name="PG_geo_zone_id" id="input-geo-zone" class="form-control">
                                <option value="0"><?php echo $text_all_zones;?></option>
                                <?php foreach($geo_zones as $geo_zone){?>
                                <?php if ($geo_zone['geo_zone_id'] == $PG_geo_zone_id): ?>
                                <option value="<?php echo $geo_zone['geo_zone_id'];?>" selected="selected"><?php echo $geo_zone['name'];?></option>
                                <?php else:?>
                                <option value="<?php echo $geo_zone['geo_zone_id'];?>"><?php echo $geo_zone['name'];?></option>
                                <?php endif;?>
                                <?php }?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status;?></label>
                        <div class="col-sm-10">
                            <select name="PG_status" id="input-status" class="form-control">
                                <?php if ($PG_status): ?>
                                <option value="1" selected="selected"><?php echo $text_enabled;?></option>
                                <option value="0"><?php echo $text_disabled;?></option>
                                <?php else:?>
                                <option value="1"><?php echo $text_enabled;?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled;?></option>
                                <?php endif;?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order;?></label>
                        <div class="col-sm-10">
                            <input type="text" name="PG_sort_order" value="<?php echo $PG_sort_order;?>" placeholder="<?php echo $entry_sort_order;?>" id="input-sort-order" class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer;?> 
