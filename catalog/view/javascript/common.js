function getURLVar(key) {
    var value = [];
    var query = String(document.location).split('?');
    if (query[1]) {
        var part = query[1].split('&');
        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');
            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }
        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}
function getPoint(id) {
    $.ajax({
        url: 'index.php?route=checkout/checkout/getPoints',
        data: {'id': id},
        method: 'POST',
        success: function (data) {
            var options = '';
            $("#input-point-new-post").children().remove().end();
            $.each($.parseJSON(data), function (index, value) {
                // console.log(value);
                options += '<option value="' + value['name'] + '">' + value['name'] + '</option>';
                // console.log(value['country_id'] + ' ' + value['name']);
            });
            $("#input-point-new-post").html(options);
            setTimeout(function () {
                $('#input-point-new-post').trigger('refresh');
            }, 1);
        }
    });
}
$(document).ready(function () {
    $(".new_post_delivery_form").hide();
    $("input[type=phone]").mask("(999) 999-99-99");
    $('.pay-popup').on('click', function () {
        $('.delivery-pay-popup').load('index.php?route=information/information/agree&information_id=7')
    });
    $('.user-panel').hover(function () {
        if ($(this).hasClass('first-login')) {
            $.ajax({
                url: 'index.php?route=account/login/new_login', success: function (data) {
                    $('.user-forms-login').html(data);
                }
            });
            $(".authorization").addClass("active");
            $(this).removeClass('first-login');
        }
    });
    $('.links-change').click(function () {
        $('.links-change').removeClass("active");
        if ($(this).hasClass("first-register") && $(".user-forms-login div").hasClass("login-field")) {
            $('.user-forms-register').load('index.php?route=account/register');
            $('.user-forms-login').hide();
            $('.user-forms-register').show();
            $(this).removeClass('first-register');
            $(this).addClass('registration');
            $(this).addClass("active");
        } else if ($(this).hasClass("authorization") && $(".user-forms-register div").hasClass("register-field")) {
            $('.user-forms-login').show();
            $('.user-forms-register').hide();
            $(this).addClass("active");
        } else if ($(this).hasClass("registration") && $(".user-forms-login div").hasClass("login-field")) {
            $('.user-forms-login').hide();
            $('.user-forms-register').show();
            $(this).addClass("active");
        }
    });
    $(".load-register").click(function () {
        $('.user-forms-register-page').load('index.php?route=account/register');
        $(this).hide();
    })
    $('.user-panel, .link-close-btn').click(function (e) {
        var $loginForm = $('.user-forms-login');
        $loginForm.parent().toggle();
        $loginForm.show();
    });
    setInterval(function () {
        var sliderHeight = $(".camera_wrap").height();
        $("#column-left").css("height", sliderHeight);
        $("#column-right").css("height", sliderHeight);
    }, 100);
    $(".slick-slider").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [{breakpoint: 768, settings: {slidesToShow: 2, slidesToScroll: 1}}, {
            breakpoint: 480,
            settings: {slidesToShow: 1, slidesToScroll: 1}
        }]
    });
    cols1 = $('#column-right, #column-left').length;
    $('.text-danger').each(function () {
        var element = $(this).parent().parent();
        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });
    $('#currency .currency-select').on('click', function (e) {
        e.preventDefault();
        $('#currency input[name=\'code\']').attr('value', $(this).attr('name'));
        $('#currency').submit();
    });
    $('#language a').on('click', function (e) {
        e.preventDefault();
        $('#language input[name=\'code\']').attr('value', $(this).attr('href'));
        $('#language').submit();
    });
    $('#search input[name=\'search\']').parent().find('button').on('click', function () {
        url = $('base').attr('href') + 'search';
        var value = $('input[name=\'search\']').val();
        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }
        location = url;
    });
    $('#search input[name=\'search\']').on('keydown', function (e) {
        if (e.keyCode == 13) {
            $('input[name=\'search\']').parent().find('button').trigger('click');
        }
    });
    $('#list-view').click(function () {
        $('#content .product-layout > .clearfix').remove();
        $(this).parent().find('button').removeClass('active');
        $(this).addClass('active');
        $('#content .product-layout').attr('class', 'product-layout product-list col-sm-12 col-xs-6 col-xxs-12-480');
        localStorage.setItem('display', 'list');
    });
    $('#grid-view').click(function () {
        $('#content .product-layout > .clearfix').remove();
        $(this).parent().find('button').removeClass('active');
        $(this).addClass('active');
        cols = $('#column-right, #column-left').length;
        if (cols == 2) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
        } else if (cols == 1) {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
        } else {
            $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
        }
        localStorage.setItem('display', 'grid');
    });
    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
    } else {
        $('#grid-view').trigger('click');
    }
    $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    $(document).ajaxStop(function () {
        $('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
    });
});
var cart = {
    'add': function (product_id, quantity, el) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            success: function (json) {
                $('.alert, .text-danger').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['success']) {
                    if (typeof(el) != 'undefined' && $(window).width() > 768) {
                        const container = $(el).closest('.product-thumb').parent('div');
                        const target = container.find('.tooltips button:first');
                        const offset_right = $(window).width() - $(target).offset().left + $(target).width();
                        var pos = offset_right < 380 ? 'left top' : 'right top';
                        const parent_container = container.closest('.slick-track');
                        const index = parent_container.find('.slick-active').index(container);
                        if ($(window).width() > 992 && index > 2) {
                            pos = 'left top';
                        } else if (index > 1) {
                            pos = 'left top';
                        }
                        container.notify({text: json['success']}, {
                            style: 'success',
                            className: 'styled',
                            position: pos
                        })
                    }
                    if ("https://" + location.hostname + "/" == location.href) {
                        $("div.alert").css({"width": "70%", "float": "right"});
                    }
                    $('#cart-total').html(json['total']);
                    $('#cart> ul').load('index.php?route=common/cart/info ul li');
                    $('#cart > button').removeClass('btn');
                    $('#cart > button').addClass('btn-full');
                    $('#cart').addClass("open");
                    $('#cart .dropdown-menu').css({"opacity": "1"});
                    setTimeout(function () {
                        $('#cart .dropdown-menu').animate({opacity: 0}, 1000, function () {
                            $('#cart').removeClass("open");
                            $('#cart .dropdown-menu').css({"opacity": "1"});
                        });
                    }, 3000);
                }
            }
        });
    }, 'update': function (key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            success: function (json) {
                $('#cart-total').html(json['total']);
                if (location.pathname == '/shopping-cart' || location.pathname == '/checkout') {
                    location = location.pathname;
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }, 'remove': function (key, product) {
        if (typeof product != "undefined") {
            console.log('/* Событие removeFromCart для Enhanced ecommerce */');
            EEProcessor.removeFromCart([product]);
        }
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            success: function (json) {
                console.log(json);
                $('#cart-total').html(json['total']);

                if(!json['total_discount'] || json['total_discount'] === 0){
                    $('#discount-row').remove();
                }else{ищу
                    $('.total-discount').html(json['total_discount'] + ' грн');
                }
                if (location.pathname == '/shopping-cart') {
                    location = location.pathname;
                } else if (location.pathname == '/checkout') {
                    $('.total-total').html(json['total'].replace(/(.*\()|(\).*)/g, ''));
                }
                {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
                if (json.total_products == 0) {
                    $('#cart > button').removeClass('btn-full');
                    $('#cart > button').addClass('btn');
                }
            }
        });
    }
}
var voucher = {
    'add': function () {
    }, 'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            success: function (json) {
                $('#cart-total').html(json['total']);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    }
}
var wishlist = {
    'add': function (product_id, el) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();
                console.log(json);
                if (json['success']) {
                    var isProductPage = $(el).closest('.product-to-do').length > 0 ? true : false;
                    if (isProductPage) {
                        $(el).notify({text: json['success']}, {
                            style: 'success',
                            className: 'styled',
                            position: 'right top'
                        })
                        $('.notifyjs-container').css('top', '-20px');
                        $('.notifyjs-arrow').css('top', '4px');
                    } else {
                        if (typeof(el) != 'undefined' && $(window).width() > 768) {
                            const offset_right = $(window).width() - $(el).offset().left + $(el).width();
                            var pos = offset_right < 380 ? 'left top' : 'right top';
                            const container = $(el).closest('.product-thumb').parent('div');
                            const parent_container = container.closest('.slick-track');
                            const index = parent_container.find('.slick-active').index(container);
                            if (index > 2) {
                                pos = 'left top';
                            }
                            $(container).notify({text: json['success']}, {
                                style: 'success',
                                className: 'styled',
                                position: pos
                            })
                        }
                    }
                    $('#wishlist-total span').text(json['total']);
                }
                if (json['info']) {
                    var isProductPage = $(el).closest('.product-to-do').length > 0 ? true : false;
                    if (isProductPage) {
                        $(el).notify({text: json['info']}, {style: 'error', className: 'styled', position: 'right top'})
                        $('.notifyjs-container').css('top', '-20px');
                        $('.notifyjs-arrow').css('top', '4px');
                    } else {
                        if (typeof(el) != 'undefined' && $(window).width() > 768) {
                            const offset_right = $(window).width() - $(el).offset().left + $(el).width();
                            var pos = offset_right < 380 ? 'left top' : 'right top';
                            const container = $(el).closest('.product-thumb').parent('div');
                            const parent_container = container.closest('.slick-track');
                            const index = parent_container.find('.slick-active').index(container);
                            if (index > 2) {
                                pos = 'left top';
                            }
                            $(container).notify({text: json['info']}, {
                                style: 'error',
                                className: 'styled',
                                position: pos
                            })
                        }
                    }
                }
            }
        });
    }, 'remove': function () {
    }
}
var compare = {
    'add': function (product_id, el) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();
                if (json['success']) {
                    $('#wishlist-popup .modal-product').html(json['success']);
                    $('#wishlist-popup').show();
                    $(el).html('<i class="fa fa-check-square"></i>');
                    $('#compare-total-count').html('<span class="hidden-xs hidden-sm hidden-md">' + json['total'] + '</span>');
                    $('#compare-total-count span').before('<i class="fa fa-exchange"></i>');
                }
            }
        });
    }, 'remove': function () {
    }
}
$.notify.addStyle('success', {
    html: '<div class="alert alert-success"><i class="fa fa-check-circle" style="margin-right:4px"></i>&nbsp;<p style="display:inline" data-notify-html="text"></p></div>',
    classes: {
        styled: {
            "background-color": "#ffe5d5",
            "border": "2px solid #f6b283",
            "border-radius": "8px",
            "width": $(window).width() < 992 ? "200px" : "280px",
            "height": "100% !important",
            "padding": "20px",
            "line-height": "26px",
            "font-size": "14px",
            "color": "#6b6a6a",
            "white-space": "normal !important"
        }
    }
});
$.notify.addStyle('error', {
    html: '<div class="alert alert-success"><i class="fa fa-info-circle" style="margin-right:4px"></i>&nbsp;<p style="display:inline" data-notify-html="text"></p></div>',
    classes: {
        styled: {
            "background-color": "#ffe5d5",
            "border": "2px solid #f6b283",
            "border-radius": "8px",
            "width": $(window).width() < 992 ? "200px" : "280px",
            "height": "100% !important",
            "padding": "20px",
            "line-height": "26px",
            "font-size": "14px",
            "color": "#6b6a6a",
            "white-space": "normal !important"
        }
    }
});
$.notify.defaults({
    clickToHide: true,
    arrowShow: false,
    autoHide: true,
    autoHideDelay: 3000,
    showDuration: 20,
    hideDuration: 20,
    arrowShow: true,
    arrowSize: 15,
    showAnimation: 'slideDown',
    showDuration: 400,
});
$('.category-products .add-to-cart').on('click', function () {
    $(this).hide();
    $(this).next().show();
})
function popUpHide() {
    $("#wishlist-popup").hide();
    $('body').removeClass('modal-open');
}
$('.modal-popup, .modal-close').on('click', function () {
    popUpHide();
});
$('.modal-popup-content').on('click', function (e) {
    e.stopPropagation();
});
$(document).delegate('.agree', 'click', function (e) {
    e.preventDefault();
    $('#modal-agree').remove();
    var element = this;
    $.ajax({
        url: $(element).attr('href'), type: 'get', dataType: 'html', success: function (data) {
            html = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';
            $('body').append(html);
            $('#modal-agree').modal('show');
        }
    });
});
(function ($) {
    $.fn.autocomplete = function (option) {
        return this.each(function () {
            this.timer = null;
            this.items = new Array();
            $.extend(this, option);
            $(this).attr('autocomplete', 'off');
            $(this).on('focus', function () {
                this.request();
            });
            $(this).on('blur', function () {
                setTimeout(function (object) {
                    object.hide();
                }, 200, this);
            });
            $(this).on('keydown', function (event) {
                switch (event.keyCode) {
                    case 27:
                        this.hide();
                        break;
                    default:
                        this.request();
                        break;
                }
            });
            this.click = function (event) {
                event.preventDefault();
                value = $(event.target).parent().attr('data-value');
                if (value && this.items[value]) {
                    this.select(this.items[value]);
                }
            }
            this.show = function () {
                var pos = $(this).position();
                $(this).siblings('ul.dropdown-menu').css({top: pos.top + $(this).outerHeight(), left: pos.left});
                $(this).siblings('ul.dropdown-menu').show();
            }
            this.hide = function () {
                $(this).siblings('ul.dropdown-menu').hide();
            }
            this.request = function () {
                clearTimeout(this.timer);
                this.timer = setTimeout(function (object) {
                    object.source($(object).val(), $.proxy(object.response, object));
                }, 200, this);
            }
            this.response = function (json) {
                html = '';
                if (json.length) {
                    for (i = 0; i < json.length; i++) {
                        this.items[json[i]['value']] = json[i];
                    }
                    for (i = 0; i < json.length; i++) {
                        if (!json[i]['category']) {
                            html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
                        }
                    }
                    var category = new Array();
                    for (i = 0; i < json.length; i++) {
                        if (json[i]['category']) {
                            if (!category[json[i]['category']]) {
                                category[json[i]['category']] = new Array();
                                category[json[i]['category']]['name'] = json[i]['category'];
                                category[json[i]['category']]['item'] = new Array();
                            }
                            category[json[i]['category']]['item'].push(json[i]);
                        }
                    }
                    for (i in category) {
                        html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
                        for (j = 0; j < category[i]['item'].length; j++) {
                            html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
                        }
                    }
                }
                if (html) {
                    this.show();
                } else {
                    this.hide();
                }
                $(this).siblings('ul.dropdown-menu').html(html);
            }
            $(this).after('<ul class="dropdown-menu"></ul>');
            $(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
        });
    };
})(window.jQuery);

if ($('.modal-wrap').is(':visible')){
    $('body').click(function(evt){
        if(!$(evt.target).is('.modal-wrap') && !$(evt.target).is('.buy-1-click')) {
            $('.modal-wrap').hide();
        }
    });
}

// $(document).ready(function(){
//     $(window).load(function() {
//         if(window.location.pathname === '/checkout'){
//             $('#bingc-phone-button').css('display', 'none');
//         }
//     });
// });