<?php echo $header; echo 'fesfs';?>
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

                         ID заказа

                     </td>
                     <td class="text-right">

                         Лицо

                     </td>
                     <td class="text-right">

                         НДС

                     </td>
                     <td class="text-right">

                         Договор

                     </td>
                     <td class="text-right">

                         Название компании

                     </td>
                     <td class="text-right">

                         Телефон компании

                     </td>
                     <td class="text-right">

                         ЕДРПОУ

                     </td>
                     <td class="text-right">

                         Юридический адрес

                     </td>
                     <td class="text-right">

                         Почтовый адрес

                     </td>
                     <td class="text-right">

                         ФИО руководителя

                     </td>
                     <td class="text-right">

                         Должность руководителя

                     </td>
                     <td class="text-right">

                         Документ

                     </td>
                     <td class="text-right">

                         Рассчетный счет

                     </td>
                     <td class="text-right">

                         МФО

                     </td>
                     <td class="text-right">

                         ФИО

                     </td>
                     <td class="text-right">

                         ИНН

                     </td>


                 </tr>
                 </thead>
                 <tbody>
                 <?php if ($contracts) : ?>
                 <?php foreach ($contracts as $order) : ?>
                 <tr>
                     <td class="text-left">
                         <span data-preview="from" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['order_id']; ?></span>
                         <input type="hidden" data-input="from" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['from']; ?>" class="form-control" placeholder="<?php echo $entry_from; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['ur_lico'] == 1? 'Юридическое' : ($order['ur_lico'] == 2 ? 'Физическое' : '-'); ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left" >
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['nds'] == 1? 'Да' : ($order['ur_lico'] == 2 ? 'Нет' : '-'); ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left" >
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['contract'] == 1? 'Да' : ($order['ur_lico'] == 0 ? 'Нет' : '-'); ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['company_name']?  $order['company_name'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['company_phone']?  $order['company_phone'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="from" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['edrpou']?  $order['edrpou'] : '-'; ?></span>
                         <input type="hidden" data-input="from" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['from']; ?>" class="form-control" placeholder="<?php echo $entry_from; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['ur_addr']?  $order['ur_addr'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left" >
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['fiz_addr']?  $order['fiz_addr'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['fio_boss']?  $order['fio_boss'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="from" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['boss_position']?  $order['boss_position'] : '-'; ?></span>
                         <input type="hidden" data-input="from" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['from']; ?>" class="form-control" placeholder="<?php echo $entry_from; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['osnovanie']?  $order['osnovanie'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left" >
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['payment']?  $order['payment'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['mfo']?  $order['mfo'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left" >
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['inn']?  $order['inn'] : '-'; ?></span>
                         <input type="hidden" data-input="to" data-redirect-id="<?php echo $redirect['id']; ?>" value="<?php echo $redirect['to']; ?>" class="form-control" placeholder="<?php echo $entry_to; ?>">
                     </td>
                     <td class="text-left">
                         <span data-preview="to" data-redirect-id="<?php echo $redirect['id']; ?>"><?php echo $order['fio_ukr']?  $order['fio_ukr'] : '-'; ?></span>
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