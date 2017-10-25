<?php echo $header; ?>

<style type="text/css">
.dka-width-auto   { width: auto !important; }
.dka-text-c-blue  { color: #63B8F7; }
.dka-text-c-red   { color: crimson; }
.dka-text-c-gold  { color: #c49f47; }
.dka-text-c-green { color: forestgreen; }
.dka-hr           { border: 2px solid #bbb; }
.dka-error-c      { color: crimson; }

.dka-button-stretch { width: 100%; }

a.dka-href{
	isplay: inline-block;
	outline: medium none;
	overflow: hidden;
	position: relative;
	/* transition: color 0.2s ease 0s; */
	vertical-align: top;
	z-index: 0;
	/* background: rgba(0, 0, 0, 0) none repeat scroll 0 0; */
	color: #4183c4;
	text-decoration: none;
}
a.dka-href::before{
	backface-visibility: hidden;
    background-color: #4183c4;
    bottom: 1px;
    content: "";
    height: 1px;
    left: 0;
    position: absolute;
    top: auto;
    transform: scaleX(0);
    transition: all 0.2s ease 0s;
    width: 100%;
}
a.dka-href:hover::before{
	background-color: rgba(0, 50, 100, 0.12);
	background-color: #2c76bf;
    transform: scaleX(1);
}

.dka-pointer { cursor: pointer; }
.dka-shadow-top{ border: 1px solid #dddddd; box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23); }
.dka-general-container { margin: 0 10px; padding: 4px 10px; min-height: 200px; background-color: #FFFFFF }
.dka-module-name{ color: #fff; font-size: 3em; font-weight: bold; font-family: Helvetica; text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0 #b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(0,0,0,.1), 0 0 5px rgba(0,0,0,.1), 0 1px 3px rgba(0,0,0,.3), 0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25), 0 10px 10px rgba(0,0,0,.2), 0 20px 20px rgba(0,0,0,.15); }

.ui.segment { position: relative; background: #fff; box-shadow: 0 1px 2px 0 rgba(34,36,38,.15); margin: 1rem 0; padding: 1em; border-radius: .28571429rem; border: 1px solid rgba(34,36,38,.15); }

#div_export_segment { display: none; }
/* FOOTER */
#dka-footer { margin-top: 10px; }
.dka-footer-border .mask { overflow:hidden; height:20px; }
.dka-footer-border .mask:after { content:''; display:block; margin: 20px auto 0; width:100%; height:25px; border-radius:125px / 12px; box-shadow:0 0 8px black; }
.dka-footer-social { padding-right: 2.2em; }

/* INFO CIRCLE */
.or-spacer { width: 100%; position:relative; z-index: 1; }
.or-spacer .mask { overflow:hidden; height:20px; }
.or-spacer .mask:after { content:''; display:block; margin:-25px auto 0; width:100%; height:25px; border-radius:125px / 12px; box-shadow:0 0 8px black; }
.or-spacer span { size:50px; width:60px; height:60px; position:absolute; bottom:-50%; margin-bottom:-50px/2; left:50%; margin-left:-50px/2; border-radius:100%; box-shadow:0 2px 4px #999; background:white; }
.or-spacer span .i-or-spacer { offset:4px; position:absolute; top:4px; bottom:4px; left:4px; right:4px; border-radius:100%; border:1px dashed #aaa; text-align:center; line-height:48px; font-style:normal; color:#999; }
.or-spacer span .i-or-spacer i{ line-height:48px !important; }

/* ALERT */
.dka-alert { display: none; box-shadow: inset 0px 0px 10px -2px rgba(0,0,0,.75); height: auto; }
.dka-alert table {  margin-bottom: 0; }
.dka-alert-td { width: 80px; }
.dka-alert table td { border-top: 0px !important; }
.alert-icon { width: 40px; padding: 0 10px; }
.alert-icon:hover{ cursor:pointer; color: darkgrey; opacity:0.5; }
.alert-icon i:hover{ cursor:pointer; color: black; opacity:0.5; }
.alert-icon,.alert-icon i{ transition:all 0.8s, color 0.3s 0.3s; }
.dka-alert p,.dka-alert h3 { width: 100%; }
.dka-alert .close { float: right; font-size: 1.5em; position: relative; top: -0.9em; }
.dka-alert .close:hover { color: darken(#53ca74, 40%); }
.dka-alert.success { background: #53ca74; color: #fff; padding: 0.5em 0; }
.dka-alert.info { background: #63B8F7; color: #fff; padding: 0.5em 0; }
.dka-alert.warning { background: #FF3333; color: #fff; padding: 0.5em 0; }
.dka-alert-debug{ display: none; }

/* TABS */
.nav-tabs li.active a{ color: #1c5; border-color: #fff; }
.nav-tabs li.active a:hover, .nav-tabs li.active a:focus{ color: #1ca; border-color: #fff; }
.nav-tabs { box-shadow: 0 -10px 8px -12px rgba(0, 0, 0, 0.55) inset; }
.nav-tabs li.active{ box-shadow: 0 -8px 6px 0 rgba(0, 0, 0, 0.25); }
.nav-tabs .dka-nav-tab-hide { display: none; }
/* TABS BUTTON UL */
#dka-button-panel { float: right; font-size: 1em; position: relative; right: 0.86em; }
#dka-button-panel a,#dka-button-panel i { margin-left: 10px; color: #666666; }
#dka-button-panel a:hover,#dka-button-panel i:hover{ cursor:pointer; color: forestgreen; opacity:0.5; }
/* TABLE CLASS VIEW */
.dka_table td { border-top: none !important; }
.dka_table thead td { font-weight: normal !important; }
.dka_table  thead td span[data-toggle="tooltip"]::after, label.control-label span::after { content: '';}
#div_cart { min-height: 240px; }

/* TEMPLATES */
.dka_modal .modal-content { padding: 10px; box-shadow: none; border-radius: 0; }
.dka_modal .modal-dialog { box-shadow: 0 1px 70px rgba(0, 0, 0, 0.5); }
.modal-close { color: #bbb; cursor: pointer; font-size: 30px; font-weight: 300; text-align: right; margin-top: -10px; }

/* FIX TOP PROGRESS/INFO */
#top-progress-info { display: none; text-align: center; width: 300px; height: auto; margin: 0 auto; box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23); padding: 10px; }
.dka-pie-content { display: none; }
.dka-pie-content.pie-show { display: block; }
#circle_progress .prog-circle { max-width: 160px; left: 40px; margin: 0; }

/********************CSS Percentage Circle***************************/

.prog-circle .slice {position:absolute;width: 1em;height:1em;clip:rect(0em,1em,1em,0.5em);}
.prog-circle .slice.clipauto {clip : rect(auto, auto, auto, auto);}
.prog-circle .fill, .prog-circle .bar {position:absolute;border:0.08em solid #f72020;width:0.84em;height:0.84em;clip:rect(0em, .5em, 1em, 0em);-webkit-border-radius:50%;-moz-border-radius   :50%;-ms-border-radius:50%;-o-border-radius:50%;border-radius:50%;-webkit-transform:rotate(20deg);-moz-transform:rotate(20deg);-ms-transform:rotate(20deg);-o-transform:rotate(20deg);transform:rotate(20deg);box-sizing:content-box;}
.prog-circle {position:relative;font-size:120px;width:1em;height:1em;-webkit-border-radius:50%;-moz-border-radius:50%;-ms-border-radius:50%;-o-border-radius:50%;border-radius:50%;float                :left;margin:0 0.1em 0.1em 0;background-color:#db9e9e;}
.prog-circle .percenttext {position:absolute;width:100%;height:1em;z-index:1;margin:auto;top:0;left:0;right:0;bottom:0;font-size:0.3em;color:#666666;display:block;text-align:center;white-space:nowrap;line-height:100%;-webkit-transition-duration:0.2s;-moz-transition-duration:0.2s;-o-transition-duration:0.2s;transition-duration:0.2s;-webkit-transition-timing-function:ease-out;-moz-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out;}
.prog-circle .after {position:absolute;top:0.08em;left:0.08em;display:block;content:" ";-webkit-border-radius:50%;-moz-border-radius:50%;-ms-border-radius:50%;-o-border-radius:50%;border-radius:50%;background-color:#FFFFFF;width:0.84em;height:0.84em;}

/*!
 * # Semantic UI 2.1.7 - Table
 * http://github.com/semantic-org/semantic-ui/
 *
 *
 * Copyright 2015 Contributors
 * Released under the MIT license
 * http://opensource.org/licenses/MIT
 *
 */.ui.table{width:100%;background:#fff;margin:1em 0;border:1px solid rgba(34,36,38,.15);box-shadow:none;border-radius:.28571429rem;text-align:left;color:rgba(0,0,0,.87);border-collapse:separate;border-spacing:0}.ui.table:first-child{margin-top:0}.ui.table:last-child{margin-bottom:0}
 .ui.table td,.ui.table th{-webkit-transition:background .1s ease,color .1s ease;transition:background .1s ease,color .1s ease}.ui.table thead{box-shadow:none}.ui.table thead th{cursor:auto;background:#f9fafb;text-align:inherit;color:rgba(0,0,0,.87);padding:.92857143em .71428571em;vertical-align:inherit;font-style:none;font-weight:700;text-transform:none;border-bottom:1px solid rgba(34,36,38,.1);border-left:none}.ui.table thead tr>th:first-child{border-left:none}.ui.table thead tr:first-child>th:first-child{border-radius:.28571429rem 0 0}.ui.table thead tr:first-child>th:last-child{border-radius:0 .28571429rem 0 0}.ui.table thead tr:first-child>th:only-child{border-radius:.28571429rem .28571429rem 0 0}.ui.table tfoot{box-shadow:none}.ui.table tfoot th{cursor:auto;border-top:1px solid rgba(34,36,38,.15);background:#f9fafb;text-align:inherit;color:rgba(0,0,0,.87);padding:.71428571em;vertical-align:middle;font-style:normal;font-weight:400;text-transform:none}.ui.table tfoot tr>th:first-child{border-left:none}.ui.table tfoot tr:first-child>th:first-child{border-radius:0 0 0 .28571429rem}.ui.table tfoot tr:first-child>th:last-child{border-radius:0 0 .28571429rem}.ui.table tfoot tr:first-child>th:only-child{border-radius:0 0 .28571429rem .28571429rem}.ui.table tr td{border-top:1px solid rgba(34,36,38,.1)}.ui.table tr:first-child td{border-top:none}.ui.table td{padding:.71428571em;text-align:inherit}.ui.table>.icon{vertical-align:baseline}.ui.table>.icon:only-child{margin:0}.ui.table.segment{padding:0}.ui.table.segment:after{display:none}.ui.table.segment.stacked:after{display:block}@media only screen and (max-width:767px){.ui.table:not(.unstackable){width:100%;padding:0}.ui.table:not(.unstackable) tbody,.ui.table:not(.unstackable) tr,.ui.table:not(.unstackable) tr>td,.ui.table:not(.unstackable) tr>th{width:auto!important;display:block!important}.ui.table:not(.unstackable) tfoot,.ui.table:not(.unstackable) thead{display:block}.ui.table:not(.unstackable) tr{padding-top:1em;padding-bottom:1em;box-shadow:0 -1px 0 0 rgba(0,0,0,.1) inset!important}.ui.table:not(.unstackable) tr>td,.ui.table:not(.unstackable) tr>th{background:0 0;border:none!important;padding:.25em .75em!important;box-shadow:none!important}.ui.table:not(.unstackable) td:first-child,.ui.table:not(.unstackable) th:first-child{font-weight:700}.ui.definition.table:not(.unstackable) thead th:first-child{box-shadow:none!important}}.ui.table td .image,.ui.table td .image img,.ui.table th .image,.ui.table th .image img{max-width:none}.ui.structured.table{border-collapse:collapse}.ui.structured.table thead th{border-left:none;border-right:none}.ui.structured.sortable.table thead th{border-left:1px solid rgba(34,36,38,.15);border-right:1px solid rgba(34,36,38,.15)}.ui.structured.basic.table th{border-left:none;border-right:none}.ui.structured.celled.table tr td,.ui.structured.celled.table tr th{border-left:1px solid rgba(34,36,38,.1);border-right:1px solid rgba(34,36,38,.1)}.ui.definition.table thead:not(.full-width) th:first-child{pointer-events:none;background:0 0;font-weight:400;color:rgba(0,0,0,.4);box-shadow:-1px -1px 0 1px #fff}.ui.definition.table tfoot:not(.full-width) th:first-child{pointer-events:none;background:0 0;font-weight:rgba(0,0,0,.4);color:normal;box-shadow:1px 1px 0 1px #fff}.ui.celled.definition.table thead:not(.full-width) th:first-child{box-shadow:0 -1px 0 1px #fff}.ui.celled.definition.table tfoot:not(.full-width) th:first-child{box-shadow:0 1px 0 1px #fff}.ui.definition.table tr td:first-child{background:rgba(0,0,0,.03);font-weight:700;color:rgba(0,0,0,.95)}.ui.definition.table td:nth-child(2),.ui.definition.table tfoot:not(.full-width) th:nth-child(2),.ui.definition.table thead:not(.full-width) th:nth-child(2){border-left:1px solid rgba(34,36,38,.15)}.ui.table td.positive,.ui.table tr.positive{box-shadow:0 0 0 #a3c293 inset;background:#fcfff5!important;color:#2c662d!important}.ui.table td.negative,.ui.table tr.negative{box-shadow:0 0 0 #e0b4b4 inset;background:#fff6f6!important;color:#9f3a38!important}.ui.table td.error,.ui.table tr.error{box-shadow:0 0 0 #e0b4b4 inset;background:#fff6f6!important;color:#9f3a38!important}.ui.table td.warning,.ui.table tr.warning{box-shadow:0 0 0 #c9ba9b inset;background:#fffaf3!important;color:#573a08!important}.ui.table td.active,.ui.table tr.active{box-shadow:0 0 0 rgba(0,0,0,.87) inset;background:#e0e0e0!important;color:rgba(0,0,0,.87)!important}.ui.table tr td.disabled,.ui.table tr.disabled td,.ui.table tr.disabled:hover,.ui.table tr:hover td.disabled{pointer-events:none;color:rgba(40,40,40,.3)}@media only screen and (max-width:991px){.ui[class*="tablet stackable"].table,.ui[class*="tablet stackable"].table tbody,.ui[class*="tablet stackable"].table tr,.ui[class*="tablet stackable"].table tr>td,.ui[class*="tablet stackable"].table tr>th{width:100%!important;display:block!important}.ui[class*="tablet stackable"].table{padding:0}.ui[class*="tablet stackable"].table tfoot,.ui[class*="tablet stackable"].table thead{display:block}.ui[class*="tablet stackable"].table tr{padding-top:1em;padding-bottom:1em;box-shadow:0 -1px 0 0 rgba(0,0,0,.1) inset!important}.ui[class*="tablet stackable"].table tr>td,.ui[class*="tablet stackable"].table tr>th{background:0 0;border:none!important;padding:.25em .75em;box-shadow:none!important}.ui.definition[class*="tablet stackable"].table thead th:first-child{box-shadow:none!important}}.ui.table [class*="left aligned"],.ui.table[class*="left aligned"]{text-align:left}.ui.table [class*="center aligned"],.ui.table[class*="center aligned"]{text-align:center}.ui.table [class*="right aligned"],.ui.table[class*="right aligned"]{text-align:right}.ui.table [class*="top aligned"],.ui.table[class*="top aligned"]{vertical-align:top}.ui.table [class*="middle aligned"],.ui.table[class*="middle aligned"]{vertical-align:middle}.ui.table [class*="bottom aligned"],.ui.table[class*="bottom aligned"]{vertical-align:bottom}.ui.table td.collapsing,.ui.table th.collapsing{width:1px;white-space:nowrap}.ui.fixed.table{table-layout:fixed}.ui.fixed.table td,.ui.fixed.table th{overflow:hidden;text-overflow:ellipsis}.ui.selectable.table tbody tr:hover,.ui.table tbody tr td.selectable:hover{background:rgba(0,0,0,.05)!important;color:rgba(0,0,0,.95)!important}.ui.inverted.table tbody tr td.selectable:hover,.ui.selectable.inverted.table tbody tr:hover{background:rgba(255,255,255,.08)!important;color:#fff!important}.ui.table tbody tr td.selectable{padding:0}.ui.table tbody tr td.selectable>a:not(.ui){display:block;color:inherit;padding:.71428571em}.ui.selectable.table tr.error:hover,.ui.selectable.table tr:hover td.error,.ui.table tr td.selectable.error:hover{background:#ffe7e7!important;color:#943634!important}.ui.selectable.table tr.warning:hover,.ui.selectable.table tr:hover td.warning,.ui.table tr td.selectable.warning:hover{background:#fff4e4!important;color:#493107!important}.ui.selectable.table tr.active:hover,.ui.selectable.table tr:hover td.active,.ui.table tr td.selectable.active:hover{background:#e0e0e0!important;color:rgba(0,0,0,.87)!important}.ui.selectable.table tr.positive:hover,.ui.selectable.table tr:hover td.positive,.ui.table tr td.selectable.positive:hover{background:#f7ffe6!important;color:#275b28!important}.ui.selectable.table tr.negative:hover,.ui.selectable.table tr:hover td.negative,.ui.table tr td.selectable.negative:hover{background:#ffe7e7!important;color:#943634!important}.ui.attached.table{top:0;bottom:0;border-radius:0;margin:0 -1px;width:calc(100% + 2px);max-width:calc(100% + 2px);box-shadow:none;border:1px solid #d4d4d5}.ui.attached+.ui.attached.table:not(.top){border-top:none}.ui[class*="top attached"].table{bottom:0;margin-bottom:0;top:0;margin-top:1em;border-radius:.28571429rem .28571429rem 0 0}.ui.table[class*="top attached"]:first-child{margin-top:0}.ui[class*="bottom attached"].table{bottom:0;margin-top:0;top:0;margin-bottom:1em;box-shadow:none,none;border-radius:0 0 .28571429rem .28571429rem}.ui[class*="bottom attached"].table:last-child{margin-bottom:0}.ui.striped.table tbody tr:nth-child(2n),.ui.striped.table>tr:nth-child(2n){background-color:rgba(0,0,50,.02)}.ui.inverted.striped.table tbody tr:nth-child(2n),.ui.inverted.striped.table>tr:nth-child(2n){background-color:rgba(255,255,255,.05)}.ui.table [class*="single line"],.ui.table[class*="single line"]{white-space:nowrap}.ui.red.table{border-top:.2em solid #db2828}.ui.inverted.red.table{background-color:#db2828!important;color:#fff!important}.ui.orange.table{border-top:.2em solid #f2711c}.ui.inverted.orange.table{background-color:#f2711c!important;color:#fff!important}.ui.yellow.table{border-top:.2em solid #fbbd08}.ui.inverted.yellow.table{background-color:#fbbd08!important;color:#fff!important}.ui.olive.table{border-top:.2em solid #b5cc18}.ui.inverted.olive.table{background-color:#b5cc18!important;color:#fff!important}.ui.green.table{border-top:.2em solid #21ba45}.ui.inverted.green.table{background-color:#21ba45!important;color:#fff!important}.ui.teal.table{border-top:.2em solid #00b5ad}.ui.inverted.teal.table{background-color:#00b5ad!important;color:#fff!important}.ui.blue.table{border-top:.2em solid #2185d0}.ui.inverted.blue.table{background-color:#2185d0!important;color:#fff!important}.ui.violet.table{border-top:.2em solid #6435c9}.ui.inverted.violet.table{background-color:#6435c9!important;color:#fff!important}.ui.purple.table{border-top:.2em solid #a333c8}.ui.inverted.purple.table{background-color:#a333c8!important;color:#fff!important}.ui.pink.table{border-top:.2em solid #e03997}.ui.inverted.pink.table{background-color:#e03997!important;color:#fff!important}.ui.brown.table{border-top:.2em solid #a5673f}.ui.inverted.brown.table{background-color:#a5673f!important;color:#fff!important}.ui.grey.table{border-top:.2em solid #767676}.ui.inverted.grey.table{background-color:#767676!important;color:#fff!important}.ui.black.table{border-top:.2em solid #1b1c1d}.ui.inverted.black.table{background-color:#1b1c1d!important;color:#fff!important}.ui.one.column.table td{width:100%}.ui.two.column.table td{width:50%}.ui.three.column.table td{width:33.33333333%}.ui.four.column.table td{width:25%}.ui.five.column.table td{width:20%}.ui.six.column.table td{width:16.66666667%}.ui.seven.column.table td{width:14.28571429%}.ui.eight.column.table td{width:12.5%}.ui.nine.column.table td{width:11.11111111%}.ui.ten.column.table td{width:10%}.ui.eleven.column.table td{width:9.09090909%}.ui.twelve.column.table td{width:8.33333333%}.ui.thirteen.column.table td{width:7.69230769%}.ui.fourteen.column.table td{width:7.14285714%}.ui.fifteen.column.table td{width:6.66666667%}.ui.sixteen.column.table td,.ui.table td.one.wide,.ui.table th.one.wide{width:6.25%}.ui.table td.two.wide,.ui.table th.two.wide{width:12.5%}.ui.table td.three.wide,.ui.table th.three.wide{width:18.75%}.ui.table td.four.wide,.ui.table th.four.wide{width:25%}.ui.table td.five.wide,.ui.table th.five.wide{width:31.25%}.ui.table td.six.wide,.ui.table th.six.wide{width:37.5%}.ui.table td.seven.wide,.ui.table th.seven.wide{width:43.75%}.ui.table td.eight.wide,.ui.table th.eight.wide{width:50%}.ui.table td.nine.wide,.ui.table th.nine.wide{width:56.25%}.ui.table td.ten.wide,.ui.table th.ten.wide{width:62.5%}.ui.table td.eleven.wide,.ui.table th.eleven.wide{width:68.75%}.ui.table td.twelve.wide,.ui.table th.twelve.wide{width:75%}.ui.table td.thirteen.wide,.ui.table th.thirteen.wide{width:81.25%}.ui.table td.fourteen.wide,.ui.table th.fourteen.wide{width:87.5%}.ui.table td.fifteen.wide,.ui.table th.fifteen.wide{width:93.75%}.ui.table td.sixteen.wide,.ui.table th.sixteen.wide{width:100%}.ui.sortable.table thead th{cursor:pointer;white-space:nowrap;border-left:1px solid rgba(34,36,38,.15);color:rgba(0,0,0,.87)}.ui.sortable.table thead th:first-child{border-left:none}.ui.sortable.table thead th.sorted,.ui.sortable.table thead th.sorted:hover{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.ui.sortable.table thead th:after{display:none;font-style:normal;font-weight:400;text-decoration:inherit;content:'';height:1em;width:auto;opacity:.8;margin:0 0 0 .5em;font-family:Icons}.ui.sortable.table thead th.ascending:after{content:'\f0d8'}.ui.sortable.table thead th.descending:after{content:'\f0d7'}.ui.sortable.table th.disabled:hover{cursor:auto;color:rgba(40,40,40,.3)}.ui.sortable.table thead th:hover{background:rgba(0,0,0,.05);color:rgba(0,0,0,.8)}.ui.sortable.table thead th.sorted{background:rgba(0,0,0,.05);color:rgba(0,0,0,.95)}.ui.sortable.table thead th.sorted:after{display:inline-block}.ui.sortable.table thead th.sorted:hover{background:rgba(0,0,0,.05);color:rgba(0,0,0,.95)}.ui.inverted.sortable.table thead th.sorted{background:-webkit-linear-gradient(transparent,rgba(0,0,0,.05)) rgba(255,255,255,.15);background:linear-gradient(transparent,rgba(0,0,0,.05)) rgba(255,255,255,.15);color:#fff}.ui.inverted.sortable.table thead th:hover{background:-webkit-linear-gradient(transparent,rgba(0,0,0,.05)) rgba(255,255,255,.08);background:linear-gradient(transparent,rgba(0,0,0,.05)) rgba(255,255,255,.08);color:#fff}.ui.inverted.sortable.table thead th{border-left-color:transparent;border-right-color:transparent}.ui.inverted.table{background:#333;color:rgba(255,255,255,.9);border:none}.ui.inverted.table th{background-color:rgba(0,0,0,.15);border-color:rgba(255,255,255,.1)!important;color:rgba(255,255,255,.9)}.ui.inverted.table tr td{border-color:rgba(255,255,255,.1)!important}.ui.inverted.table tr td.disabled,.ui.inverted.table tr.disabled td,.ui.inverted.table tr.disabled:hover td,.ui.inverted.table tr:hover td.disabled{pointer-events:none;color:rgba(225,225,225,.3)}.ui.inverted.definition.table tfoot:not(.full-width) th:first-child,.ui.inverted.definition.table thead:not(.full-width) th:first-child{background:#fff}.ui.inverted.definition.table tr td:first-child{background:rgba(255,255,255,.02);color:#fff}.ui.collapsing.table{width:auto}.ui.basic.table{background:0 0;border:1px solid rgba(34,36,38,.15);box-shadow:none}.ui.basic.table tfoot,.ui.basic.table thead{box-shadow:none}.ui.basic.table th{background:0 0;border-left:none}.ui.basic.table tbody tr{border-bottom:1px solid rgba(0,0,0,.1)}.ui.basic.table td{background:0 0}.ui.basic.striped.table tbody tr:nth-child(2n){background-color:rgba(0,0,0,.05)!important}.ui[class*="very basic"].table{border:none}.ui[class*="very basic"].table:not(.sortable):not(.striped) td,.ui[class*="very basic"].table:not(.sortable):not(.striped) th{padding:''}.ui[class*="very basic"].table:not(.sortable):not(.striped) td:first-child,.ui[class*="very basic"].table:not(.sortable):not(.striped) th:first-child{padding-left:0}.ui[class*="very basic"].table:not(.sortable):not(.striped) td:last-child,.ui[class*="very basic"].table:not(.sortable):not(.striped) th:last-child{padding-right:0}.ui[class*="very basic"].table:not(.sortable):not(.striped) thead tr:first-child th{padding-top:0}.ui.celled.table tr td,.ui.celled.table tr th{border-left:1px solid rgba(34,36,38,.1)}.ui.celled.table tr td:first-child,.ui.celled.table tr th:first-child{border-left:none}.ui.padded.table th{padding-left:1em;padding-right:1em}.ui.padded.table td,.ui.padded.table th{padding:1em}.ui[class*="very padded"].table th{padding-left:1.5em;padding-right:1.5em}.ui[class*="very padded"].table td{padding:1.5em}.ui.compact.table th{padding-left:.7em;padding-right:.7em}.ui.compact.table td{padding:.5em .7em}.ui[class*="very compact"].table th{padding-left:.6em;padding-right:.6em}.ui[class*="very compact"].table td{padding:.4em .6em}.ui.small.table{font-size:.9em}.ui.table{font-size:1em}.ui.large.table{font-size:1.1em}


 .ui.button{cursor:pointer;display:inline-block;min-height:1em;outline:0;border:none;vertical-align:baseline;background:#e0e1e2;color:rgba(0,0,0,.6);font-family:Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;margin:0 .25em 0 0;padding:.78571429em 1.5em;text-transform:none;text-shadow:none;font-weight:700;line-height:1em;font-style:normal;text-align:center;text-decoration:none;border-radius:.28571429rem;box-shadow:0 0 0 1px transparent inset,0 0 0 0 rgba(34,36,38,.15) inset;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;-webkit-transition:opacity .1s ease,background-color .1s ease,color .1s ease,box-shadow .1s ease,background .1s ease;transition:opacity .1s ease,background-color .1s ease,color .1s ease,box-shadow .1s ease,background .1s ease;will-change:'';-webkit-tap-highlight-color:transparent}.ui.button:hover{background-color:#cacbcd;background-image:none;box-shadow:0 0 0 1px transparent inset,0 0 0 0 rgba(34,36,38,.15) inset;color:rgba(0,0,0,.8)}.ui.button:hover .icon{opacity:.85}.ui.button:focus{background-color:#cacbcd;color:rgba(0,0,0,.8);background-image:''!important;box-shadow:''!important}.ui.button:focus .icon{opacity:.85}.ui.active.button:active,.ui.button:active{background-color:#babbbc;background-image:'';color:rgba(0,0,0,.9);box-shadow:0 0 0 1px transparent inset,none}.ui.active.button{background-color:#c0c1c2;background-image:none;box-shadow:0 0 0 1px transparent inset;color:rgba(0,0,0,.95)}.ui.active.button:hover{background-color:#c0c1c2;background-image:none;color:rgba(0,0,0,.95)}.ui.active.button:active{background-color:#c0c1c2;background-image:none}.ui.loading.loading.loading.loading.loading.loading.button{position:relative;cursor:default;text-shadow:none!important;color:transparent!important;opacity:1;pointer-events:auto;-webkit-transition:all 0s linear,opacity .1s ease;transition:all 0s linear,opacity .1s ease}.ui.loading.button:before{position:absolute;content:'';top:50%;left:50%;margin:-.64285714em 0 0 -.64285714em;width:1.28571429em;height:1.28571429em;border-radius:500rem;border:.2em solid rgba(0,0,0,.15)}.ui.loading.button:after{position:absolute;content:'';top:50%;left:50%;margin:-.64285714em 0 0 -.64285714em;width:1.28571429em;height:1.28571429em;-webkit-animation:button-spin .6s linear;animation:button-spin .6s linear;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;border-radius:500rem;border-color:#fff transparent transparent;border-style:solid;border-width:.2em;box-shadow:0 0 0 1px transparent}.ui.labeled.icon.loading.button .icon{background-color:transparent;box-shadow:none}@-webkit-keyframes button-spin{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes button-spin{from{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.ui.basic.loading.button:not(.inverted):before{border-color:rgba(0,0,0,.1)}.ui.basic.loading.button:not(.inverted):after{border-top-color:#767676}.ui.button:disabled,.ui.buttons .disabled.button,.ui.disabled.active.button,.ui.disabled.button,.ui.disabled.button:hover{cursor:default;opacity:.45!important;background-image:none!important;box-shadow:none!important;pointer-events:none}.ui.basic.buttons .ui.disabled.button{border-color:rgba(34,36,38,.5)}.ui.animated.button{position:relative;overflow:hidden;padding-right:0!important;vertical-align:middle;z-index:1}.ui.animated.button .content{will-change:transform,opacity}.ui.animated.button .visible.content{position:relative;margin-right:1.5em;left:auto;right:0}.ui.animated.button .hidden.content{position:absolute;width:100%;top:50%;left:auto;right:-100%;margin-top:-.5em}.ui.animated.button .hidden.content,.ui.animated.button .visible.content{-webkit-transition:right .3s ease 0s;transition:right .3s ease 0s}.ui.animated.button:focus .visible.content,.ui.animated.button:hover .visible.content{left:auto;right:200%}.ui.animated.button:focus .hidden.content,.ui.animated.button:hover .hidden.content{left:auto;right:0}.ui.vertical.animated.button .hidden.content,.ui.vertical.animated.button .visible.content{-webkit-transition:top .3s ease,-webkit-transform .3s ease;transition:top .3s ease,transform .3s ease}.ui.vertical.animated.button .visible.content{-webkit-transform:translateY(0);-ms-transform:translateY(0);transform:translateY(0);right:auto}.ui.vertical.animated.button .hidden.content{top:-50%;left:0;right:auto}.ui.vertical.animated.button:focus .visible.content,.ui.vertical.animated.button:hover .visible.content{-webkit-transform:translateY(200%);-ms-transform:translateY(200%);transform:translateY(200%);right:auto}.ui.vertical.animated.button:focus .hidden.content,.ui.vertical.animated.button:hover .hidden.content{top:50%;right:auto}.ui.fade.animated.button .hidden.content,.ui.fade.animated.button .visible.content{-webkit-transition:opacity .3s ease,-webkit-transform .3s ease;transition:opacity .3s ease,transform .3s ease}.ui.fade.animated.button .visible.content{left:auto;right:auto;opacity:1;-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.ui.fade.animated.button .hidden.content{opacity:0;left:0;right:auto;-webkit-transform:scale(1.5);-ms-transform:scale(1.5);transform:scale(1.5)}.ui.fade.animated.button:focus .visible.content,.ui.fade.animated.button:hover .visible.content{left:auto;right:auto;opacity:0;-webkit-transform:scale(.75);-ms-transform:scale(.75);transform:scale(.75)}.ui.fade.animated.button:focus .hidden.content,.ui.fade.animated.button:hover .hidden.content{left:0;right:auto;opacity:1;-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.ui.inverted.button{box-shadow:0 0 0 2px #fff inset!important;background:0 0;color:#fff;text-shadow:none!important}.ui.inverted.buttons .button{margin:0 0 0 -2px}.ui.inverted.buttons .button:first-child{margin-left:0}.ui.inverted.vertical.buttons .button{margin:0 0 -2px}.ui.inverted.vertical.buttons .button:first-child{margin-top:0}.ui.inverted.button.active,.ui.inverted.button:focus,.ui.inverted.button:hover{background:#fff;box-shadow:0 0 0 2px #fff inset!important;color:rgba(0,0,0,.8)}.ui.inverted.button.active:focus{background:#dcddde;box-shadow:0 0 0 2px #dcddde inset!important;color:rgba(0,0,0,.8)}.ui.labeled.button:not(.icon){display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;background:0 0!important;padding:0!important;border:none!important;box-shadow:none!important}.ui.labeled.button>.button{margin:0}.ui.labeled.button>.label{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;margin:0 0 0 -1px!important;padding:'';font-size:1em;border-color:rgba(34,36,38,.15)}.ui.labeled.button>.tag.label:before{width:1.85em;height:1.85em}.ui.labeled.button:not([class*="left labeled"])>.button{border-top-right-radius:0;border-bottom-right-radius:0}.ui.labeled.button:not([class*="left labeled"])>.label,.ui[class*="left labeled"].button>.button{border-top-left-radius:0;border-bottom-left-radius:0}.ui[class*="left labeled"].button>.label{border-top-right-radius:0;border-bottom-right-radius:0}.ui.facebook.button{background-color:#3b5998;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.facebook.button:hover{background-color:#304d8a;color:#fff;text-shadow:none}.ui.facebook.button:active{background-color:#2d4373;color:#fff;text-shadow:none}.ui.twitter.button{background-color:#0084b4;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.twitter.button:hover{background-color:#00719b;color:#fff;text-shadow:none}.ui.twitter.button:active{background-color:#005f81;color:#fff;text-shadow:none}.ui.google.plus.button{background-color:#dc4a38;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.google.plus.button:hover{background-color:#de321d;color:#fff;text-shadow:none}.ui.google.plus.button:active{background-color:#bf3322;color:#fff;text-shadow:none}.ui.linkedin.button{background-color:#1f88be;color:#fff;text-shadow:none}.ui.linkedin.button:hover{background-color:#147baf;color:#fff;text-shadow:none}.ui.linkedin.button:active{background-color:#186992;color:#fff;text-shadow:none}.ui.youtube.button{background-color:#cc181e;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.youtube.button:hover{background-color:#bd0d13;color:#fff;text-shadow:none}.ui.youtube.button:active{background-color:#9e1317;color:#fff;text-shadow:none}.ui.instagram.button{background-color:#49769c;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.instagram.button:hover{background-color:#3d698e;color:#fff;text-shadow:none}.ui.instagram.button:active{background-color:#395c79;color:#fff;text-shadow:none}.ui.pinterest.button{background-color:#00aced;color:#fff;text-shadow:none;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.pinterest.button:hover{background-color:#0099d4;color:#fff;text-shadow:none}.ui.pinterest.button:active{background-color:#0087ba;color:#fff;text-shadow:none}.ui.vk.button{background-color:#4D7198;color:#fff;background-image:none;box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.vk.button:hover{background-color:#41648a;color:#fff}.ui.vk.button:active{background-color:#3c5876;color:#fff}.ui.button>.icon:not(.button){height:.85714286em;opacity:.8;margin:0 .42857143em 0 -.21428571em;-webkit-transition:opacity .1s ease;transition:opacity .1s ease;vertical-align:'';color:''}.ui.button>.right.icon:not(.button){margin:0 -.21428571em 0 .42857143em}.ui[class*="left floated"].button,.ui[class*="left floated"].buttons{float:left;margin-left:0;margin-right:.25em}.ui[class*="right floated"].button,.ui[class*="right floated"].buttons{float:right;margin-right:0;margin-left:.25em}.ui.compact.button,.ui.compact.buttons .button{padding:.58928571em 1.125em}.ui.compact.icon.button,.ui.compact.icon.buttons .button{padding:.58928571em}.ui.compact.labeled.icon.button,.ui.compact.labeled.icon.buttons .button{padding:.58928571em 3.69642857em}.ui.mini.button,.ui.mini.buttons .button,.ui.mini.buttons .or{font-size:.71428571rem}.ui.tiny.button,.ui.tiny.buttons .button,.ui.tiny.buttons .or{font-size:.85714286rem}.ui.small.button,.ui.small.buttons .button,.ui.small.buttons .or{font-size:.92857143rem}.ui.button,.ui.buttons .button,.ui.buttons .or{font-size:1rem}.ui.large.button,.ui.large.buttons .button,.ui.large.buttons .or{font-size:1.14285714rem}.ui.big.button,.ui.big.buttons .button,.ui.big.buttons .or{font-size:1.28571429rem}.ui.huge.button,.ui.huge.buttons .button,.ui.huge.buttons .or{font-size:1.42857143rem}.ui.massive.button,.ui.massive.buttons .button,.ui.massive.buttons .or{font-size:1.71428571rem}.ui.icon.button,.ui.icon.buttons .button{padding:.78571429em}.ui.icon.button>.icon,.ui.icon.buttons .button>.icon{opacity:.9;margin:0;vertical-align:top}.ui.basic.button,.ui.basic.buttons .button{background:0 0!important;color:rgba(0,0,0,.6)!important;font-weight:400;border-radius:.28571429rem;text-transform:none;text-shadow:none!important;box-shadow:0 0 0 1px rgba(34,36,38,.15) inset}.ui.basic.buttons{box-shadow:none;border:1px solid rgba(34,36,38,.15);border-radius:.28571429rem}.ui.basic.button:focus,.ui.basic.button:hover,.ui.basic.buttons .button:focus,.ui.basic.buttons .button:hover{background:#fff!important;color:rgba(0,0,0,.8)!important;box-shadow:0 0 0 1px rgba(34,36,38,.35) inset,0 0 0 0 rgba(34,36,38,.15) inset}.ui.basic.button:active,.ui.basic.buttons .button:active{background:#f8f8f8!important;color:rgba(0,0,0,.9)!important;box-shadow:0 0 0 1px rgba(0,0,0,.15) inset,0 1px 4px 0 rgba(34,36,38,.15) inset}.ui.basic.active.button,.ui.basic.buttons .active.button{background:rgba(0,0,0,.05)!important;box-shadow:''!important;color:rgba(0,0,0,.95)}.ui.basic.active.button:hover,.ui.basic.buttons .active.button:hover{background-color:rgba(0,0,0,.05)}.ui.basic.buttons .button:hover{box-shadow:0 0 0 1px rgba(34,36,38,.35) inset,0 0 0 0 rgba(34,36,38,.15) inset inset}.ui.basic.buttons .button:active{box-shadow:0 0 0 1px rgba(0,0,0,.15) inset,0 1px 4px 0 rgba(34,36,38,.15) inset inset}.ui.basic.buttons .active.button{box-shadow:rgba(34,36,38,.35) inset}.ui.basic.inverted.button,.ui.basic.inverted.buttons .button{background-color:transparent!important;color:#f9fafb!important;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important}.ui.basic.inverted.button:focus,.ui.basic.inverted.button:hover,.ui.basic.inverted.buttons .button:focus,.ui.basic.inverted.buttons .button:hover{color:#fff!important;box-shadow:0 0 0 2px #fff inset!important}.ui.basic.inverted.button:active,.ui.basic.inverted.buttons .button:active{background-color:rgba(255,255,255,.08)!important;color:#fff!important;box-shadow:0 0 0 2px rgba(255,255,255,.9) inset!important}.ui.basic.inverted.active.button,.ui.basic.inverted.buttons .active.button{background-color:rgba(255,255,255,.08);color:#fff;text-shadow:none;box-shadow:0 0 0 2px rgba(255,255,255,.7) inset}.ui.basic.inverted.active.button:hover,.ui.basic.inverted.buttons .active.button:hover{background-color:rgba(255,255,255,.15);box-shadow:0 0 0 2px #fff inset!important}.ui.basic.buttons .button{border-radius:0;border-left:1px solid rgba(34,36,38,.15);box-shadow:none}.ui.basic.vertical.buttons .button{border-left:none;border-left-width:0;border-top:1px solid rgba(34,36,38,.15)}.ui.basic.vertical.buttons .button:first-child{border-top-width:0}.ui.labeled.icon.button,.ui.labeled.icon.buttons .button{position:relative;padding-left:4.07142857em!important;padding-right:1.5em!important}.ui.labeled.icon.button>.icon,.ui.labeled.icon.buttons>.button>.icon{position:absolute;height:100%;line-height:1;border-radius:0;border-top-left-radius:inherit;border-bottom-left-radius:inherit;text-align:center;margin:0;width:2.57142857em;background-color:rgba(0,0,0,.05);color:'';box-shadow:-1px 0 0 0 transparent inset;top:0;left:0}.ui[class*="right labeled"].icon.button{padding-right:4.07142857em!important;padding-left:1.5em!important}.ui[class*="right labeled"].icon.button>.icon{left:auto;right:0;border-radius:0;border-top-right-radius:inherit;border-bottom-right-radius:inherit;box-shadow:1px 0 0 0 transparent inset}.ui.labeled.icon.button>.icon:after,.ui.labeled.icon.button>.icon:before,.ui.labeled.icon.buttons>.button>.icon:after,.ui.labeled.icon.buttons>.button>.icon:before{display:block;position:absolute;width:100%;top:50%;text-align:center;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%)}.ui.labeled.icon.buttons .button>.icon{border-radius:0}.ui.labeled.icon.buttons .button:first-child>.icon{border-top-left-radius:.28571429rem;border-bottom-left-radius:.28571429rem}.ui.labeled.icon.buttons .button:last-child>.icon{border-top-right-radius:.28571429rem;border-bottom-right-radius:.28571429rem}.ui.vertical.labeled.icon.buttons .button:first-child>.icon{border-radius:.28571429rem 0 0}.ui.vertical.labeled.icon.buttons .button:last-child>.icon{border-radius:0 0 0 .28571429rem}.ui.fluid[class*="left labeled"].icon.button,.ui.fluid[class*="right labeled"].icon.button{padding-left:1.5em!important;padding-right:1.5em!important}.ui.button.toggle.active,.ui.buttons .button.toggle.active,.ui.toggle.buttons .active.button{background-color:#21ba45!important;box-shadow:none!important;text-shadow:none;color:#fff!important}.ui.button.toggle.active:hover{background-color:#16ab39!important;text-shadow:none;color:#fff!important}.ui.circular.button{border-radius:10em}.ui.circular.button>.icon{width:1em;vertical-align:baseline}.ui.buttons .or{position:relative;width:.3em;height:2.57142857em;z-index:3}.ui.buttons .or:before{position:absolute;text-align:center;border-radius:500rem;content:'or';top:50%;left:50%;background-color:#fff;text-shadow:none;margin-top:-.89285714em;margin-left:-.89285714em;width:1.78571429em;height:1.78571429em;line-height:1.78571429em;color:rgba(0,0,0,.4);font-style:normal;font-weight:700;box-shadow:0 0 0 1px transparent inset}.ui.buttons .or[data-text]:before{content:attr(data-text)}.ui.fluid.buttons .or{width:0!important}.ui.fluid.buttons .or:after{display:none}.ui.attached.button{position:relative;display:block;margin:0;border-radius:0;box-shadow:0 0 0 1px rgba(34,36,38,.15)!important}.ui.attached.top.button{border-radius:.28571429rem .28571429rem 0 0}.ui.attached.bottom.button{border-radius:0 0 .28571429rem .28571429rem}.ui.left.attached.button{display:inline-block;border-left:none;text-align:right;padding-right:.75em;border-radius:.28571429rem 0 0 .28571429rem}.ui.right.attached.button{display:inline-block;text-align:left;padding-left:.75em;border-radius:0 .28571429rem .28571429rem 0}.ui.attached.buttons{position:relative;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;border-radius:0;width:auto!important;z-index:2;margin-left:-1px;margin-right:-1px}.ui.attached.buttons .button{margin:0}.ui.attached.buttons .button:first-child,.ui.attached.buttons .button:last-child{border-radius:0}.ui[class*="top attached"].buttons{margin-bottom:-1px;border-radius:.28571429rem .28571429rem 0 0}.ui[class*="top attached"].buttons .button:first-child{border-radius:.28571429rem 0 0}.ui[class*="top attached"].buttons .button:last-child{border-radius:0 .28571429rem 0 0}.ui[class*="bottom attached"].buttons{margin-top:-1px;border-radius:0 0 .28571429rem .28571429rem}.ui[class*="bottom attached"].buttons .button:first-child{border-radius:0 0 0 .28571429rem}.ui[class*="bottom attached"].buttons .button:last-child{border-radius:0 0 .28571429rem}.ui[class*="left attached"].buttons{display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;margin-right:0;margin-left:-1px;border-radius:0 .28571429rem .28571429rem 0}.ui[class*="left attached"].buttons .button:first-child{margin-left:-1px;border-radius:0 .28571429rem 0 0}.ui[class*="left attached"].buttons .button:last-child{margin-left:-1px;border-radius:0 0 .28571429rem}.ui[class*="right attached"].buttons{display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;margin-left:0;margin-right:-1px;border-radius:.28571429rem 0 0 .28571429rem}.ui[class*="right attached"].buttons .button:first-child{margin-left:-1px;border-radius:.28571429rem 0 0}.ui[class*="right attached"].buttons .button:last-child{margin-left:-1px;border-radius:0 0 0 .28571429rem}.ui.fluid.button,.ui.fluid.buttons{width:100%}.ui.fluid.button{display:block}.ui.two.buttons{width:100%}.ui.two.buttons>.button{width:50%}.ui.three.buttons{width:100%}.ui.three.buttons>.button{width:33.333%}.ui.four.buttons{width:100%}.ui.four.buttons>.button{width:25%}.ui.five.buttons{width:100%}.ui.five.buttons>.button{width:20%}.ui.six.buttons{width:100%}.ui.six.buttons>.button{width:16.666%}.ui.seven.buttons{width:100%}.ui.seven.buttons>.button{width:14.285%}.ui.eight.buttons{width:100%}.ui.eight.buttons>.button{width:12.5%}.ui.nine.buttons{width:100%}.ui.nine.buttons>.button{width:11.11%}.ui.ten.buttons{width:100%}.ui.ten.buttons>.button{width:10%}.ui.eleven.buttons{width:100%}.ui.eleven.buttons>.button{width:9.09%}.ui.twelve.buttons{width:100%}.ui.twelve.buttons>.button{width:8.3333%}.ui.fluid.vertical.buttons,.ui.fluid.vertical.buttons>.button{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;width:auto}.ui.two.vertical.buttons>.button{height:50%}.ui.three.vertical.buttons>.button{height:33.333%}.ui.four.vertical.buttons>.button{height:25%}.ui.five.vertical.buttons>.button{height:20%}.ui.six.vertical.buttons>.button{height:16.666%}.ui.seven.vertical.buttons>.button{height:14.285%}.ui.eight.vertical.buttons>.button{height:12.5%}.ui.nine.vertical.buttons>.button{height:11.11%}.ui.ten.vertical.buttons>.button{height:10%}.ui.eleven.vertical.buttons>.button{height:9.09%}.ui.twelve.vertical.buttons>.button{height:8.3333%}.ui.black.button,.ui.black.buttons .button{background-color:#1b1c1d;color:#fff;text-shadow:none;background-image:none}.ui.black.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.black.button:hover,.ui.black.buttons .button:hover{background-color:#27292a;color:#fff;text-shadow:none}.ui.black.button:focus,.ui.black.buttons .button:focus{background-color:#2f3032;color:#fff;text-shadow:none}.ui.black.button:active,.ui.black.buttons .button:active{background-color:#343637;color:#fff;text-shadow:none}.ui.black.active.button,.ui.black.button .active.button:active,.ui.black.buttons .active.button,.ui.black.buttons .active.button:active{background-color:#0f0f10;color:#fff;text-shadow:none}.ui.basic.black.button,.ui.basic.black.buttons .button{box-shadow:0 0 0 1px #1b1c1d inset!important;color:#1b1c1d!important}.ui.basic.black.button:hover,.ui.basic.black.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #27292a inset!important;color:#27292a!important}.ui.basic.black.button:focus,.ui.basic.black.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #2f3032 inset!important;color:#27292a!important}.ui.basic.black.active.button,.ui.basic.black.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #0f0f10 inset!important;color:#343637!important}.ui.basic.black.button:active,.ui.basic.black.buttons .button:active{box-shadow:0 0 0 1px #343637 inset!important;color:#343637!important}.ui.buttons:not(.vertical)>.basic.black.button:not(:first-child){margin-left:-1px}.ui.inverted.black.button,.ui.inverted.black.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #d4d4d5 inset!important;color:#fff}.ui.inverted.black.button.active,.ui.inverted.black.button:active,.ui.inverted.black.button:focus,.ui.inverted.black.button:hover,.ui.inverted.black.buttons .button.active,.ui.inverted.black.buttons .button:active,.ui.inverted.black.buttons .button:focus,.ui.inverted.black.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.black.active.button,.ui.inverted.black.button:active,.ui.inverted.black.button:focus,.ui.inverted.black.button:hover,.ui.inverted.black.buttons .active.button,.ui.inverted.black.buttons .button:active,.ui.inverted.black.buttons .button:focus,.ui.inverted.black.buttons .button:hover{background-color:#000}.ui.inverted.black.basic.button,.ui.inverted.black.basic.buttons .button,.ui.inverted.black.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.black.basic.button:hover,.ui.inverted.black.basic.buttons .button:hover,.ui.inverted.black.buttons .basic.button:hover{box-shadow:0 0 0 2px #000 inset!important;color:#fff!important}.ui.inverted.black.basic.button:focus,.ui.inverted.black.basic.buttons .button:focus{box-shadow:0 0 0 2px #000 inset!important;color:#545454!important}.ui.inverted.black.basic.active.button,.ui.inverted.black.basic.button:active,.ui.inverted.black.basic.buttons .active.button,.ui.inverted.black.basic.buttons .button:active,.ui.inverted.black.buttons .basic.active.button,.ui.inverted.black.buttons .basic.button:active{box-shadow:0 0 0 2px #000 inset!important;color:#fff!important}.ui.grey.button,.ui.grey.buttons .button{background-color:#767676;color:#fff;text-shadow:none;background-image:none}.ui.grey.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.grey.button:hover,.ui.grey.buttons .button:hover{background-color:#838383;color:#fff;text-shadow:none}.ui.grey.button:focus,.ui.grey.buttons .button:focus{background-color:#8a8a8a;color:#fff;text-shadow:none}.ui.grey.button:active,.ui.grey.buttons .button:active{background-color:#909090;color:#fff;text-shadow:none}.ui.grey.active.button,.ui.grey.button .active.button:active,.ui.grey.buttons .active.button,.ui.grey.buttons .active.button:active{background-color:#696969;color:#fff;text-shadow:none}.ui.basic.grey.button,.ui.basic.grey.buttons .button{box-shadow:0 0 0 1px #767676 inset!important;color:#767676!important}.ui.basic.grey.button:hover,.ui.basic.grey.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #838383 inset!important;color:#838383!important}.ui.basic.grey.button:focus,.ui.basic.grey.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #8a8a8a inset!important;color:#838383!important}.ui.basic.grey.active.button,.ui.basic.grey.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #696969 inset!important;color:#909090!important}.ui.basic.grey.button:active,.ui.basic.grey.buttons .button:active{box-shadow:0 0 0 1px #909090 inset!important;color:#909090!important}.ui.buttons:not(.vertical)>.basic.grey.button:not(:first-child){margin-left:-1px}.ui.inverted.grey.button,.ui.inverted.grey.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #d4d4d5 inset!important;color:#fff}.ui.inverted.grey.button.active,.ui.inverted.grey.button:active,.ui.inverted.grey.button:focus,.ui.inverted.grey.button:hover,.ui.inverted.grey.buttons .button.active,.ui.inverted.grey.buttons .button:active,.ui.inverted.grey.buttons .button:focus,.ui.inverted.grey.buttons .button:hover{box-shadow:none!important;color:rgba(0,0,0,.6)}.ui.inverted.grey.button:hover,.ui.inverted.grey.buttons .button:hover{background-color:#cfd0d2}.ui.inverted.grey.button:focus,.ui.inverted.grey.buttons .button:focus{background-color:#c7c9cb}.ui.inverted.grey.active.button,.ui.inverted.grey.buttons .active.button{background-color:#cfd0d2}.ui.inverted.grey.button:active,.ui.inverted.grey.buttons .button:active{background-color:#c2c4c5}.ui.inverted.grey.basic.button,.ui.inverted.grey.basic.buttons .button,.ui.inverted.grey.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.grey.basic.button:hover,.ui.inverted.grey.basic.buttons .button:hover,.ui.inverted.grey.buttons .basic.button:hover{box-shadow:0 0 0 2px #cfd0d2 inset!important;color:#fff!important}.ui.inverted.grey.basic.button:focus,.ui.inverted.grey.basic.buttons .button:focus{box-shadow:0 0 0 2px #c7c9cb inset!important;color:#dcddde!important}.ui.inverted.grey.basic.active.button,.ui.inverted.grey.basic.buttons .active.button,.ui.inverted.grey.buttons .basic.active.button{box-shadow:0 0 0 2px #cfd0d2 inset!important;color:#fff!important}.ui.inverted.grey.basic.button:active,.ui.inverted.grey.basic.buttons .button:active,.ui.inverted.grey.buttons .basic.button:active{box-shadow:0 0 0 2px #c2c4c5 inset!important;color:#fff!important}.ui.brown.button,.ui.brown.buttons .button{background-color:#a5673f;color:#fff;text-shadow:none;background-image:none}.ui.brown.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.brown.button:hover,.ui.brown.buttons .button:hover{background-color:#975b33;color:#fff;text-shadow:none}.ui.brown.button:focus,.ui.brown.buttons .button:focus{background-color:#90532b;color:#fff;text-shadow:none}.ui.brown.button:active,.ui.brown.buttons .button:active{background-color:#805031;color:#fff;text-shadow:none}.ui.brown.active.button,.ui.brown.button .active.button:active,.ui.brown.buttons .active.button,.ui.brown.buttons .active.button:active{background-color:#995a31;color:#fff;text-shadow:none}.ui.basic.brown.button,.ui.basic.brown.buttons .button{box-shadow:0 0 0 1px #a5673f inset!important;color:#a5673f!important}.ui.basic.brown.button:hover,.ui.basic.brown.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #975b33 inset!important;color:#975b33!important}.ui.basic.brown.button:focus,.ui.basic.brown.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #90532b inset!important;color:#975b33!important}.ui.basic.brown.active.button,.ui.basic.brown.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #995a31 inset!important;color:#805031!important}.ui.basic.brown.button:active,.ui.basic.brown.buttons .button:active{box-shadow:0 0 0 1px #805031 inset!important;color:#805031!important}.ui.buttons:not(.vertical)>.basic.brown.button:not(:first-child){margin-left:-1px}.ui.inverted.brown.button,.ui.inverted.brown.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #d67c1c inset!important;color:#d67c1c}.ui.inverted.brown.button.active,.ui.inverted.brown.button:active,.ui.inverted.brown.button:focus,.ui.inverted.brown.button:hover,.ui.inverted.brown.buttons .button.active,.ui.inverted.brown.buttons .button:active,.ui.inverted.brown.buttons .button:focus,.ui.inverted.brown.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.brown.button:hover,.ui.inverted.brown.buttons .button:hover{background-color:#c86f11}.ui.inverted.brown.button:focus,.ui.inverted.brown.buttons .button:focus{background-color:#c16808}.ui.inverted.brown.active.button,.ui.inverted.brown.buttons .active.button{background-color:#cc6f0d}.ui.inverted.brown.button:active,.ui.inverted.brown.buttons .button:active{background-color:#a96216}.ui.inverted.brown.basic.button,.ui.inverted.brown.basic.buttons .button,.ui.inverted.brown.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.brown.basic.button:hover,.ui.inverted.brown.basic.buttons .button:hover,.ui.inverted.brown.buttons .basic.button:hover{box-shadow:0 0 0 2px #c86f11 inset!important;color:#d67c1c!important}.ui.inverted.brown.basic.button:focus,.ui.inverted.brown.basic.buttons .button:focus{box-shadow:0 0 0 2px #c16808 inset!important;color:#d67c1c!important}.ui.inverted.brown.basic.active.button,.ui.inverted.brown.basic.buttons .active.button,.ui.inverted.brown.buttons .basic.active.button{box-shadow:0 0 0 2px #cc6f0d inset!important;color:#d67c1c!important}.ui.inverted.brown.basic.button:active,.ui.inverted.brown.basic.buttons .button:active,.ui.inverted.brown.buttons .basic.button:active{box-shadow:0 0 0 2px #a96216 inset!important;color:#d67c1c!important}.ui.blue.button,.ui.blue.buttons .button{background-color:#2185d0;color:#fff;text-shadow:none;background-image:none}.ui.blue.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.blue.button:hover,.ui.blue.buttons .button:hover{background-color:#1678c2;color:#fff;text-shadow:none}.ui.blue.button:focus,.ui.blue.buttons .button:focus{background-color:#0d71bb;color:#fff;text-shadow:none}.ui.blue.button:active,.ui.blue.buttons .button:active{background-color:#1a69a4;color:#fff;text-shadow:none}.ui.blue.active.button,.ui.blue.button .active.button:active,.ui.blue.buttons .active.button,.ui.blue.buttons .active.button:active{background-color:#1279c6;color:#fff;text-shadow:none}.ui.basic.blue.button,.ui.basic.blue.buttons .button{box-shadow:0 0 0 1px #2185d0 inset!important;color:#2185d0!important}.ui.basic.blue.button:hover,.ui.basic.blue.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #1678c2 inset!important;color:#1678c2!important}.ui.basic.blue.button:focus,.ui.basic.blue.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #0d71bb inset!important;color:#1678c2!important}.ui.basic.blue.active.button,.ui.basic.blue.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #1279c6 inset!important;color:#1a69a4!important}.ui.basic.blue.button:active,.ui.basic.blue.buttons .button:active{box-shadow:0 0 0 1px #1a69a4 inset!important;color:#1a69a4!important}.ui.buttons:not(.vertical)>.basic.blue.button:not(:first-child){margin-left:-1px}.ui.inverted.blue.button,.ui.inverted.blue.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #54c8ff inset!important;color:#54c8ff}.ui.inverted.blue.button.active,.ui.inverted.blue.button:active,.ui.inverted.blue.button:focus,.ui.inverted.blue.button:hover,.ui.inverted.blue.buttons .button.active,.ui.inverted.blue.buttons .button:active,.ui.inverted.blue.buttons .button:focus,.ui.inverted.blue.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.blue.button:hover,.ui.inverted.blue.buttons .button:hover{background-color:#3ac0ff}.ui.inverted.blue.button:focus,.ui.inverted.blue.buttons .button:focus{background-color:#2bbbff}.ui.inverted.blue.active.button,.ui.inverted.blue.buttons .active.button{background-color:#3ac0ff}.ui.inverted.blue.button:active,.ui.inverted.blue.buttons .button:active{background-color:#21b8ff}.ui.inverted.blue.basic.button,.ui.inverted.blue.basic.buttons .button,.ui.inverted.blue.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.blue.basic.button:hover,.ui.inverted.blue.basic.buttons .button:hover,.ui.inverted.blue.buttons .basic.button:hover{box-shadow:0 0 0 2px #3ac0ff inset!important;color:#54c8ff!important}.ui.inverted.blue.basic.button:focus,.ui.inverted.blue.basic.buttons .button:focus{box-shadow:0 0 0 2px #2bbbff inset!important;color:#54c8ff!important}.ui.inverted.blue.basic.active.button,.ui.inverted.blue.basic.buttons .active.button,.ui.inverted.blue.buttons .basic.active.button{box-shadow:0 0 0 2px #3ac0ff inset!important;color:#54c8ff!important}.ui.inverted.blue.basic.button:active,.ui.inverted.blue.basic.buttons .button:active,.ui.inverted.blue.buttons .basic.button:active{box-shadow:0 0 0 2px #21b8ff inset!important;color:#54c8ff!important}.ui.green.button,.ui.green.buttons .button{background-color:#21ba45;color:#fff;text-shadow:none;background-image:none}.ui.green.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.green.button:hover,.ui.green.buttons .button:hover{background-color:#16ab39;color:#fff;text-shadow:none}.ui.green.button:focus,.ui.green.buttons .button:focus{background-color:#0ea432;color:#fff;text-shadow:none}.ui.green.button:active,.ui.green.buttons .button:active{background-color:#198f35;color:#fff;text-shadow:none}.ui.green.active.button,.ui.green.button .active.button:active,.ui.green.buttons .active.button,.ui.green.buttons .active.button:active{background-color:#13ae38;color:#fff;text-shadow:none}.ui.basic.green.button,.ui.basic.green.buttons .button{box-shadow:0 0 0 1px #21ba45 inset!important;color:#21ba45!important}.ui.basic.green.button:hover,.ui.basic.green.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #16ab39 inset!important;color:#16ab39!important}.ui.basic.green.button:focus,.ui.basic.green.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #0ea432 inset!important;color:#16ab39!important}.ui.basic.green.active.button,.ui.basic.green.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #13ae38 inset!important;color:#198f35!important}.ui.basic.green.button:active,.ui.basic.green.buttons .button:active{box-shadow:0 0 0 1px #198f35 inset!important;color:#198f35!important}.ui.buttons:not(.vertical)>.basic.green.button:not(:first-child){margin-left:-1px}.ui.inverted.green.button,.ui.inverted.green.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #2ecc40 inset!important;color:#2ecc40}.ui.inverted.green.button.active,.ui.inverted.green.button:active,.ui.inverted.green.button:focus,.ui.inverted.green.button:hover,.ui.inverted.green.buttons .button.active,.ui.inverted.green.buttons .button:active,.ui.inverted.green.buttons .button:focus,.ui.inverted.green.buttons .button:hover{box-shadlightOw:none!important;color:#fff}.ui.inverted.green.button:hover,.ui.inverted.green.buttons .button:hover{background-color:#22be34}.ui.inverted.green.button:focus,.ui.inverted.green.buttons .button:focus{background-color:#19b82b}.ui.inverted.green.active.button,.ui.inverted.green.buttons .active.button{background-color:#1fc231}.ui.inverted.green.button:active,.ui.inverted.green.buttons .button:active{background-color:#25a233}.ui.inverted.green.basic.button,.ui.inverted.green.basic.buttons .button,.ui.inverted.green.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.green.basic.button:hover,.ui.inverted.green.basic.buttons .button:hover,.ui.inverted.green.buttons .basic.button:hover{box-shadow:0 0 0 2px #22be34 inset!important;color:#2ecc40!important}.ui.inverted.green.basic.button:focus,.ui.inverted.green.basic.buttons .button:focus{box-shadow:0 0 0 2px #19b82b inset!important;color:#2ecc40!important}.ui.inverted.green.basic.active.button,.ui.inverted.green.basic.buttons .active.button,.ui.inverted.green.buttons .basic.active.button{box-shadow:0 0 0 2px #1fc231 inset!important;color:#2ecc40!important}.ui.inverted.green.basic.button:active,.ui.inverted.green.basic.buttons .button:active,.ui.inverted.green.buttons .basic.button:active{box-shadow:0 0 0 2px #25a233 inset!important;color:#2ecc40!important}.ui.orange.button,.ui.orange.buttons .button{background-color:#f2711c;color:#fff;text-shadow:none;background-image:none}.ui.orange.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.orange.button:hover,.ui.orange.buttons .button:hover{background-color:#f26202;color:#fff;text-shadow:none}.ui.orange.button:focus,.ui.orange.buttons .button:focus{background-color:#e55b00;color:#fff;text-shadow:none}.ui.orange.button:active,.ui.orange.buttons .button:active{background-color:#cf590c;color:#fff;text-shadow:none}.ui.orange.active.button,.ui.orange.button .active.button:active,.ui.orange.buttons .active.button,.ui.orange.buttons .active.button:active{background-color:#f56100;color:#fff;text-shadow:none}.ui.basic.orange.button,.ui.basic.orange.buttons .button{box-shadow:0 0 0 1px #f2711c inset!important;color:#f2711c!important}.ui.basic.orange.button:hover,.ui.basic.orange.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #f26202 inset!important;color:#f26202!important}.ui.basic.orange.button:focus,.ui.basic.orange.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #e55b00 inset!important;color:#f26202!important}.ui.basic.orange.active.button,.ui.basic.orange.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #f56100 inset!important;color:#cf590c!important}.ui.basic.orange.button:active,.ui.basic.orange.buttons .button:active{box-shadow:0 0 0 1px #cf590c inset!important;color:#cf590c!important}.ui.buttons:not(.vertical)>.basic.orange.button:not(:first-child){margin-left:-1px}.ui.inverted.orange.button,.ui.inverted.orange.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #ff851b inset!important;color:#ff851b}.ui.inverted.orange.button.active,.ui.inverted.orange.button:active,.ui.inverted.orange.button:focus,.ui.inverted.orange.button:hover,.ui.inverted.orange.buttons .button.active,.ui.inverted.orange.buttons .button:active,.ui.inverted.orange.buttons .button:focus,.ui.inverted.orange.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.orange.button:hover,.ui.inverted.orange.buttons .button:hover{background-color:#ff7701}.ui.inverted.orange.button:focus,.ui.inverted.orange.buttons .button:focus{background-color:#f17000}.ui.inverted.orange.active.button,.ui.inverted.orange.buttons .active.button{background-color:#ff7701}.ui.inverted.orange.button:active,.ui.inverted.orange.buttons .button:active{background-color:#e76b00}.ui.inverted.orange.basic.button,.ui.inverted.orange.basic.buttons .button,.ui.inverted.orange.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.orange.basic.button:hover,.ui.inverted.orange.basic.buttons .button:hover,.ui.inverted.orange.buttons .basic.button:hover{box-shadow:0 0 0 2px #ff7701 inset!important;color:#ff851b!important}.ui.inverted.orange.basic.button:focus,.ui.inverted.orange.basic.buttons .button:focus{box-shadow:0 0 0 2px #f17000 inset!important;color:#ff851b!important}.ui.inverted.orange.basic.active.button,.ui.inverted.orange.basic.buttons .active.button,.ui.inverted.orange.buttons .basic.active.button{box-shadow:0 0 0 2px #ff7701 inset!important;color:#ff851b!important}.ui.inverted.orange.basic.button:active,.ui.inverted.orange.basic.buttons .button:active,.ui.inverted.orange.buttons .basic.button:active{box-shadow:0 0 0 2px #e76b00 inset!important;color:#ff851b!important}.ui.pink.button,.ui.pink.buttons .button{background-color:#e03997;color:#fff;text-shadow:none;background-image:none}.ui.pink.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.pink.button:hover,.ui.pink.buttons .button:hover{background-color:#e61a8d;color:#fff;text-shadow:none}.ui.pink.button:focus,.ui.pink.buttons .button:focus{background-color:#e10f85;color:#fff;text-shadow:none}.ui.pink.button:active,.ui.pink.buttons .button:active{background-color:#c71f7e;color:#fff;text-shadow:none}.ui.pink.active.button,.ui.pink.button .active.button:active,.ui.pink.buttons .active.button,.ui.pink.buttons .active.button:active{background-color:#ea158d;color:#fff;text-shadow:none}.ui.basic.pink.button,.ui.basic.pink.buttons .button{box-shadow:0 0 0 1px #e03997 inset!important;color:#e03997!important}.ui.basic.pink.button:hover,.ui.basic.pink.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #e61a8d inset!important;color:#e61a8d!important}.ui.basic.pink.button:focus,.ui.basic.pink.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #e10f85 inset!important;color:#e61a8d!important}.ui.basic.pink.active.button,.ui.basic.pink.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #ea158d inset!important;color:#c71f7e!important}.ui.basic.pink.button:active,.ui.basic.pink.buttons .button:active{box-shadow:0 0 0 1px #c71f7e inset!important;color:#c71f7e!important}.ui.buttons:not(.vertical)>.basic.pink.button:not(:first-child){margin-left:-1px}.ui.inverted.pink.button,.ui.inverted.pink.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #ff8edf inset!important;color:#ff8edf}.ui.inverted.pink.button.active,.ui.inverted.pink.button:active,.ui.inverted.pink.button:focus,.ui.inverted.pink.button:hover,.ui.inverted.pink.buttons .button.active,.ui.inverted.pink.buttons .button:active,.ui.inverted.pink.buttons .button:focus,.ui.inverted.pink.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.pink.button:hover,.ui.inverted.pink.buttons .button:hover{background-color:#ff74d8}.ui.inverted.pink.button:focus,.ui.inverted.pink.buttons .button:focus{background-color:#ff65d3}.ui.inverted.pink.active.button,.ui.inverted.pink.buttons .active.button{background-color:#ff74d8}.ui.inverted.pink.button:active,.ui.inverted.pink.buttons .button:active{background-color:#ff5bd1}.ui.inverted.pink.basic.button,.ui.inverted.pink.basic.buttons .button,.ui.inverted.pink.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.pink.basic.button:hover,.ui.inverted.pink.basic.buttons .button:hover,.ui.inverted.pink.buttons .basic.button:hover{box-shadow:0 0 0 2px #ff74d8 inset!important;color:#ff8edf!important}.ui.inverted.pink.basic.button:focus,.ui.inverted.pink.basic.buttons .button:focus{box-shadow:0 0 0 2px #ff65d3 inset!important;color:#ff8edf!important}.ui.inverted.pink.basic.active.button,.ui.inverted.pink.basic.buttons .active.button,.ui.inverted.pink.buttons .basic.active.button{box-shadow:0 0 0 2px #ff74d8 inset!important;color:#ff8edf!important}.ui.inverted.pink.basic.button:active,.ui.inverted.pink.basic.buttons .button:active,.ui.inverted.pink.buttons .basic.button:active{box-shadow:0 0 0 2px #ff5bd1 inset!important;color:#ff8edf!important}.ui.violet.button,.ui.violet.buttons .button{background-color:#6435c9;color:#fff;text-shadow:none;background-image:none}.ui.violet.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.violet.button:hover,.ui.violet.buttons .button:hover{background-color:#5829bb;color:#fff;text-shadow:none}.ui.violet.button:focus,.ui.violet.buttons .button:focus{background-color:#4f20b5;color:#fff;text-shadow:none}.ui.violet.button:active,.ui.violet.buttons .button:active{background-color:#502aa1;color:#fff;text-shadow:none}.ui.violet.active.button,.ui.violet.button .active.button:active,.ui.violet.buttons .active.button,.ui.violet.buttons .active.button:active{background-color:#5626bf;color:#fff;text-shadow:none}.ui.basic.violet.button,.ui.basic.violet.buttons .button{box-shadow:0 0 0 1px #6435c9 inset!important;color:#6435c9!important}.ui.basic.violet.button:hover,.ui.basic.violet.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #5829bb inset!important;color:#5829bb!important}.ui.basic.violet.button:focus,.ui.basic.violet.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #4f20b5 inset!important;color:#5829bb!important}.ui.basic.violet.active.button,.ui.basic.violet.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #5626bf inset!important;color:#502aa1!important}.ui.basic.violet.button:active,.ui.basic.violet.buttons .button:active{box-shadow:0 0 0 1px #502aa1 inset!important;color:#502aa1!important}.ui.buttons:not(.vertical)>.basic.violet.button:not(:first-child){margin-left:-1px}.ui.inverted.violet.button,.ui.inverted.violet.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #a291fb inset!important;color:#a291fb}.ui.inverted.violet.button.active,.ui.inverted.violet.button:active,.ui.inverted.violet.button:focus,.ui.inverted.violet.button:hover,.ui.inverted.violet.buttons .button.active,.ui.inverted.violet.buttons .button:active,.ui.inverted.violet.buttons .button:focus,.ui.inverted.violet.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.violet.button:hover,.ui.inverted.violet.buttons .button:hover{background-color:#8a73ff}.ui.inverted.violet.button:focus,.ui.inverted.violet.buttons .button:focus{background-color:#7d64ff}.ui.inverted.violet.active.button,.ui.inverted.violet.buttons .active.button{background-color:#8a73ff}.ui.inverted.violet.button:active,.ui.inverted.violet.buttons .button:active{background-color:#7860f9}.ui.inverted.violet.basic.button,.ui.inverted.violet.basic.buttons .button,.ui.inverted.violet.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.violet.basic.button:hover,.ui.inverted.violet.basic.buttons .button:hover,.ui.inverted.violet.buttons .basic.button:hover{box-shadow:0 0 0 2px #8a73ff inset!important;color:#a291fb!important}.ui.inverted.violet.basic.button:focus,.ui.inverted.violet.basic.buttons .button:focus{box-shadow:0 0 0 2px #7d64ff inset!important;color:#a291fb!important}.ui.inverted.violet.basic.active.button,.ui.inverted.violet.basic.buttons .active.button,.ui.inverted.violet.buttons .basic.active.button{box-shadow:0 0 0 2px #8a73ff inset!important;color:#a291fb!important}.ui.inverted.violet.basic.button:active,.ui.inverted.violet.basic.buttons .button:active,.ui.inverted.violet.buttons .basic.button:active{box-shadow:0 0 0 2px #7860f9 inset!important;color:#a291fb!important}.ui.purple.button,.ui.purple.buttons .button{background-color:#a333c8;color:#fff;text-shadow:none;background-image:none}.ui.purple.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.purple.button:hover,.ui.purple.buttons .button:hover{background-color:#9627ba;color:#fff;text-shadow:none}.ui.purple.button:focus,.ui.purple.buttons .button:focus{background-color:#8f1eb4;color:#fff;text-shadow:none}.ui.purple.button:active,.ui.purple.buttons .button:active{background-color:#82299f;color:#fff;text-shadow:none}.ui.purple.active.button,.ui.purple.button .active.button:active,.ui.purple.buttons .active.button,.ui.purple.buttons .active.button:active{background-color:#9724be;color:#fff;text-shadow:none}.ui.basic.purple.button,.ui.basic.purple.buttons .button{box-shadow:0 0 0 1px #a333c8 inset!important;color:#a333c8!important}.ui.basic.purple.button:hover,.ui.basic.purple.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #9627ba inset!important;color:#9627ba!important}.ui.basic.purple.button:focus,.ui.basic.purple.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #8f1eb4 inset!important;color:#9627ba!important}.ui.basic.purple.active.button,.ui.basic.purple.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #9724be inset!important;color:#82299f!important}.ui.basic.purple.button:active,.ui.basic.purple.buttons .button:active{box-shadow:0 0 0 1px #82299f inset!important;color:#82299f!important}.ui.buttons:not(.vertical)>.basic.purple.button:not(:first-child){margin-left:-1px}.ui.inverted.purple.button,.ui.inverted.purple.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #dc73ff inset!important;color:#dc73ff}.ui.inverted.purple.button.active,.ui.inverted.purple.button:active,.ui.inverted.purple.button:focus,.ui.inverted.purple.button:hover,.ui.inverted.purple.buttons .button.active,.ui.inverted.purple.buttons .button:active,.ui.inverted.purple.buttons .button:focus,.ui.inverted.purple.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.purple.button:hover,.ui.inverted.purple.buttons .button:hover{background-color:#d65aff}.ui.inverted.purple.button:focus,.ui.inverted.purple.buttons .button:focus{background-color:#d24aff}.ui.inverted.purple.active.button,.ui.inverted.purple.buttons .active.button{background-color:#d65aff}.ui.inverted.purple.button:active,.ui.inverted.purple.buttons .button:active{background-color:#cf40ff}.ui.inverted.purple.basic.button,.ui.inverted.purple.basic.buttons .button,.ui.inverted.purple.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.purple.basic.button:hover,.ui.inverted.purple.basic.buttons .button:hover,.ui.inverted.purple.buttons .basic.button:hover{box-shadow:0 0 0 2px #d65aff inset!important;color:#dc73ff!important}.ui.inverted.purple.basic.button:focus,.ui.inverted.purple.basic.buttons .button:focus{box-shadow:0 0 0 2px #d24aff inset!important;color:#dc73ff!important}.ui.inverted.purple.basic.active.button,.ui.inverted.purple.basic.buttons .active.button,.ui.inverted.purple.buttons .basic.active.button{box-shadow:0 0 0 2px #d65aff inset!important;color:#dc73ff!important}.ui.inverted.purple.basic.button:active,.ui.inverted.purple.basic.buttons .button:active,.ui.inverted.purple.buttons .basic.button:active{box-shadow:0 0 0 2px #cf40ff inset!important;color:#dc73ff!important}.ui.red.button,.ui.red.buttons .button{background-color:#db2828;color:#fff;text-shadow:none;background-image:none}.ui.red.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.red.button:hover,.ui.red.buttons .button:hover{background-color:#d01919;color:#fff;text-shadow:none}.ui.red.button:focus,.ui.red.buttons .button:focus{background-color:#ca1010;color:#fff;text-shadow:none}.ui.red.button:active,.ui.red.buttons .button:active{background-color:#b21e1e;color:#fff;text-shadow:none}.ui.red.active.button,.ui.red.button .active.button:active,.ui.red.buttons .active.button,.ui.red.buttons .active.button:active{background-color:#d41515;color:#fff;text-shadow:none}.ui.basic.red.button,.ui.basic.red.buttons .button{box-shadow:0 0 0 1px #db2828 inset!important;color:#db2828!important}.ui.basic.red.button:hover,.ui.basic.red.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #d01919 inset!important;color:#d01919!important}.ui.basic.red.button:focus,.ui.basic.red.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #ca1010 inset!important;color:#d01919!important}.ui.basic.red.active.button,.ui.basic.red.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #d41515 inset!important;color:#b21e1e!important}.ui.basic.red.button:active,.ui.basic.red.buttons .button:active{box-shadow:0 0 0 1px #b21e1e inset!important;color:#b21e1e!important}.ui.buttons:not(.vertical)>.basic.red.button:not(:first-child){margin-left:-1px}.ui.inverted.red.button,.ui.inverted.red.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #ff695e inset!important;color:#ff695e}.ui.inverted.red.button.active,.ui.inverted.red.button:active,.ui.inverted.red.button:focus,.ui.inverted.red.button:hover,.ui.inverted.red.buttons .button.active,.ui.inverted.red.buttons .button:active,.ui.inverted.red.buttons .button:focus,.ui.inverted.red.buttons .button:hover{box-shadow:none!important;color:#fff}.ui.inverted.red.button:hover,.ui.inverted.red.buttons .button:hover{background-color:#ff5144}.ui.inverted.red.button:focus,.ui.inverted.red.buttons .button:focus{background-color:#ff4335}.ui.inverted.red.active.button,.ui.inverted.red.buttons .active.button{background-color:#ff5144}.ui.inverted.red.button:active,.ui.inverted.red.buttons .button:active{background-color:#ff392b}.ui.inverted.red.basic.button,.ui.inverted.red.basic.buttons .button,.ui.inverted.red.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.red.basic.button:hover,.ui.inverted.red.basic.buttons .button:hover,.ui.inverted.red.buttons .basic.button:hover{box-shadow:0 0 0 2px #ff5144 inset!important;color:#ff695e!important}.ui.inverted.red.basic.button:focus,.ui.inverted.red.basic.buttons .button:focus{box-shadow:0 0 0 2px #ff4335 inset!important;color:#ff695e!important}.ui.inverted.red.basic.active.button,.ui.inverted.red.basic.buttons .active.button,.ui.inverted.red.buttons .basic.active.button{box-shadow:0 0 0 2px #ff5144 inset!important;color:#ff695e!important}.ui.inverted.red.basic.button:active,.ui.inverted.red.basic.buttons .button:active,.ui.inverted.red.buttons .basic.button:active{box-shadow:0 0 0 2px #ff392b inset!important;color:#ff695e!important}.ui.teal.button,.ui.teal.buttons .button{background-color:#00b5ad;color:#fff;text-shadow:none;background-image:none}.ui.teal.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.teal.button:hover,.ui.teal.buttons .button:hover{background-color:#009c95;color:#fff;text-shadow:none}.ui.teal.button:focus,.ui.teal.buttons .button:focus{background-color:#008c86;color:#fff;text-shadow:none}.ui.teal.button:active,.ui.teal.buttons .button:active{background-color:#00827c;color:#fff;text-shadow:none}.ui.teal.active.button,.ui.teal.button .active.button:active,.ui.teal.buttons .active.button,.ui.teal.buttons .active.button:active{background-color:#009c95;color:#fff;text-shadow:none}.ui.basic.teal.button,.ui.basic.teal.buttons .button{box-shadow:0 0 0 1px #00b5ad inset!important;color:#00b5ad!important}.ui.basic.teal.button:hover,.ui.basic.teal.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #009c95 inset!important;color:#009c95!important}.ui.basic.teal.button:focus,.ui.basic.teal.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #008c86 inset!important;color:#009c95!important}.ui.basic.teal.active.button,.ui.basic.teal.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #009c95 inset!important;color:#00827c!important}.ui.basic.teal.button:active,.ui.basic.teal.buttons .button:active{box-shadow:0 0 0 1px #00827c inset!important;color:#00827c!important}.ui.buttons:not(.vertical)>.basic.teal.button:not(:first-child){margin-left:-1px}.ui.inverted.teal.button,.ui.inverted.teal.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #6dffff inset!important;color:#6dffff}.ui.inverted.teal.button.active,.ui.inverted.teal.button:active,.ui.inverted.teal.button:focus,.ui.inverted.teal.button:hover,.ui.inverted.teal.buttons .button.active,.ui.inverted.teal.buttons .button:active,.ui.inverted.teal.buttons .button:focus,.ui.inverted.teal.buttons .button:hover{box-shadow:none!important;color:rgba(0,0,0,.6)}.ui.inverted.teal.button:hover,.ui.inverted.teal.buttons .button:hover{background-color:#54ffff}.ui.inverted.teal.button:focus,.ui.inverted.teal.buttons .button:focus{background-color:#4ff}.ui.inverted.teal.active.button,.ui.inverted.teal.buttons .active.button{background-color:#54ffff}.ui.inverted.teal.button:active,.ui.inverted.teal.buttons .button:active{background-color:#3affff}.ui.inverted.teal.basic.button,.ui.inverted.teal.basic.buttons .button,.ui.inverted.teal.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.teal.basic.button:hover,.ui.inverted.teal.basic.buttons .button:hover,.ui.inverted.teal.buttons .basic.button:hover{box-shadow:0 0 0 2px #54ffff inset!important;color:#6dffff!important}.ui.inverted.teal.basic.button:focus,.ui.inverted.teal.basic.buttons .button:focus{box-shadow:0 0 0 2px #4ff inset!important;color:#6dffff!important}.ui.inverted.teal.basic.active.button,.ui.inverted.teal.basic.buttons .active.button,.ui.inverted.teal.buttons .basic.active.button{box-shadow:0 0 0 2px #54ffff inset!important;color:#6dffff!important}.ui.inverted.teal.basic.button:active,.ui.inverted.teal.basic.buttons .button:active,.ui.inverted.teal.buttons .basic.button:active{box-shadow:0 0 0 2px #3affff inset!important;color:#6dffff!important}.ui.olive.button,.ui.olive.buttons .button{background-color:#b5cc18;color:#fff;text-shadow:none;background-image:none}.ui.olive.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.olive.button:hover,.ui.olive.buttons .button:hover{background-color:#a7bd0d;color:#fff;text-shadow:none}.ui.olive.button:focus,.ui.olive.buttons .button:focus{background-color:#a0b605;color:#fff;text-shadow:none}.ui.olive.button:active,.ui.olive.buttons .button:active{background-color:#8d9e13;color:#fff;text-shadow:none}.ui.olive.active.button,.ui.olive.button .active.button:active,.ui.olive.buttons .active.button,.ui.olive.buttons .active.button:active{background-color:#aac109;color:#fff;text-shadow:none}.ui.basic.olive.button,.ui.basic.olive.buttons .button{box-shadow:0 0 0 1px #b5cc18 inset!important;color:#b5cc18!important}.ui.basic.olive.button:hover,.ui.basic.olive.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #a7bd0d inset!important;color:#a7bd0d!important}.ui.basic.olive.button:focus,.ui.basic.olive.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #a0b605 inset!important;color:#a7bd0d!important}.ui.basic.olive.active.button,.ui.basic.olive.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #aac109 inset!important;color:#8d9e13!important}.ui.basic.olive.button:active,.ui.basic.olive.buttons .button:active{box-shadow:0 0 0 1px #8d9e13 inset!important;color:#8d9e13!important}.ui.buttons:not(.vertical)>.basic.olive.button:not(:first-child){margin-left:-1px}.ui.inverted.olive.button,.ui.inverted.olive.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #d9e778 inset!important;color:#d9e778}.ui.inverted.olive.button.active,.ui.inverted.olive.button:active,.ui.inverted.olive.button:focus,.ui.inverted.olive.button:hover,.ui.inverted.olive.buttons .button.active,.ui.inverted.olive.buttons .button:active,.ui.inverted.olive.buttons .button:focus,.ui.inverted.olive.buttons .button:hover{box-shadow:none!important;color:rgba(0,0,0,.6)}.ui.inverted.olive.button:hover,.ui.inverted.olive.buttons .button:hover{background-color:#d8ea5c}.ui.inverted.olive.button:focus,.ui.inverted.olive.buttons .button:focus{background-color:#daef47}.ui.inverted.olive.active.button,.ui.inverted.olive.buttons .active.button{background-color:#daed59}.ui.inverted.olive.button:active,.ui.inverted.olive.buttons .button:active{background-color:#cddf4d}.ui.inverted.olive.basic.button,.ui.inverted.olive.basic.buttons .button,.ui.inverted.olive.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.olive.basic.button:hover,.ui.inverted.olive.basic.buttons .button:hover,.ui.inverted.olive.buttons .basic.button:hover{box-shadow:0 0 0 2px #d8ea5c inset!important;color:#d9e778!important}.ui.inverted.olive.basic.button:focus,.ui.inverted.olive.basic.buttons .button:focus{box-shadow:0 0 0 2px #daef47 inset!important;color:#d9e778!important}.ui.inverted.olive.basic.active.button,.ui.inverted.olive.basic.buttons .active.button,.ui.inverted.olive.buttons .basic.active.button{box-shadow:0 0 0 2px #daed59 inset!important;color:#d9e778!important}.ui.inverted.olive.basic.button:active,.ui.inverted.olive.basic.buttons .button:active,.ui.inverted.olive.buttons .basic.button:active{box-shadow:0 0 0 2px #cddf4d inset!important;color:#d9e778!important}.ui.yellow.button,.ui.yellow.buttons .button{background-color:#fbbd08;color:#fff;text-shadow:none;background-image:none}.ui.yellow.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.yellow.button:hover,.ui.yellow.buttons .button:hover{background-color:#eaae00;color:#fff;text-shadow:none}.ui.yellow.button:focus,.ui.yellow.buttons .button:focus{background-color:#daa300;color:#fff;text-shadow:none}.ui.yellow.button:active,.ui.yellow.buttons .button:active{background-color:#cd9903;color:#fff;text-shadow:none}.ui.yellow.active.button,.ui.yellow.button .active.button:active,.ui.yellow.buttons .active.button,.ui.yellow.buttons .active.button:active{background-color:#eaae00;color:#fff;text-shadow:none}.ui.basic.yellow.button,.ui.basic.yellow.buttons .button{box-shadow:0 0 0 1px #fbbd08 inset!important;color:#fbbd08!important}.ui.basic.yellow.button:hover,.ui.basic.yellow.buttons .button:hover{background:0 0!important;box-shadow:0 0 0 1px #eaae00 inset!important;color:#eaae00!important}.ui.basic.yellow.button:focus,.ui.basic.yellow.buttons .button:focus{background:0 0!important;box-shadow:0 0 0 1px #daa300 inset!important;color:#eaae00!important}.ui.basic.yellow.active.button,.ui.basic.yellow.buttons .active.button{background:0 0!important;box-shadow:0 0 0 1px #eaae00 inset!important;color:#cd9903!important}.ui.basic.yellow.button:active,.ui.basic.yellow.buttons .button:active{box-shadow:0 0 0 1px #cd9903 inset!important;color:#cd9903!important}.ui.buttons:not(.vertical)>.basic.yellow.button:not(:first-child){margin-left:-1px}.ui.inverted.yellow.button,.ui.inverted.yellow.buttons .button{background-color:transparent;box-shadow:0 0 0 2px #ffe21f inset!important;color:#ffe21f}.ui.inverted.yellow.button.active,.ui.inverted.yellow.button:active,.ui.inverted.yellow.button:focus,.ui.inverted.yellow.button:hover,.ui.inverted.yellow.buttons .button.active,.ui.inverted.yellow.buttons .button:active,.ui.inverted.yellow.buttons .button:focus,.ui.inverted.yellow.buttons .button:hover{box-shadow:none!important;color:rgba(0,0,0,.6)}.ui.inverted.yellow.button:hover,.ui.inverted.yellow.buttons .button:hover{background-color:#ffdf05}.ui.inverted.yellow.button:focus,.ui.inverted.yellow.buttons .button:focus{background-color:#f5d500}.ui.inverted.yellow.active.button,.ui.inverted.yellow.buttons .active.button{background-color:#ffdf05}.ui.inverted.yellow.button:active,.ui.inverted.yellow.buttons .button:active{background-color:#ebcd00}.ui.inverted.yellow.basic.button,.ui.inverted.yellow.basic.buttons .button,.ui.inverted.yellow.buttons .basic.button{background-color:transparent;box-shadow:0 0 0 2px rgba(255,255,255,.5) inset!important;color:#fff!important}.ui.inverted.yellow.basic.button:hover,.ui.inverted.yellow.basic.buttons .button:hover,.ui.inverted.yellow.buttons .basic.button:hover{box-shadow:0 0 0 2px #ffdf05 inset!important;color:#ffe21f!important}.ui.inverted.yellow.basic.button:focus,.ui.inverted.yellow.basic.buttons .button:focus{box-shadow:0 0 0 2px #f5d500 inset!important;color:#ffe21f!important}.ui.inverted.yellow.basic.active.button,.ui.inverted.yellow.basic.buttons .active.button,.ui.inverted.yellow.buttons .basic.active.button{box-shadow:0 0 0 2px #ffdf05 inset!important;color:#ffe21f!important}.ui.inverted.yellow.basic.button:active,.ui.inverted.yellow.basic.buttons .button:active,.ui.inverted.yellow.buttons .basic.button:active{box-shadow:0 0 0 2px #ebcd00 inset!important;color:#ffe21f!important}.ui.primary.button,.ui.primary.buttons .button{background-color:#2185d0;color:#fff;text-shadow:none;background-image:none}.ui.primary.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.primary.button:hover,.ui.primary.buttons .button:hover{background-color:#1678c2;color:#fff;text-shadow:none}.ui.primary.button:focus,.ui.primary.buttons .button:focus{background-color:#0d71bb;color:#fff;text-shadow:none}.ui.primary.button:active,.ui.primary.buttons .button:active{background-color:#1a69a4;color:#fff;text-shadow:none}.ui.primary.active.button,.ui.primary.buttons .active.button{background-color:#1279c6;color:#fff;text-shadow:none}.ui.secondary.button,.ui.secondary.buttons .button{background-color:#1b1c1d;color:#fff;text-shadow:none;background-image:none}.ui.secondary.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.secondary.button:hover,.ui.secondary.buttons .button:hover{background-color:#27292a;color:#fff;text-shadow:none}.ui.secondary.button:focus,.ui.secondary.buttons .button:focus{background-color:#2e3032;color:#fff;text-shadow:none}.ui.secondary.button:active,.ui.secondary.buttons .button:active{background-color:#343637;color:#fff;text-shadow:none}.ui.secondary.active.button,.ui.secondary.buttons .active.button{background-color:#27292a;color:#fff;text-shadow:none}.ui.positive.button,.ui.positive.buttons .button{background-color:#21ba45!important;color:#fff;text-shadow:none;background-image:none}.ui.positive.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.positive.button:hover,.ui.positive.buttons .button:hover{background-color:#16ab39!important;color:#fff;text-shadow:none}.ui.positive.button:focus,.ui.positive.buttons .button:focus{background-color:#0ea432!important;color:#fff;text-shadow:none}.ui.positive.button:active,.ui.positive.buttons .button:active{background-color:#198f35!important;color:#fff;text-shadow:none}.ui.positive.active.button,.ui.positive.buttons .active.button,.ui.positive.buttons .active.button:active{background-color:#13ae38;color:#fff;text-shadow:none}.ui.negative.button,.ui.negative.buttons .button{background-color:#db2828!important;color:#fff;text-shadow:none;background-image:none}.ui.negative.button{box-shadow:0 0 0 0 rgba(34,36,38,.15) inset}.ui.negative.button:hover,.ui.negative.buttons .button:hover{background-color:#d01919!important;color:#fff;text-shadow:none}.ui.negative.button:focus,.ui.negative.buttons .button:focus{background-color:#ca1010!important;color:#fff;text-shadow:none}.ui.negative.button:active,.ui.negative.buttons .button:active{background-color:#b21e1e!important;color:#fff;text-shadow:none}.ui.negative.active.button,.ui.negative.buttons .active.button,.ui.negative.buttons .active.button:active{background-color:#d41515;color:#fff;text-shadow:none}.ui.buttons{display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;font-size:0;vertical-align:baseline;margin:0 .25em 0 0}.ui.buttons:not(.basic):not(.inverted){box-shadow:none}.ui.buttons:after{content:".";display:block;height:0;clear:both;visibility:hidden}.ui.buttons .button{-webkit-box-flex:1;-webkit-flex:1 0 auto;-ms-flex:1 0 auto;flex:1 0 auto;border-radius:0;margin:0}.ui.buttons:not(.basic):not(.inverted)>.button,.ui.buttons>.ui.button:not(.basic):not(.inverted){box-shadow:0 0 0 1px transparent inset,0 0 0 0 rgba(34,36,38,.15) inset}.ui.buttons .button:first-child{border-left:none;margin-left:0;border-top-left-radius:.28571429rem;border-bottom-left-radius:.28571429rem}.ui.buttons .button:last-child{border-top-right-radius:.28571429rem;border-bottom-right-radius:.28571429rem}.ui.vertical.buttons{display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}.ui.vertical.buttons .button{display:block;float:none;width:100%;margin:0;box-shadow:none}.ui.vertical.buttons .button:first-child,.ui.vertical.buttons .huge.button:first-child,.ui.vertical.buttons .massive.button:first-child,.ui.vertical.buttons .mini.button:first-child,.ui.vertical.buttons .small.button:first-child,.ui.vertical.buttons .tiny.button:first-child{border-radius:.28571429rem .28571429rem 0 0}.ui.vertical.buttons .button:last-child,.ui.vertical.buttons .gigantic.button:last-child,.ui.vertical.buttons .huge.button:last-child,.ui.vertical.buttons .massive.button:last-child,.ui.vertical.buttons .mini.button:last-child,.ui.vertical.buttons .small.button:last-child,.ui.vertical.buttons .tiny.button:last-child{margin-bottom:0;border-radius:0 0 .28571429rem .28571429rem}


  .ui.label{display:inline-block;line-height:1;vertical-align:baseline;margin:0 .14285714em;background-color:#e8e8e8;background-image:none;padding:.5833em .833em;color:rgba(0,0,0,.6);text-transform:none;font-weight:700;border:0 solid transparent;border-radius:.28571429rem;-webkit-transition:background .1s ease;transition:background .1s ease}.ui.label:first-child{margin-left:0}
   .ui.label:last-child{margin-right:0}a.ui.label{cursor:pointer}.ui.label>a{cursor:pointer;color:inherit;opacity:.5;-webkit-transition:.1s opacity ease;transition:.1s opacity ease}.ui.label>a:hover{opacity:1}.ui.label>img{width:auto!important;vertical-align:middle;height:2.1666em!important}.ui.label>.icon{width:auto;margin:0 .75em 0 0}.ui.label>.detail{display:inline-block;vertical-align:top;font-weight:700;margin-left:1em;opacity:.8}.ui.label>.detail .icon{margin:0 .25em 0 0}.ui.label>.close.icon,.ui.label>.delete.icon{cursor:pointer;margin-right:0;margin-left:.5em;font-size:.92857143em;opacity:.5;-webkit-transition:background .1s ease;transition:background .1s ease}.ui.label>.delete.icon:hover{opacity:1}.ui.labels>.label{margin:0 .5em .5em 0}.ui.header>.ui.label{margin-top:-.29165em}.ui.attached.segment>.ui.top.left.attached.label,.ui.bottom.attached.segment>.ui.top.left.attached.label{border-top-left-radius:0}.ui.attached.segment>.ui.top.right.attached.label,.ui.bottom.attached.segment>.ui.top.right.attached.label{border-top-right-radius:0}.ui.top.attached.segment>.ui.bottom.left.attached.label{border-bottom-left-radius:0}.ui.top.attached.segment>.ui.bottom.right.attached.label{border-bottom-right-radius:0}.ui.top.attached.label:first-child+:not(.attached){margin-top:2rem!important}.ui.bottom.attached.label:first-child~:last-child:not(.attached){margin-top:0;margin-bottom:2rem!important}.ui.image.label{width:auto!important;margin-top:0;margin-bottom:0;max-width:9999px;vertical-align:baseline;text-transform:none;background:#e8e8e8;padding:.5833em .833em .5833em .5em;border-radius:.28571429rem;box-shadow:none}.ui.image.label img{display:inline-block;vertical-align:top;height:2.1666em;margin:-.5833em .5em -.5833em -.5em;border-radius:.28571429rem 0 0 .28571429rem}.ui.image.label .detail{background:rgba(0,0,0,.1);margin:-.5833em -.833em -.5833em .5em;padding:.5833em .833em;border-radius:0 .28571429rem .28571429rem 0}.ui.tag.label,.ui.tag.labels .label{margin-left:1em;position:relative;padding-left:1.5em;padding-right:1.5em;border-radius:0 .28571429rem .28571429rem 0;-webkit-transition:none;transition:none}.ui.tag.label:before,.ui.tag.labels .label:before{position:absolute;-webkit-transform:translateY(-50%) translateX(50%) rotate(-45deg);-ms-transform:translateY(-50%) translateX(50%) rotate(-45deg);transform:translateY(-50%) translateX(50%) rotate(-45deg);top:50%;right:100%;content:'';background-color:inherit;background-image:none;width:1.56em;height:1.56em;-webkit-transition:none;transition:none}.ui.tag.label:after,.ui.tag.labels .label:after{position:absolute;content:'';top:50%;left:-.25em;margin-top:-.25em;background-color:#fff!important;width:.5em;height:.5em;box-shadow:0 -1px 1px 0 rgba(0,0,0,.3);border-radius:500rem}.ui.corner.label{position:absolute;top:0;right:0;margin:0;padding:0;text-align:center;border-color:#e8e8e8;width:4em;height:4em;z-index:1;-webkit-transition:border-color .1s ease;transition:border-color .1s ease;background-color:transparent!important}.ui.corner.label:after{position:absolute;content:"";right:0;top:0;z-index:-1;width:0;height:0;background-color:transparent!important;border-top:0 solid transparent;border-right:4em solid transparent;border-bottom:4em solid transparent;border-left:0 solid transparent;border-right-color:inherit;-webkit-transition:border-color .1s ease;transition:border-color .1s ease}.ui.corner.label .icon{cursor:default;position:relative;top:.64285714em;left:.78571429em;font-size:1.14285714em;margin:0}.ui.left.corner.label,.ui.left.corner.label:after{right:auto;left:0}.ui.left.corner.label:after{border-top:4em solid transparent;border-right:4em solid transparent;border-bottom:0 solid transparent;border-left:0 solid transparent;border-top-color:inherit}.ui.left.corner.label .icon{left:-.78571429em}.ui.segment>.ui.corner.label{top:-1px;right:-1px}.ui.segment>.ui.left.corner.label{right:auto;left:-1px}.ui.ribbon.label{position:relative;margin:0;min-width:-webkit-max-content;min-width:-moz-max-content;min-width:max-content;border-radius:0 .28571429rem .28571429rem 0;border-color:rgba(0,0,0,.15)}.ui.ribbon.label:after{position:absolute;content:'';top:100%;left:0;background-color:transparent!important;border-style:solid;border-width:0 1.2em 1.2em 0;border-color:transparent;border-right-color:inherit;width:0;height:0}.ui.ribbon.label{left:calc(-1rem - 1.2em);margin-right:-1.2em;padding-left:calc(1rem + 1.2em);padding-right:1.2em}.ui[class*="right ribbon"].label{left:calc(100% + 1rem + 1.2em);padding-left:1.2em;padding-right:calc(1rem + 1.2em);text-align:left;-webkit-transform:translateX(-100%);-ms-transform:translateX(-100%);transform:translateX(-100%);border-radius:.28571429rem 0 0 .28571429rem}.ui[class*="right ribbon"].label:after{left:auto;right:0;border-style:solid;border-width:1.2em 1.2em 0 0;border-color:transparent;border-top-color:inherit}.ui.card .image>.ribbon.label,.ui.image>.ribbon.label{position:absolute;top:1rem}.ui.card .image>.ui.ribbon.label,.ui.image>.ui.ribbon.label{left:calc(.05rem - 1.2em)}.ui.card .image>.ui[class*="right ribbon"].label,.ui.image>.ui[class*="right ribbon"].label{left:calc(100% + -.05rem + 1.2em);padding-left:.833em}.ui.table td>.ui.ribbon.label{left:calc(-.71428571em - 1.2em)}.ui.table td>.ui[class*="right ribbon"].label{left:calc(100% + .71428571em + 1.2em);padding-left:.833em}.ui.attached.label,.ui[class*="top attached"].label{width:100%;position:absolute;margin:0;top:0;left:0;padding:.75em 1em;border-radius:.21428571rem .21428571rem 0 0}.ui[class*="bottom attached"].label{top:auto;bottom:0;border-radius:0 0 .21428571rem .21428571rem}.ui[class*="top left attached"].label{width:auto;margin-top:0!important;border-radius:.21428571rem 0 .28571429rem}.ui[class*="top right attached"].label{width:auto;left:auto;right:0;border-radius:0 .21428571rem 0 .28571429rem}.ui[class*="bottom left attached"].label{width:auto;top:auto;bottom:0;border-radius:0 .28571429rem 0 .21428571rem}.ui[class*="bottom right attached"].label{top:auto;bottom:0;left:auto;right:0;width:auto;border-radius:.28571429rem 0 .21428571rem}.ui.label.disabled{opacity:.5}a.ui.label:hover,a.ui.labels .label:hover{background-color:#e0e0e0;border-color:#e0e0e0;background-image:none;color:rgba(0,0,0,.8)}.ui.labels a.label:hover:before,a.ui.label:hover:before{color:rgba(0,0,0,.8)}.ui.active.label{background-color:#d0d0d0;border-color:#d0d0d0;background-image:none;color:rgba(0,0,0,.95)}.ui.active.label:before{background-color:#d0d0d0;background-image:none;color:rgba(0,0,0,.95)}a.ui.active.label:hover,a.ui.labels .active.label:hover{background-color:#c8c8c8;border-color:#c8c8c8;background-image:none;color:rgba(0,0,0,.95)}.ui.labels a.active.label:ActiveHover:before,a.ui.active.label:ActiveHover:before{background-color:#c8c8c8;background-image:none;color:rgba(0,0,0,.95)}.ui.label.visible,.ui.labels.visible .label{display:inline-block!important}.ui.label.hidden,.ui.labels.hidden .label{display:none!important}.ui.red.label,.ui.red.labels .label{background-color:#db2828!important;border-color:#db2828!important;color:#fff!important}.ui.red.labels .label:hover,a.ui.red.label:hover{background-color:#d01919!important;border-color:#d01919!important;color:#fff!important}.ui.red.corner.label,.ui.red.corner.label:hover{background-color:transparent!important}.ui.red.ribbon.label{border-color:#b21e1e!important}.ui.basic.red.label{background-color:#fff!important;color:#db2828!important;border-color:#db2828!important}.ui.basic.red.labels a.label:hover,a.ui.basic.red.label:hover{background-color:#fff!important;color:#d01919!important;border-color:#d01919!important}.ui.orange.label,.ui.orange.labels .label{background-color:#f2711c!important;border-color:#f2711c!important;color:#fff!important}.ui.orange.labels .label:hover,a.ui.orange.label:hover{background-color:#f26202!important;border-color:#f26202!important;color:#fff!important}.ui.orange.corner.label,.ui.orange.corner.label:hover{background-color:transparent!important}.ui.orange.ribbon.label{border-color:#cf590c!important}.ui.basic.orange.label{background-color:#fff!important;color:#f2711c!important;border-color:#f2711c!important}.ui.basic.orange.labels a.label:hover,a.ui.basic.orange.label:hover{background-color:#fff!important;color:#f26202!important;border-color:#f26202!important}.ui.yellow.label,.ui.yellow.labels .label{background-color:#fbbd08!important;border-color:#fbbd08!important;color:#fff!important}.ui.yellow.labels .label:hover,a.ui.yellow.label:hover{background-color:#eaae00!important;border-color:#eaae00!important;color:#fff!important}.ui.yellow.corner.label,.ui.yellow.corner.label:hover{background-color:transparent!important}.ui.yellow.ribbon.label{border-color:#cd9903!important}.ui.basic.yellow.label{background-color:#fff!important;color:#fbbd08!important;border-color:#fbbd08!important}.ui.basic.yellow.labels a.label:hover,a.ui.basic.yellow.label:hover{background-color:#fff!important;color:#eaae00!important;border-color:#eaae00!important}.ui.olive.label,.ui.olive.labels .label{background-color:#b5cc18!important;border-color:#b5cc18!important;color:#fff!important}.ui.olive.labels .label:hover,a.ui.olive.label:hover{background-color:#a7bd0d!important;border-color:#a7bd0d!important;color:#fff!important}.ui.olive.corner.label,.ui.olive.corner.label:hover{background-color:transparent!important}.ui.olive.ribbon.label{border-color:#198f35!important}.ui.basic.olive.label{background-color:#fff!important;color:#b5cc18!important;border-color:#b5cc18!important}.ui.basic.olive.labels a.label:hover,a.ui.basic.olive.label:hover{background-color:#fff!important;color:#a7bd0d!important;border-color:#a7bd0d!important}.ui.green.label,.ui.green.labels .label{background-color:#21ba45!important;border-color:#21ba45!important;color:#fff!important}.ui.green.labels .label:hover,a.ui.green.label:hover{background-color:#16ab39!important;border-color:#16ab39!important;color:#fff!important}.ui.green.corner.label,.ui.green.corner.label:hover{background-color:transparent!important}.ui.green.ribbon.label{border-color:#198f35!important}.ui.basic.green.label{background-color:#fff!important;color:#21ba45!important;border-color:#21ba45!important}.ui.basic.green.labels a.label:hover,a.ui.basic.green.label:hover{background-color:#fff!important;color:#16ab39!important;border-color:#16ab39!important}.ui.teal.label,.ui.teal.labels .label{background-color:#00b5ad!important;border-color:#00b5ad!important;color:#fff!important}.ui.teal.labels .label:hover,a.ui.teal.label:hover{background-color:#009c95!important;border-color:#009c95!important;color:#fff!important}.ui.teal.corner.label,.ui.teal.corner.label:hover{background-color:transparent!important}.ui.teal.ribbon.label{border-color:#00827c!important}.ui.basic.teal.label{background-color:#fff!important;color:#00b5ad!important;border-color:#00b5ad!important}.ui.basic.teal.labels a.label:hover,a.ui.basic.teal.label:hover{background-color:#fff!important;color:#009c95!important;border-color:#009c95!important}.ui.blue.label,.ui.blue.labels .label{background-color:#2185d0!important;border-color:#2185d0!important;color:#fff!important}.ui.blue.labels .label:hover,a.ui.blue.label:hover{background-color:#1678c2!important;border-color:#1678c2!important;color:#fff!important}.ui.blue.corner.label,.ui.blue.corner.label:hover{background-color:transparent!important}.ui.blue.ribbon.label{border-color:#1a69a4!important}.ui.basic.blue.label{background-color:#fff!important;color:#2185d0!important;border-color:#2185d0!important}.ui.basic.blue.labels a.label:hover,a.ui.basic.blue.label:hover{background-color:#fff!important;color:#1678c2!important;border-color:#1678c2!important}.ui.violet.label,.ui.violet.labels .label{background-color:#6435c9!important;border-color:#6435c9!important;color:#fff!important}.ui.violet.labels .label:hover,a.ui.violet.label:hover{background-color:#5829bb!important;border-color:#5829bb!important;color:#fff!important}.ui.violet.corner.label,.ui.violet.corner.label:hover{background-color:transparent!important}.ui.violet.ribbon.label{border-color:#502aa1!important}.ui.basic.violet.label{background-color:#fff!important;color:#6435c9!important;border-color:#6435c9!important}.ui.basic.violet.labels a.label:hover,a.ui.basic.violet.label:hover{background-color:#fff!important;color:#5829bb!important;border-color:#5829bb!important}.ui.purple.label,.ui.purple.labels .label{background-color:#a333c8!important;border-color:#a333c8!important;color:#fff!important}.ui.purple.labels .label:hover,a.ui.purple.label:hover{background-color:#9627ba!important;border-color:#9627ba!important;color:#fff!important}.ui.purple.corner.label,.ui.purple.corner.label:hover{background-color:transparent!important}.ui.purple.ribbon.label{border-color:#82299f!important}.ui.basic.purple.label{background-color:#fff!important;color:#a333c8!important;border-color:#a333c8!important}.ui.basic.purple.labels a.label:hover,a.ui.basic.purple.label:hover{background-color:#fff!important;color:#9627ba!important;border-color:#9627ba!important}.ui.pink.label,.ui.pink.labels .label{background-color:#e03997!important;border-color:#e03997!important;color:#fff!important}.ui.pink.labels .label:hover,a.ui.pink.label:hover{background-color:#e61a8d!important;border-color:#e61a8d!important;color:#fff!important}.ui.pink.corner.label,.ui.pink.corner.label:hover{background-color:transparent!important}.ui.pink.ribbon.label{border-color:#c71f7e!important}.ui.basic.pink.label{background-color:#fff!important;color:#e03997!important;border-color:#e03997!important}.ui.basic.pink.labels a.label:hover,a.ui.basic.pink.label:hover{background-color:#fff!important;color:#e61a8d!important;border-color:#e61a8d!important}.ui.brown.label,.ui.brown.labels .label{background-color:#a5673f!important;border-color:#a5673f!important;color:#fff!important}.ui.brown.labels .label:hover,a.ui.brown.label:hover{background-color:#975b33!important;border-color:#975b33!important;color:#fff!important}.ui.brown.corner.label,.ui.brown.corner.label:hover{background-color:transparent!important}.ui.brown.ribbon.label{border-color:#805031!important}.ui.basic.brown.label{background-color:#fff!important;color:#a5673f!important;border-color:#a5673f!important}.ui.basic.brown.labels a.label:hover,a.ui.basic.brown.label:hover{background-color:#fff!important;color:#975b33!important;border-color:#975b33!important}.ui.grey.label,.ui.grey.labels .label{background-color:#767676!important;border-color:#767676!important;color:#fff!important}.ui.grey.labels .label:hover,a.ui.grey.label:hover{background-color:#838383!important;border-color:#838383!important;color:#fff!important}.ui.grey.corner.label,.ui.grey.corner.label:hover{background-color:transparent!important}.ui.grey.ribbon.label{border-color:#805031!important}.ui.basic.grey.label{background-color:#fff!important;color:#767676!important;border-color:#767676!important}.ui.basic.grey.labels a.label:hover,a.ui.basic.grey.label:hover{background-color:#fff!important;color:#838383!important;border-color:#838383!important}.ui.black.label,.ui.black.labels .label{background-color:#1b1c1d!important;border-color:#1b1c1d!important;color:#fff!important}.ui.black.labels .label:hover,a.ui.black.label:hover{background-color:#27292a!important;border-color:#27292a!important;color:#fff!important}.ui.black.corner.label,.ui.black.corner.label:hover{background-color:transparent!important}.ui.black.ribbon.label{border-color:#805031!important}.ui.basic.black.label{background-color:#fff!important;color:#1b1c1d!important;border-color:#1b1c1d!important}.ui.basic.black.labels a.label:hover,a.ui.basic.black.label:hover{background-color:#fff!important;color:#27292a!important;border-color:#27292a!important}.ui.basic.label{background:#fff;border:1px solid rgba(34,36,38,.15);color:rgba(0,0,0,.87);box-shadow:none}a.ui.basic.label:hover{text-decoration:none;background:#fff;color:#1e70bf;box-shadow:1px solid rgba(34,36,38,.15);box-shadow:none}.ui.basic.pointing.label:before{border-color:inherit}.ui.fluid.labels>.label,.ui.label.fluid{width:100%;box-sizing:border-box}.ui.inverted.label,.ui.inverted.labels .label{color:rgba(255,255,255,.9)!important}.ui.horizontal.label,.ui.horizontal.labels .label{margin:0 .5em 0 0;padding:.4em .833em;min-width:3em;text-align:center}.ui.circular.label,.ui.circular.labels .label{min-width:2em;min-height:2em;padding:.5em!important;line-height:1em;text-align:center;border-radius:500rem}.ui.empty.circular.label,.ui.empty.circular.labels .label{min-width:0;min-height:0;overflow:hidden;width:.5em;height:.5em;vertical-align:baseline}.ui.pointing.label{position:relative}.ui.attached.pointing.label{position:absolute}.ui.pointing.label:before{background-color:inherit;border-style:solid;border-color:inherit;position:absolute;content:'';-webkit-transform:rotate(45deg);-ms-transform:rotate(45deg);transform:rotate(45deg);background-image:none;z-index:2;width:.6666em;height:.6666em;-webkit-transition:background .1s ease;transition:background .1s ease}.ui.pointing.label,.ui[class*="pointing above"].label{margin-top:1em}.ui.pointing.label:before,.ui[class*="pointing above"].label:before{border-width:1px 0 0 1px;-webkit-transform:translateX(-50%) translateY(-50%) rotate(45deg);-ms-transform:translateX(-50%) translateY(-50%) rotate(45deg);transform:translateX(-50%) translateY(-50%) rotate(45deg);top:0;left:50%}.ui[class*="bottom pointing"].label,.ui[class*="pointing below"].label{margin-top:0;margin-bottom:1em}.ui[class*="bottom pointing"].label:before,.ui[class*="pointing below"].label:before{border-width:0 1px 1px 0;right:auto;-webkit-transform:translateX(-50%) translateY(-50%) rotate(45deg);-ms-transform:translateX(-50%) translateY(-50%) rotate(45deg);transform:translateX(-50%) translateY(-50%) rotate(45deg);top:100%;left:50%}.ui[class*="left pointing"].label{margin-top:0;margin-left:.6666em}.ui[class*="left pointing"].label:before{border-width:0 0 1px 1px;-webkit-transform:translateX(-50%) translateY(-50%) rotate(45deg);-ms-transform:translateX(-50%) translateY(-50%) rotate(45deg);transform:translateX(-50%) translateY(-50%) rotate(45deg);bottom:auto;right:auto;top:50%;left:0}.ui[class*="right pointing"].label{margin-top:0;margin-right:.6666em}.ui[class*="right pointing"].label:before{border-width:1px 1px 0 0;-webkit-transform:translateX(50%) translateY(-50%) rotate(45deg);-ms-transform:translateX(50%) translateY(-50%) rotate(45deg);transform:translateX(50%) translateY(-50%) rotate(45deg);top:50%;right:0;bottom:auto;left:auto}.ui.basic.pointing.label:before,.ui.basic[class*="pointing above"].label:before{margin-top:-1px}.ui.basic[class*="bottom pointing"].label:before,.ui.basic[class*="pointing below"].label:before{bottom:auto;top:100%;margin-top:1px}.ui.basic[class*="left pointing"].label:before{top:50%;left:-1px}.ui.basic[class*="right pointing"].label:before{top:50%;right:-1px}.ui.floating.label{position:absolute;z-index:100;top:-1em;left:100%;margin:0 0 0 -1.5em!important}.ui.mini.label,.ui.mini.labels .label{font-size:.64285714rem}.ui.tiny.label,.ui.tiny.labels .label{font-size:.71428571rem}.ui.small.label,.ui.small.labels .label{font-size:.78571429rem}.ui.label,.ui.labels .label{font-size:.85714286rem}.ui.large.label,.ui.large.labels .label{font-size:1rem}.ui.big.label,.ui.big.labels .label{font-size:1.28571429rem}.ui.huge.label,.ui.huge.labels .label{font-size:1.42857143rem}.ui.massive.label,.ui.massive.labels .label{font-size:1.71428571rem}

   .ui.input{position:relative;font-weight:400;font-style:normal;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;color:rgba(0,0,0,.87)}.ui.input input{margin:0;max-width:100%;-webkit-box-flex:1;-webkit-flex:1 0 auto;-ms-flex:1 0 auto;flex:1 0 auto;outline:0;-webkit-tap-highlight-color:rgba(255,255,255,0);text-align:left;line-height:1.2142em;font-family:Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;padding:.67861429em 1em;background:#fff;border:1px solid rgba(34,36,38,.15);color:rgba(0,0,0,.87);border-radius:.28571429rem;-webkit-transition:box-shadow .1s ease,border-color .1s ease;transition:box-shadow .1s ease,border-color .1s ease;box-shadow:none}.ui.input input::-webkit-input-placeholder{color:rgba(0,0,0,.4)}.ui.input input::-moz-placeholder{color:rgba(0,0,0,.4)}.ui.input input::-ms-input-placeholder{color:rgba(0,0,0,.4)}.ui.disabled.input,.ui.input input[disabled]{opacity:.45}.ui.disabled.input input{pointer-events:none}.ui.input input:active,.ui.input.down input{border-color:rgba(0,0,0,.3);background:#fafafa;color:rgba(0,0,0,.87);box-shadow:none}.ui.loading.loading.input>i.icon:before{position:absolute;content:'';top:50%;left:50%;margin:-.64285714em 0 0 -.64285714em;width:1.28571429em;height:1.28571429em;border-radius:500rem;border:.2em solid rgba(0,0,0,.1)}.ui.loading.loading.input>i.icon:after{position:absolute;content:'';top:50%;left:50%;margin:-.64285714em 0 0 -.64285714em;width:1.28571429em;height:1.28571429em;-webkit-animation:button-spin .6s linear;animation:button-spin .6s linear;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;border-radius:500rem;border-color:#767676 transparent transparent;border-style:solid;border-width:.2em;box-shadow:0 0 0 1px transparent}.ui.input input:focus,.ui.input.focus input{border-color:#85b7d9;background:#fff;color:rgba(0,0,0,.8);box-shadow:none}.ui.input input:focus::-webkit-input-placeholder,.ui.input.focus input::-webkit-input-placeholder{color:rgba(0,0,0,.87)}.ui.input input:focus::-moz-placeholder,.ui.input.focus input::-moz-placeholder{color:rgba(0,0,0,.87)}.ui.input input:focus::-ms-input-placeholder,.ui.input.focus input::-ms-input-placeholder{color:rgba(0,0,0,.87)}.ui.input.error input{background-color:#fff6f6;border-color:#e0b4b4;color:#9f3a38;box-shadow:none}.ui.input.error input::-webkit-input-placeholder{color:#e7bdbc}.ui.input.error input::-moz-placeholder{color:#e7bdbc}.ui.input.error input::-ms-input-placeholder{color:#e7bdbc}.ui.input.error input:focus::-webkit-input-placeholder{color:#da9796}.ui.input.error input:focus::-moz-placeholder{color:#da9796}.ui.input.error input:focus::-ms-input-placeholder{color:#da9796}.ui.transparent.input input{border-color:transparent!important;background-color:transparent!important;padding:0!important;box-shadow:none!important}.ui.transparent.icon.input>i.icon{width:1.1em}.ui.transparent.icon.input>input{padding-left:0!important;padding-right:2em!important}.ui.transparent[class*="left icon"].input>input{padding-left:2em!important;padding-right:0!important}.ui.transparent.inverted.input{color:#fff}.ui.transparent.inverted.input input{color:inherit}.ui.transparent.inverted.input input::-webkit-input-placeholder{color:rgba(255,255,255,.5)}.ui.transparent.inverted.input input::-moz-placeholder{color:rgba(255,255,255,.5)}.ui.transparent.inverted.input input::-ms-input-placeholder{color:rgba(255,255,255,.5)}.ui.icon.input>i.icon{cursor:default;position:absolute;line-height:1;text-align:center;top:0;right:0;margin:0;height:100%;width:2.67142857em;opacity:.5;border-radius:0 .28571429rem .28571429rem 0;-webkit-transition:opacity .3s ease;transition:opacity .3s ease}.ui.icon.input>i.icon:not(.link){pointer-events:none}.ui.icon.input input{padding-right:2.67142857em!important}.ui.icon.input>i.icon:after,.ui.icon.input>i.icon:before{left:0;position:absolute;text-align:center;top:50%;width:100%;margin-top:-.5em}.ui.icon.input>i.link.icon{cursor:pointer}.ui.icon.input>i.circular.icon{top:.35em;right:.5em}.ui[class*="left icon"].input>i.icon{right:auto;left:1px;border-radius:.28571429rem 0 0 .28571429rem}.ui[class*="left icon"].input>i.circular.icon{right:auto;left:.5em}.ui[class*="left icon"].input>input{padding-left:2.67142857em!important;padding-right:1em!important}.ui.icon.input>input:focus~i.icon{opacity:1}.ui.labeled.input>.label{-webkit-box-flex:0;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;flex:0 0 auto;margin:0;font-size:1em}.ui.labeled.input>.label:not(.corner){padding-top:.78571429em;padding-bottom:.78571429em}.ui.labeled.input:not([class*="corner labeled"]) .label:first-child{border-top-right-radius:0;border-bottom-right-radius:0}.ui.labeled.input:not([class*="corner labeled"]) .label:first-child+input{border-top-left-radius:0;border-bottom-left-radius:0;border-left-color:transparent}.ui.labeled.input:not([class*="corner labeled"]) .label:first-child+input:focus{border-left-color:#85b7d9}.ui[class*="right labeled"].input input{border-top-right-radius:0!important;border-bottom-right-radius:0!important;border-right-color:transparent!important}.ui[class*="right labeled"].input input+.label{border-top-left-radius:0;border-bottom-left-radius:0}.ui[class*="right labeled"].input input:focus{border-right-color:#85b7d9!important}.ui.labeled.input .corner.label{top:1px;right:1px;font-size:.64285714em;border-radius:0 .28571429rem 0 0}.ui[class*="corner labeled"]:not([class*="left corner labeled"]).labeled.input input{padding-right:2.5em!important}.ui[class*="corner labeled"].icon.input:not([class*="left corner labeled"])>input{padding-right:3.25em!important}.ui[class*="corner labeled"].icon.input:not([class*="left corner labeled"])>.icon{margin-right:1.25em}.ui[class*="left corner labeled"].labeled.input input{padding-left:2.5em!important}.ui[class*="left corner labeled"].icon.input>input{padding-left:3.25em!important}.ui[class*="left corner labeled"].icon.input>.icon{margin-left:1.25em}.ui.input>.ui.corner.label{top:1px;right:1px}.ui.input>.ui.left.corner.label{right:auto;left:1px}.ui.action.input>.button,.ui.action.input>.buttons{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-flex:0;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;flex:0 0 auto}.ui.action.input>.button,.ui.action.input>.buttons>.button{padding-top:.78571429em;padding-bottom:.78571429em;margin:0}.ui.action.input:not([class*="left action"])>input{border-top-right-radius:0!important;border-bottom-right-radius:0!important;border-right-color:transparent!important}.ui.action.input:not([class*="left action"])>.button,.ui.action.input:not([class*="left action"])>.buttons>.button,.ui.action.input:not([class*="left action"])>.dropdown{border-radius:0}.ui.action.input:not([class*="left action"])>.button:last-child,.ui.action.input:not([class*="left action"])>.buttons:last-child>.button,.ui.action.input:not([class*="left action"])>.dropdown:last-child{border-radius:0 .28571429rem .28571429rem 0}.ui.action.input:not([class*="left action"]) input:focus{border-right-color:#85b7d9!important}.ui[class*="left action"].input>input{border-top-left-radius:0!important;border-bottom-left-radius:0!important;border-left-color:transparent!important}.ui[class*="left action"].input>.button,.ui[class*="left action"].input>.buttons>.button,.ui[class*="left action"].input>.dropdown{border-radius:0}.ui[class*="left action"].input>.button:first-child,.ui[class*="left action"].input>.buttons:first-child>.button,.ui[class*="left action"].input>.dropdown:first-child{border-radius:.28571429rem 0 0 .28571429rem}.ui[class*="left action"].input>input:focus{border-left-color:#85b7d9!important}.ui.inverted.input input{border:none}.ui.fluid.input{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.ui.fluid.input>input{width:0!important}.ui.mini.input{font-size:.71428571em}.ui.small.input{font-size:.92857143em}.ui.input{font-size:1em}.ui.large.input{font-size:1.14285714em}.ui.big.input{font-size:1.28571429em}.ui.huge.input{font-size:1.42857143em}.ui.massive.input{font-size:1.71428571em}
</style>
<!-- ----------------------------------------------------------------------- HTML ------------------------------------------------------------------------------------- -->

<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
  	<div class="container-fluid">
		  <ul class="breadcrumb">
  			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
  			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  			<?php } ?>
		  </ul>
    </div>
	</div>
  <!-- PROGRESS TOP -->
  <div id="top-progress-info" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="row"><div class="col-sm-12 dka-pie-content"><div id="circle_progress"></div></div></div>
    </div>
  </div>
  <div class="modal fade dka_modal" id="modal_default" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"><div class="modal-content"></div></div>
  </div>
  <div class="modal fade dka_modal" id="modal_mail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
    	<div class="modal-content">
        <div class="row">
          <div class="col-sm-9"><h2 id="mail_modal_h" class="text-left"></h2></div>
          <div class="col-sm-3 text-right">
            <button id="button_send" data-toggle="tooltip" title="<?php echo $text_mail_modal_send; ?>" class="btn btn-primary" onclick="mailSend()"><i class="fa fa-envelope"></i></button>
            <button data-toggle="tooltip" title="<?php echo $text_mail_modal_close; ?>" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i></button>
          </div>
        </div>
        <hr />
        <form class="form-horizontal" id="form_mail">
          <div class="form-group required ui segment">
            <label class="col-sm-2 control-label" for="input_answer"><?php echo $text_mail_modal_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="mail_address" id="mail_address" placeholder="<?php echo $text_mail_modal_address; ?>" id="input_address" class="form-control" readonly="" />
            </div>
          </div>
          <div class="form-group required ui segment">
            <label class="col-sm-2 control-label" for="input_answer"><?php echo $text_mail_modal_answer; ?></label>
            <div class="col-sm-10">
              <input type="text" name="answer" value="<?php echo $mail_answer; ?>" placeholder="<?php echo $text_mail_modal_answer; ?>" id="input_answer" class="form-control" />
            </div>
          </div>
          <div class="form-group required ui segment">
            <label class="col-sm-2 control-label" for="input_answer"><?php echo $text_mail_modal_copy; ?></label>
            <div class="col-sm-10">
              <input type="text" name="answer_copy" placeholder="<?php echo $text_mail_modal_copy; ?>" id="input_answer_copy" class="form-control" />
            </div>
          </div>
          <div class="form-group required ui segment">
            <label class="col-sm-2 control-label" for="input_subject"><?php echo $text_mail_modal_subject; ?></label>
            <div class="col-sm-10">
              <input type="text" name="subject" placeholder="<?php echo $text_mail_modal_subject; ?>" id="input_subject" class="form-control" />
            </div>
          </div>
          <div class="form-group required ui segment">
            <label class="col-sm-2 control-label" for="input_message"><?php echo $text_mail_modal_message; ?></label>
            <div class="col-sm-10">
              <textarea name="message" placeholder="<?php echo $text_mail_modal_message; ?>" id="input_message" class="form-control"></textarea>
            </div>
          </div>
          <input type="hidden" name="email_send" id="email_send">
        </form>
    	</div>
  	</div>
  </div>
  <div class="modal fade dka_modal" id="modal_startup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
  		<div class="modal-content">
        <div class="row">
          <div class="col-sm-12">
            <h3 class="col-sm-12"><?php echo $text_startup_header; ?></h3>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col-sm-12">
            <hr />
            <label class="ui teal label"><?php echo $text_startup_free;?></label>
            <p class="ui segment"><?php echo $text_startup_free_p;?></p>
            <hr />
            <label class="ui green label"><?php echo $text_startup_addition;?></label>
            <p class="ui segment"><?php echo $text_startup_addition_p;?></p>
            <hr />
						<p><?php echo $text_startup_contact;?></p>
						<table class="ui selectable basic padded table">
							<tbody>
								<tr><td><?php echo $text_startup_sale;?></td><td><a class="dka-href" href="http://shop.opencart-russia.ru/dreamtooz">http://shop.opencart-russia.ru/</a></td></tr>
								<tr><td><?php echo $text_startup_sale_of;?></td><td><a class="dka-href" href="http://dreamtooz.ru">http://dreamtooz.ru</a></td></tr>
								<tr><td><?php echo $text_startup_develop;?></td><td><a class="dka-href" href="http://dreamclever.ru">http://dreamclever.ru</a></td></tr>
								<tr><td><?php echo $text_startup_support;?></td><td><?php echo $dkaAddressSupport; ?></td></tr>
							</tbody>
						</table>
            <hr />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <button type="button" class="btn btn-default dka-button-stretch" onclick="dkaNoShow()"><?php echo $text_noshow; ?></button>
          </div>
          <div class="col-sm-4 col-sm-offset-4">
            <button type="button" class="btn btn-primary dka-button-stretch" data-dismiss="modal" aria-label="Close"><?php echo $text_close; ?></button>
          </div>
        </div>
			</div>
		</div>
  </div>
  <div class="container-fluid dka-general-container dka-shadow-top">
    <div class="row">
      <div class="col-sm-6"><h2 class="dka-module-name pull-left"><?php echo $heading_title; ?></h2><output for="range"></output></div>
      <div class="col-sm-6">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12"></div>
        </div>
      </div>
    </div>
    <div class="or-spacer">
      <div class="mask"></div>
        <span><i class="i-or-spacer" id="dka-circle-info"><i class="fa fa-check-square" title="<?php echo $dkaModuleDateRelease; ?>" data-toggle="tooltip"> <?php echo $dkaModuleMajorVersion . "." . $dkaModuleMinorVersion . "." . $dkaModuleBuildVersion; ?></i></i></span>
    </div>
    <!-- DKA ALERT ..............................................................--->
    <div class="row">
      <div class="col-sm-12">
        <aside class="alert dka-alert success">
          <table class="table">
            <tr><td class="dka-alert-td">
              <div class="alert-icon" data-toggle="tooltip" title="<?php echo $entry_text_error; ?>"><i class="fa fa-thumbs-o-up fa-4x pull-left"></i></div>
            </td><td>
              <div id="alert-content"></div>
            </td><td>
              <i class="fa fa-times close"></i>
            </td></tr>
            <tr class="dka-alert-debug"><td colspan="3">
              <p></p>
            </td></tr>
            <tr><td colspan="3">
              <button id="btn_sent_support" data-toggle="tooltip" title="<?php echo $tooltip_alert_mail_send; ?>" class="btn btn-warning" onclick="modalMail('w','',true)"><i class="fa fa-envelope"></i> <?php echo $text_alert_mail_send; ?></button>
            </td></tr>
          </table>
        </aside>
      </div>
    </div>
    <!-- DKA ALERT ------------------------------------------------------------------->
    <div class="row">
      <div class="col-sm-12">
        <div>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation"><a href="#tab_default" onclick="dkaDefault()" aria-controls="export" role="tab" data-toggle="tab" class="text-center"><i class="fa fa-home fa-4x"></i><br /> <?php echo $text_default; ?></a></li>
            <?php if($is_export){ ?>
              <li role="presentation"><a href="#tab_export" aria-controls="export" role="tab" data-toggle="tab" class="text-center"><i class="fa fa-arrow-circle-down fa-4x"></i><br /> <?php echo $text_export; ?></a></li>
            <?php } ?>
            <li role="presentation"><a href="#tab_result" aria-controls="tab_result" role="tab" data-toggle="tab" class="text-center dka-nav-tab-hide"></a></li>
            <div id="dka-button-panel">
              <a href="#tab_settings" aria-controls="tab_settings" role="tab" data-toggle="tab"><i class="fa fa-cog fa-3x" data-toggle="tooltip" title="<?php echo $entry_settings_info; ?>"></i></a>
            </div>
          </ul>
          <!-- TAB PANELS -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade" id="tab_default">
                <div class="row ui segment">
                  <div class="col-sm-12">
                    <div class="ui icon input fluid">
                      <input type="text" id="dka_search" placeholder="<?php echo $text_input_search; ?>...">
                      <i class="inverted fa fa-search link icon"></i>
                    </div>
                  </div>
                </div>
                <div class="row ui segment">
                  <div class="col-sm-12" id="div_cart">
                    <div class="row">
                      <div class="col-sm-6"><h4><?php echo $text_table_cart; ?></h4></div>
                      <div class="col-sm-6 text-right">
                        <button class="ui red icon button" data-toggle="tooltip" title="<?php echo $tooltip_delete_all; ?>" onclick="confirm('<?php echo $text_confirm; ?>') ? deleteCarts() : false;"><?php echo $text_clear; ?><i class="fa fa-trash-o fa-fw"></i></button>
                      </div>
                    </div>
                    <hr />
                    <div class="row">
                      <div class="col-sm-6 text-left">
                          <span class="ui label" id="pagination_info"></span>
                      </div>
                      <div class="col-sm-6 text-right">
                          <button class="ui left attached icon button" id="btn_back" onclick="pagiBack()"><i class="fa fa-angle-left fa-fw"></i><?php echo $text_back; ?></button>
                          <button class="ui right attached icon button" id="btn_forward" onclick="pagiForward()"><?php echo $text_forward; ?><i class="fa fa-angle-right fa-fw"></i></button>
                      </div>
                    </div>
                    <table class="ui selectable basic padded table" id="table_cart">
                      <thead>
                        <tr><th>№</th>
                        <th><?php echo $text_th_image; ?></th>
                        <th><?php echo $text_th_name; ?></th>
                        <th><?php echo $text_th_fio; ?></th>
                        <th><?php echo $text_th_email; ?></th>
                        <th><?php echo $text_th_phone; ?></th>
                        <th><?php echo $text_th_date; ?></th>
                        <th class="right aligned"><?php echo $text_th_action; ?></th>
                      </tr></thead>
                      <tbody id="main_carts"></tbody>
                    </table>
                  </div>
                </div>
              </div>
              <!-- TAB EXPORT -->
              <div role="tabpanel" class="tab-pane fade" id="tab_export">
                <div class="row ui segment">
                  <div class="col-sm-12">
                      <button class="ui green icon button" id="btn_export" data-toggle="tooltip" title="<?php echo $tooltip_export_carts; ?>" onclick="exportCarts()"><i class="fa fa-history fa-fw"></i> <?php echo $text_export; ?></button>
                  </div>
                </div>
                <div class="row ui segment" id="div_export_segment">
                  <div class="col-sm-12" id="export_main"></div>
                </div>
              </div>
              <!-- TAB SETTINGS -->
              <div role="tabpanel" class="tab-pane fade" id="tab_settings">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form_settings" class="form-horizontal">
                  <div class="row">
                    <div class="col-sm-9 pull-left">
                      <h2><?php echo $text_settings_modal_h; ?></h2>
                    </div>
                    <div class="col-sm-3">
                      <button type="submit" form="form_settings" data-toggle="tooltip" title="" class="btn btn-primary pull-right" data-original-title="<?php echo $text_save; ?>"><?php echo $text_save; ?></button>
                    </div>
                  </div>
                  <div class="row ui segment">
                    <span class="ui olive ribbon label"><?php echo $text_settings_update_copyright; ?></span>
                    <div class="form-group">
                      <label class="col-sm-3 col-xs-3 control-label"><?php echo $text_settings_update_check; ?></label>
                      <div class="col-sm-8 col-xs-5">
                        <select name="dka_cart_update" class="form-control">
                          <?php if ($dka_cart_update || strlen(trim($dka_cart_update)) < 1) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                      <div class="col-sm-1 col-xs-4">
                        <button id="btnUpdateSearchManual" type="button" class="btn btn-info pull-right" onclick="dkaUpdateModule();"><i class="fa fa-refresh"></i> <?php echo $text_settings_update_check; ?></button>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label"><?php echo $text_settings_update_show_modal; ?></label>
                      <div class="col-sm-9">
                        <select name="dka_cart_update_modal" class="form-control">
                          <?php if ($dka_cart_update_modal || strlen(trim($dka_cart_update_modal)) < 1) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <?php if ($dka_cart_startup_noshow || strlen(trim($dka_cart_startup_noshow)) < 1) { ?>
                    <input type="hidden" name="dka_cart_startup_noshow" value="1">
                    <?php }else{ ?>
                    <input type="hidden" name="dka_cart_startup_noshow" value="0">
                    <?php } ?>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="dka-footer-border">
        <div class="mask"></div>
      </div>
      <div class="row" id="dka-footer">
        <div class="col-sm-6">
          <span class="ui teal label dka-pointer" onclick="modalMail('', '', true)" data-toggle="tooltip" title="<?php echo $text_footer_support; ?>"><?php echo $dkaAddressSupport; ?></span>
        </div>
        <div class="col-sm-6 dka-footer-social">
          <a href="http://dreamclever.ru" target="_blank">
            <span class="fa-stack fa-lg pull-right" data-toggle="tooltip" title="<?php echo $text_footer_site; ?>">
              <i class="fa fa-square-o fa-stack-2x fa-2x"></i>
              <i class="fa fa-globe fa-stack-1x"></i>
            </span>
          </a>
          <a href="https://twitter.com/dreamtooz" target="_blank">
            <span class="fa-stack fa-lg pull-right" data-toggle="tooltip" title="<?php echo $text_footer_twitter; ?>">
              <i class="fa fa-square-o fa-stack-2x fa-2x"></i>
              <i class="fa fa-twitter fa-stack-1x"></i>
            </span>
          </a>
          <a href="http://www.youtube.com/channel/UCWdmR3tpvXkzubAZugUQLdw" target="_blank">
            <span class="fa-stack fa-lg pull-right" data-toggle="tooltip" title="<?php echo $text_footer_youtube; ?>">
              <i class="fa fa-square-o fa-stack-2x fa-2x"></i>
              <i class="fa fa-youtube fa-stack-1x"></i>
            </span>
          </a>
          <a href="http://vk.com/dreamclever" target="_blank">
            <span class="fa-stack fa-lg pull-right" data-toggle="tooltip" title="<?php echo $text_footer_vk; ?>">
              <i class="fa fa-square-o fa-stack-2x fa-2x"></i>
              <i class="fa fa-vk fa-stack-1x"></i>
            </span>
          </a>
        </div>
      </div>
    </div>
  </div>
<!-- ------------------------------------------------------------------------ JS -------------------------------------------------------------------------------------- -->
<script type="text/javascript">
// CONSTANT
// CIRCLE VERSION MODULE
var dka_circle_info        = '<i class="fa fa-check-square" title="<?php echo $dkaModuleDateRelease; ?>" data-toggle="tooltip"> <?php echo $dkaModuleMajorVersion . "." . $dkaModuleMinorVersion . "." . $dkaModuleBuildVersion; ?></i>';
// SPINNER LOAD PULSE S1
var dka_spinner_pulse_1    = '<i class="fa fa-spinner fa-pulse dka-text-c-blue"></i>';
// SPINNER LOAD PULSE S3
var dka_spinner_pulse_3    = '<i class="fa fa-spinner fa-pulse fa-3x dka-text-c-blue"></i>';
// SPINNER LOAD COG S5, TEXT: BLUE
var dka_spinner_cog_5_text = '<i class="fa fa-cog fa-spin fa-5x dka-text-c-blue"></i><br /><label class="dka-text-c-blue"><?php echo $text_loading; ?>...</label>';
// PROGRESS LOAD
var dka_progress_rainbow   = '';
// ***********************************************************************

// CONSTANT, RELOAD AFTER FINISH
var pageCurrent = 0;
var cartStart = 0;
var cartLimit = <?php echo $limit_load; ?>;
var cartTotal = 0;
var is_search = false;
var exportStart    = 0;
var arExport = []; // EXPORT FILES
var arExportHead = []; // EXPORT TABLE HEADER
var exportLimit = <?php echo $dka_export_limit ?>;
var exportProcent = 0;
var cartTotalExport = 0;
var cartTotalQeueu = 0;
// DEBUG
function dkaDebug(){}

// DOCUMENT LOAD OPERATION
$( document ).ready(function() {
  $('.nav-tabs a[href="#tab_default"]').tab('show');
  dataReload();
  dkaCartLoadData(true, 0);
  <?php if ($dka_cart_update || strlen(trim($dka_cart_update)) < 1) { ?> dkaUpdateModule(); <?php } ?>
  $('#input_message').summernote({ height: 300 });
  pageCurrent = 0;
  cartStart = 0;
  cartLimit = <?php echo $limit_load; ?>;
  cartTotal = 0;
  is_search = false;
  exportLimit = <?php echo $dka_export_limit ?>;
  <?php if ($dka_cart_startup_noshow || strlen(trim($dka_cart_startup_noshow)) < 1) { ?> $("#modal_startup").modal(); <?php } ?>
  dkaDebug();
});
// ***********************************************************************

// DATA AND EXPORT RELOAD
function dataReload(){
  is_search = false;
};
function exportReload(){
  exportStart   = 0;
  arExport      = []; // EXPORT FILES
  arExportHead  = []; // EXPORT TABLE HEADER
  exportLimit   = <?php echo $dka_export_limit ?>;
  exportProcent = 0; // PROCENT CIRCLE
  idSend        = 1; // ID FILES
}
// ***********************************************************************

// PROGRESS CIRCLE 1.0
( function( $ ){
	var ProgressCircle = function( element, options ){

		var settings          = $.extend( {}, $.fn.progressCircle.defaults, options );
		var thicknessConstant = 0.02;
		var nRadian           = 0;

		computePercent();
		setThickness();

		var border      = ( settings.thickness * thicknessConstant ) + 'em';
		var offset      = ( 1 - thicknessConstant * settings.thickness * 2 ) + 'em';
		var circle      = $( element );
		var progCirc    = circle.find( '.prog-circle' );
		var circleDiv   = progCirc.find( '.bar' );
		var circleSpan  = progCirc.children( '.percenttext' );
		var circleFill  = progCirc.find( '.fill' );
		var circleSlice = progCirc.find( '.slice' );

		if ( settings.nPercent == 0 ) {
			circleSlice.hide();
		} else {
			resetCircle();
			transformCircle( nRadians, circleDiv );
		}
		setBorderThickness();
		updatePercentage();
		setCircleSize();

		function computePercent () {
			settings.nPercent > 100 || settings.nPercent < 0 ? settings.nPercent = 0 : settings.nPercent;
			nRadians = ( 360 * settings.nPercent ) / 100;
		}

		function setThickness () {
			if ( settings.thickness > 10 ) {
				settings.thickness = 10;
			} else if ( settings.thickness < 1 ) {
				settings.thickness = 1;
			} else {
				settings.thickness = Math.round( settings.thickness );
			}
		}

		function setCircleSize ( ) {
			progCirc.css( 'font-size', settings.circleSize + 'px' );
		}

		function transformCircle ( nRadians, cDiv ) {
			var rotate = "rotate(" + nRadians + "deg)";
	    cDiv.css({
	      "-webkit-transform" : rotate,
	      "-moz-transform"    : rotate,
	      "-ms-transform"     : rotate,
	      "-o-transform"      : rotate,
	      "transform"         : rotate
	    });
	    if( nRadians > 180 ) {
		    transformCircle( 180, circleFill );
		    circleSlice.addClass( ' clipauto ');
			}
		}

		function setBorderThickness () {
			progCirc.find(' .slice > div ').css({
				'border-width' : border,
				'width'        : offset,
				'height'       : offset
			})
			progCirc.find('.after').css({
				'top'    : border,
				'left'   : border,
				'width'  : offset,
				'height' : offset
			})
		}

		function resetCircle () {
			circleSlice.show();
			circleSpan.text( '' );
			circleSlice.removeClass( 'clipauto' )
			transformCircle( 20, circleDiv );
			transformCircle( 20, circleFill );
			return this;
		}

		function updatePercentage () {
			settings.showPercentText && circleSpan.text( settings.nPercent + '%' );
		}
	};

	$.fn.progressCircle = function( options ) {
		return this.each( function( key, value ){
      var element = $( this );
      if ( element.data( 'progressCircle' ) ) {
      	var progressCircle = new ProgressCircle( this, options );
      	return element.data( 'progressCircle' );
      }
    	$( this ).append( '<div class="prog-circle">' +
	                 			'	<div class="percenttext"> </div>' +
	                 			'	<div class="slice">' +
	                 			'		<div class="bar"> </div>' +
	                 			'		<div class="fill"> </div>' +
	                 			'	</div>' +
	                 			'	<div class="after"> </div>' +
	                 			'</div>');
      var progressCircle = new ProgressCircle( this, options );
      element.data( 'progressCircle', progressCircle );
  	});
	};

	$.fn.progressCircle.defaults = {
		nPercent        : 50,
		showPercentText : true,
		circleSize      : 100,
		thickness       : 3
	};

})( jQuery );
// ***********************************************************************

// PROGRESS/INFO TOP
function dkaTopProgress(loadClass){
  loadClass == 'p' ? $(".dka-pie-content").addClass('pie-show') : null ;
  var isVisible = $( "#top-progress-info" ).is( ":visible" );
  isVisible == true ? $('#top-progress-info').fadeOut(4100) : $('#top-progress-info').fadeIn();
  loadClass == 'p' ? $(".dka-pie-content").animate({opacity:1}, 100) : $(".dka-pie-content").animate({opacity: 0.5}, 5000) ;
}
// ***********************************************************************

// DKA CIRCLE
function dkaCircle(loadBox){
  loadBox == 'l' ? $("#dka-circle-info").html(dka_spinner_pulse_3) : $("#dka-circle-info").html(dka_circle_info);
}
// ***********************************************************************

// ALERT
function alertDKA(alertClass){

  $(".dka-alert .dka-alert-debug p").html();

  alertClass == 'i'  ? $(".dka-alert").addClass('info')    : $(".dka-alert").removeClass('info');
  alertClass == 'w'  ? $(".dka-alert").addClass('warning') : $(".dka-alert").removeClass('warning');
  alertClass == 's'  ? $(".dka-alert").addClass('success') : $(".dka-alert").removeClass('success');

  alertClass == 'i'  ? $(".dka-alert .alert-icon").html('<i class="fa fa-info-circle fa-4x pull-left"></i>'): null ;
  alertClass == 'w'  ? $(".dka-alert .alert-icon").html('<i class="fa fa-exclamation-circle fa-4x pull-left"></i>'): null ;
  alertClass == 's'  ? $(".dka-alert .alert-icon").html('<i class="fa fa-thumbs-o-up fa-4x pull-left"></i>'): null ;

  alertClass == 'w'  ? $(".dka-alert #btn_sent_support").fadeIn() : $(".dka-alert #btn_sent_support").hide() ;

  var isVisible = $( ".dka-alert" ).is( ":visible" );
  isVisible == true ? null : $('.dka-alert').slideDown();
  $('html, body').animate({
    scrollTop: $(".dka-alert").offset().top
  }, 2000);
}
$('.dka-alert .close').click(function(){
    $('.dka-alert').slideToggle();
    $('.dka-alert-debug').slideUp();
});

$('.dka-alert .alert-icon').click(function(){
    $('.dka-alert-debug').slideToggle();
});
// ***********************************************************************

// TABS
$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
// ***********************************************************************

function dkaDefault(){
  $("#div_export_segment").hide();
  $("#export_main").html('');
  exportReload();
  dkaCartLoadData(true, 0)
}

// MAIN LOAD DATA
function dkaCartLoadData(is_default, startLimit, is_search_f){
  var arSend = [];
  if(is_search_f){
    var dka_search = $("#dka_search").val();
    if(dka_search.length < 3){ return; }else{ is_search = true; }
    is_default == true ? arSend = { 'start' : 0, 'limit' : cartLimit, 'string' : dka_search} : arSend = { 'start' : cartStart, 'limit' : cartLimit, 'string' : dka_search} ;
  }else{
    $("#dka_search").val('');
    is_search = false;
    is_default == true ? arSend = { 'start' : 0, 'limit' : cartLimit} : arSend = { 'start' : cartStart, 'limit' : cartLimit} ;
  }

  var table_height = $("#main_carts").height();

  $(".tooltip").hide();
  $("#main_carts").height(table_height);
  $("#main_reload").html('<i class="fa fa-spinner fa-pulse">');
  $("#main_carts").html('<tr class="active"><td colspan="8" class="center aligned"><i class="fa fa-spinner fa-pulse fa-5x"></td></tr>');

  urlCartLoadData = <?php echo "\"" . str_replace('&amp;', '&', $urlCartLoadData) . "\""; ?>;
  $.ajax({
    url: urlCartLoadData,
    method: 'GET',
    data: arSend,
    dataType: 'json',
    success: function(json) {
      var cartData = [];
      if(json.carts.length > 0){
        $("#div_cart button").removeClass('disabled');
        $("#pagination_info").show();

        var cart_td = 1;
        cartTotal = json.total;
        is_search_f == true ? null : cartTotalExport = json.total;

        cartStart == 0 ?  $("#btn_back").addClass('disabled') :  $("#btn_back").removeClass('disabled');
        (cartStart + json.carts.length) == cartTotal ? $("#btn_forward").addClass('disabled') : $("#btn_forward").removeClass('disabled') ;

        $("#pagination_info").html('<?php echo $text_pagi_view; ?> ' + (cartStart + 1) + ' <?php echo $text_pagi_by; ?> ' + (cartStart + json.carts.length) + ' <?php echo $text_pagi_from; ?> ' + cartTotal + ' (<?php echo $text_pagi_page; ?> ' + Math.ceil((cartTotal/cartLimit)) + ')');
        $.each(json.carts, function(key, val){
          cartData.push('<tr id=tr_cart_' + json.carts[key].cart_id + '><td>' + cart_td + '</td>\
          <td class="center aligned"><img src="' + json.carts[key].image + '"></td>\
          <td><a class="ui olive label" data-toggle="tooltip" title="<?php echo $tooltip_product; ?>" href="' + json.carts[key].product_url + '" target="_blank">' + json.carts[key].name + '</a></td>\
          <td><a class="ui blue label" data-toggle="tooltip" title="<?php echo $tooltip_user; ?>" href="' + json.carts[key].customer_url + '" target="_blank">' + json.carts[key].fio + '</a></td>\
          <td><label class="ui teal label dka-pointer" data-toggle="tooltip" title="<?php echo $tooltip_mail_user; ?>" onclick="modalMail(\'' + '\', \'' + json.carts[key].email + '\', false)">' + json.carts[key].email + '</label></td>\
          <td>' + json.carts[key].telephone + '</td>\
          <td>' + json.carts[key].date_added + '</td>\
          <td class="right aligned">\
          <a class="ui icon button" data-toggle="tooltip" title="<?php echo $tooltip_product; ?>" href="' + json.carts[key].product_url + '" target="_blank"><i class="fa fa-tags fa-fw"></i></a>\
          <a class="ui teal icon button" data-toggle="tooltip" title="<?php echo $tooltip_user; ?>" href="' + json.carts[key].customer_url + '" target="_blank"><i class="fa fa-user fa-fw"></i></a>\
          <button class="ui red icon button" data-toggle="tooltip" title="<?php echo $tooltip_delete; ?>" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? deleteCart(\'' + json.carts[key].cart_id + '\') : false;"><i class="fa fa-trash-o fa-fw"></i></button>\
          </td></tr>');
          cart_td++;
        });
      }else{
        cartData.push('<tr><td colspan="8" class="center aligned"><h2><?php echo $text_data_null; ?></h2></td></tr>');
        $("#div_cart button").addClass('disabled');
        $("#btn_export").addClass('disabled')
        $("#pagination_info").hide();
      }
      $("#main_carts").height('auto');
      $("#main_carts").html(cartData.join(''));
    },
    error: function(json) {
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_load_data_hinfo; ?></h3><p><?php echo $text_load_data_pinfo; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
      $("#main_carts").html('<tr><td colspan="8" class="center aligned"><h2><?php echo $text_load_data_hinfo; ?></h2></td></tr>');
      $("#main_carts").height('auto');
    }
  });
}
// ***********************************************************************

// Pagination
function pagiBack(){
  $(".tooltip").hide();
  startLimit = +cartStart - +cartLimit;
  cartStart = startLimit;
  is_search == false ? dkaCartLoadData(false, startLimit) : dkaCartLoadData(false, startLimit, true) ;
}

function pagiForward(){
  $(".tooltip").hide();
  startLimit = +cartStart + +cartLimit;
  cartStart = startLimit;
  is_search == false ? dkaCartLoadData(false, startLimit) : dkaCartLoadData(false, startLimit, true) ;
}
// ***********************************************************************

// Delete cart and carts
function deleteCart(cart_id){
  $(".tooltip").hide();
  urlCartDelete = <?php echo "\"" . str_replace('&amp;', '&', $urlCartDelete) . "\""; ?>;
  $.ajax({
    url: urlCartDelete,
    method: 'GET',
    data: {'cart_id' : cart_id},
    dataType: 'json',
    success: function(json) {
      if(json.result == true){ $("#tr_cart_" + cart_id).remove(); dkaCartLoadData(false, 0); }
    },
    error: function(json) {
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_del_data_hinfo; ?></h3><p><?php echo $text_del_data_pinfo; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
    }
  });
}

function deleteCarts(){
  $(".tooltip").hide();
  urlCartDelete = <?php echo "\"" . str_replace('&amp;', '&', $urlCartDelete) . "\""; ?>;
  $.ajax({
    url: urlCartDelete,
    method: 'GET',
    data: { 'clear_is' : true },
    dataType: 'json',
    success: function(json) {
      if(json.result == true){ cartTotalExport = 0; dkaCartLoadData(true, 0); }
    },
    error: function(json) {
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_del_data_hinfo; ?></h3><p><?php echo $text_del_data_pinfo; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
    }
  });
}
// ***********************************************************************

// Delete cart and carts
$( "#dka_search" ).change(function() {
  dkaCartLoadData(true, 0, true);
});
// Check update module
function dkaUpdateModule(){
  var xmlModuleUpdate = <?php echo "\"" . str_replace('&amp;', '&', $dkaModuleUpdate) . "\""; ?>;
  $("#btnUpdateSearchManual").html('<i class="fa fa-refresh fa-spin"></i> <?php echo $text_input_search; ?> ...');
	$(".search-update").hide();
	var dka_name = '<?php echo $dkaModuleNameUID; ?>';
	$.ajax({
		url: xmlModuleUpdate + '&dka_name=' + dka_name + '&dka_version=' + '<?php echo $dkaModuleMajorVersion . "." . $dkaModuleMinorVersion . "." . $dkaModuleBuildVersion; ?>',
		dataType: 'json',
		success: function(json) {
			var updateVersion = 0;
      var dkaModuleVersion = json['majorVersion'] + "." + json['minorVersion'] + "." + json['buildVersion'];
			<?php if ($dka_cart_update_modal || strlen(trim($dka_cart_update_modal)) < 1) { ?>
			if(json['fullVersion'] > '<?php echo $dkaModuleMajorVersion . $dkaModuleMinorVersion . $dkaModuleBuildVersion; ?>'){

        $("#btnUpdateSearchManual").html('<i class="fa fa-refresh"></i> <?php echo $text_update_check; ?>');
        var updateText = [];
        updateText.push("<div class='settings-content'>\
          <div class='row'>\
          <div class='col-sm-3 text-center'><img src='" + json['logo'] + "' /></div>\
          <div class='col-sm-9'>\
          <h2><i class='fa fa-refresh'></i> <?php echo $text_update_header_new; ?></h2><hr />\
          <p><?php echo $text_update_subheader_new; ?> <strong>" + json['name'] + " " + dkaModuleVersion + "</strong></p>\
          <p><?php echo $text_update_subheader_date; ?> <strong>" + json['date'] + "</strong></p>\
          </div>\
          </div>");
        if(json['info'].length > 0)
          updateText.push("<hr class='hr-dka-def' /><h4><?php echo $text_update_header_info; ?></h4><div class='row'><div class='col-sm-12'>" + json['info'] + "</div></div>");
        if(json['changelog'].length > 0)
          updateText.push("<hr class='hr-dka-def' /><h4><?php echo $text_update_header_change; ?></h4><div class='row'><div class='col-sm-12'>" + json['changelog'] + "</div></div>");
        if(json['downloadUrl'].length > 0){
          updateText.push("<hr class='hr-dka-def'  /><div class='row'><div class='col-sm-12'>\
            <p class='text-center' style='margin: 20px 0;'><a href='" + json['downloadUrl'] + "' class='alert alert-success'><?php echo $text_update_forward_load; ?></a></p>\
            </div></div>");
        }
        updateText.push("</div>");
				$('#modal_default .modal-content').html(updateText.join(''));
				$('#modal_default').modal();
        //$("#dka-circle-info").attr('title', '');
        $('#dka-circle-info').html('<i class="fa fa-refresh dka-text-c-red" title="<?php echo $text_update_header_new;?> ' + json['date'] + '" data-toggle="tooltip"> ' + dkaModuleVersion + '</i>')
      }else{
        $("#btnUpdateSearchManual").removeClass('btn-info'); $("#btnUpdateSearchManual").addClass('btn-success');
        $("#btnUpdateSearchManual").html('<i class="fa fa-refresh"></i> <?php echo $text_update_no; ?>');
      }
      if(json['news']){
				$('#modal_default .modal-content').html("<div class='settings-content'><h2 class='text-center'><i class='fa fa-refresh'></i> <?php echo $text_update_mr_client; ?></h2><p class='text-center' style='margin: 20px 0;'>" + json['addinginfo'] + "</p></div>");
				$('#modal_default').modal();
			}
      <?php } else { ?>
			if(json['fullVersion'] > '<?php echo $dkaModuleMajorVersion . $dkaModuleMinorVersion . $dkaModuleBuildVersion; ?>'){
        $("#btnUpdateSearchManual").html('<i class="fa fa-refresh"></i> <?php echo $text_update_check; ?>');
        //$("#dka-circle-info").attr('title', '');
        $('#dka-circle-info').html('<i class="fa fa-refresh dka-text-c-red" title="<?php echo $text_update_header_new;?> ' + json['date'] + '" data-toggle="tooltip"> ' + dkaModuleVersion + '</i>');
      }else{
        $("#btnUpdateSearchManual").removeClass('btn-info'); $("#btnUpdateSearchManual").addClass('btn-success');
        $("#btnUpdateSearchManual").html('<i class="fa fa-refresh"></i> <?php echo $text_update_no; ?>');
      }
      <?php } ?>

      },
      error: function(json) {
        $("#btnUpdateSearchManual").removeClass('btn-info'); $("#btnUpdateSearchManual").addClass('btn-warning');
        $("#btnUpdateSearchManual").html('<i class="fa fa-close"></i> <?php echo $text_error; ?>');
        alertDKA('w');
        $("#alert-content").html('<h3><?php echo $text_update_herror; ?></h3><p><?php echo $text_update_perror; ?></p>');
        $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
      }
	});
}
// ***********************************************************************

// Modal mail
function modalMail(type, address, support_is){
  support_is == true ? $("#mail_modal_h").html('<?php echo $text_mail_support_header; ?>') : $("#mail_modal_h").html('<?php echo $text_mail_header; ?>') ;
  $("#input_answer_copy").val($("#input_answer").val());
  if(support_is){
    $("#input_subject").val('<?php echo $text_mail_support_subject_send; ?> <?php echo $dkaModuleName . " " . $dkaModuleMajorVersion . "." . $dkaModuleMinorVersion . "." . $dkaModuleBuildVersion; ?>');
  }else{
    $("#input_subject").val('<?php echo $text_mail_subject_send; ?>');
  }
  var mail_info = '';
  if(type == 'w'){ mail_info = '<br /><br />' + $(".dka-alert .dka-alert-debug p").html(); }

  support_is == true ? $('#input_message').code('<?php echo $text_mail_modal_message_url; ?> ' + mail_info) : $('#input_message').code('') ;
  support_is == true ? $('#email_send').val('support@dreamclever.ru') : $('#email_send').val(address) ;
  support_is == true ? $('#mail_address').val('support@dreamclever.ru') : $('#mail_address').val(address) ;

  $('#button_send').show();
  $("#modal_mail").modal();
}

function mailSend(){
  var urlMailSend = <?php echo "\"" . str_replace('&amp;', '&', $urlMailSend) . "\""; ?>;
  // Summer not fix
	$('textarea[name=\'message\']').val($('#input_message').code());
  $.ajax({
      url: urlMailSend,
      dataType: 'json',
      method: 'POST',
      data: $("#form_mail").serialize(),
      beforeSend: function() {
			  $('#button_send').fadeOut();
        $("#mail_modal_h").html('<?php echo $text_mail_modal_header_forward; ?>');
		  },
      success: function(json) {
        if(json.success){ $("#mail_modal_h").html('<?php echo $text_mail_modal_header_send; ?>');
        }else{ $("#mail_modal_h").html('<?php echo $text_mail_modal_header_error; ?>'); }
      },
      error: function(json) {
        alertDKA('w');
        $("#alert-content").html('<h3><?php echo $text_mail_herror; ?></h3><p><?php echo $text_mail_perror; ?></p>');
        $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
      }
  });
}
// ***********************************************************************

//
function exportCarts(){
  $(".tooltip").hide();
  exportProcent = 0;
  dkaTopProgress('p');
  $("#div_export_segment").show();
  $("#btn_export").addClass('loading disabled');
  $( '#circle_progress' ).progressCircle({ nPercent : exportProcent, showPercentText : true, circleSize : 160, thickness : 4 });
  exportHead();
  cartTotalQeueu = Math.ceil(cartTotalExport/exportLimit);
  setTimeout(exportSend() ,400);
}

// EXPORT AT FILES
var exportFiles = [];
var htmlExportT_head = '<thead><tr><th><i class="fa fa-sort-amount-asc"> №</i></th><th><i class="fa fa-pencil"> <?php echo $text_export_th_name; ?></i></th><th>\
                        <i class="fa fa-bars pull-right"> <?php echo $text_export_th_count; ?></i></th>\
						            <th><i class="fa fa-file-excel-o pull-right"> <?php echo $text_export_th_size; ?>\
                        </i></th><th><i class="fa fa-download pull-right"> <?php echo $text_export_th_download; ?></i></th>\
        				        </tr></thead>';
function exportHead(){
	arExportHead.push('<div id="export_finish_header">\
        					   <div class="row"><div class="col-sm-9"><i class="fa fa-refresh fa-2x pull-left dka-text-c-green text-uppercase">\
                     <?php echo $text_export_h_base; ?>...</i></div></div>\
        					   </div><div id="export-current-file"></div>\
					           <hr />\
				             <table class="table table-bordered table-hover" id="dka-export-table">' + htmlExportT_head + '\
      					    <tbody id="export_div">');
  arExportHead.push("</tbody></table>");
	$("#export_main").html(arExportHead.join(''));
}

var idSend = 1; // id operation (file end)
function exportSend(){

  urlExportCart = <?php echo "\"" . str_replace('&amp;', '&', $urlExportCart) . "\""; ?>;
  ajaxExport = $.ajax({
    url: urlExportCart + "&start=" + exportStart + "&limit=" + exportLimit + "&id=" + idSend,
    dataType: 'json',
    method: 'POST',
    success: function(json) {
      if(!json.error){
        arExport.push('<tr>\
          <th scope="row">' + idSend + '</th>\
          <th scope="row">' + json.name + '</th>\
          <th><span class="pull-right">' + json.count + '</span></th>\
          <th><span class="pull-right">' + json.size + '</span></th>\
          <th><a href="' + json.link + '" target="_blank" class="btn btn-success pull-right"><i class="fa fa-floppy-o"></i></a></th>\
          </tr>');
        exportFiles.push(json.name);
        exportFiles.join(',');

        startLimit = +exportStart + +exportLimit;
        exportStart = startLimit;
        $("#export_div tr").length > 0 ? $("#export_div tr").last().after(arExport.join('')) : $("#export_div").html(arExport.join('')) ;
        arExport = [];

        if(cartTotalQeueu > idSend){
          exportProcent = (idSend/cartTotalQeueu)*100;
          $("#export-current-file").html('<small><?php echo $text_export_t_files; ?>: </small>' + idSend);
          $( '#circle_progress' ).progressCircle({ nPercent : Math.round(exportProcent), showPercentText : true, circleSize : 160, thickness : 4 });
        }else{
          $("#btn_export").removeClass('loading disabled');
          $("#export-current-file").html('<small><?php echo $text_export_t_files; ?>: </small>' + idSend);
          exportProcent = 100;
          $( '#circle_progress' ).progressCircle({ nPercent : Math.round(exportProcent), showPercentText : true, circleSize : 160, thickness : 4 });
          dkaTopProgress('');
          $("#export_finish_header").html('<div class="row"><div class="col-sm-9"><i class="fa fa-bell-o fa-2x pull-left dka-text-c-gold text-uppercase">\
            <?php echo $text_export . " " . $text_finished; ?></i></div>\
            <div class="col-sm-3"><button type="button" id="create-arhive" class="btn btn-warning pull-right" onclick="exportToZip();">\
            <i class="fa fa-inbox"></i> <?php echo $text_export_t_all_load; ?></button></div></div>');
        }
        idSend++;

        cartTotalQeueu <= idSend ? exportReload() : null ;

      }else{
        $("#dka-export-progress").html('');
        $("#dka-export-table").html('');

        $("#export_finish_header").html('<?php echo $text_export_t_atbase; ?> <span class="text-lowercase"> <?php echo $text_empty; ?></span>');
      }
    },
    error: function(json) {
      dkaTopProgress('');
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_export_herror; ?></h3><p><?php echo $text_export_perror; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
    }
  });
}
// ***********************************************************************

// EXPORT FILES TO ZIP
function exportToZip() {
  filesToZip = <?php echo "\"" . str_replace('&amp;', '&', $filesToZip) . "\""; ?>;
  $("#create-arhive").html('<i class="fa fa-refresh"></i> <?php echo $text_arhive_process; ?>...');
  $.ajax({
    url: filesToZip,
    dataType: 'json',
    method: 'POST',
    data: { files : exportFiles },
    success: function(json) {
      if((json.file_info.name).length > 0){
				$("#export_finish_header").html('<div class="row"><div class="col-sm-9"><i class="fa fa-bell-o fa-2x pull-left dka-text-c-gold text-uppercase">\
          <?php echo $text_export . " " . $text_finished; ?></i></div>\
          <div class="col-sm-3"><a class="btn btn-success pull-right" href="' + json.file_info.link + '" target="_blank">\
          <i class="fa fa-file-archive-o"></i> <?php echo $text_download; ?> (' + json.file_info.size + ')</a></div></div>');
      }else{
        $("#alert-content").html('<h3><?php echo $text_export_zip_herror; ?></h3><p><?php echo $text_export_zip_perror; ?></p>');
        alertDKA('i');
      }
    },
    error: function(json) {
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_export_zip_herror; ?></h3><p><?php echo $text_export_zip_perror; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
    }
  });
}
// ***********************************************************************

// NO SHOW
function dkaNoShow(){
  urlNoShow = <?php echo "\"" . str_replace('&amp;', '&', $urlNoShow) . "\""; ?>;
  $.ajax({
    url: urlNoShow,
    dataType: 'json',
    method: 'POST',
    data: { 'dka_cart_startup_noshow' : 0 },
    success: function(json) {
      $("#modal_startup").modal('hide');
    },
    error: function(json) {
      $("#modal_startup").modal('hide');
      alertDKA('w');
      $("#alert-content").html('<h3><?php echo $text_noshow_herror; ?></h3><p><?php echo $text_noshow_perror; ?></p>');
      $(".dka-alert .dka-alert-debug p").html('<?php echo $text_error; ?>: ' + json.responseText);
    }
  });
}
</script>
<?php echo $footer; ?>
