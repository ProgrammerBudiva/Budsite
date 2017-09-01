<?php echo $header; ?>
<style scoped>
    .loading-overlay-container {
        position: relative;
    }
    .loading-overlay {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.8);
        font-size: 4em;
        text-align: center;
        /*padding-top: 45%;*/
        z-index: 20;
    }
</style>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $action_cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left">

                            <?php echo $column_id; ?>

                    </td>
                    <td class="text-right">

                            <?php echo $column_phone; ?>

                    </td>
                    <td class="text-right">

                            <?php echo $column_order; ?>

                    </td>
                    <td class="text-right">

                            <?php echo $column_date; ?>

                    </td>

                </tr>
                </thead>
                <tbody>
                <?php if ($orders) : ?>
                <?php foreach ($orders as $order) : ?>
                <tr>
                    <td class="text-left">
                        <span data-preview="from" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['id']; ?></span>
                        <input type="hidden" data-input="from" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['from']; ?>" class="form-control" placeholder="<?php echo $entry_from; ?>">
                    </td>
                    <td class="text-left">
                        <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['phone']; ?></span>
                        <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                    </td>
                    <td class="text-left" >
                        <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo nl2br($order['order']); ?></span>
                        <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                    </td>
                    <td class="text-left">
                        <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['date']; ?></span>
                        <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                    </td>


                </tr>
                <?php endforeach; ?>
                <?php else : ?>
                <tr>
                    <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                </tr>
                <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php echo $footer; ?>