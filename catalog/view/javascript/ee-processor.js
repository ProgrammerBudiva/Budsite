/* Enhanced e-commerce */
EEProcessor = {

    _log: function (data) {
        console.log(data);
    },

    /**
     * @param {Array} products
     *
     * Объект product состоит из таких полей (как правило, отличия в position, list, quantity)
     * name
     * id
     * price
     * brand
     * category
     *
     * + list - тип страницы, на которой произошел клик по товару
     * + position
     */
    productImpressions: function (products) {
        this._log({'productImpressions': products});

        dataLayer.push({
            'ecommerce': {
                'currencyCode': 'UAH',
                'impressions': products
            },
            'event': "productImpression"
        });
    },

    /**
     * Просмотр страницы товара
     * @param {Array} products
     */
    productDetails: function(products){
        this._log({'productDetails': products});

        var productList = '-';
        if (typeof products[0].list !== "undefined") {
            productList = products[0].list;
        }

        dataLayer.push({
            'ecommerce': {
                'detail': {
                    'actionField': {'list': productList},
                    'products': products
                }
            },
            'event': "productDetails"
        });
    },


    /**
     * @param {Array} products
     * @param {string} url Колбек-ссылка для перехода в товар, по которому прошёл клик
     * (след-но, нужно по клику на товар вызвать только эту функцию, сделав preventDefault())
     * + list
     */
    productClick: function (products, url) {
        this._log({'productClick': products});
        dataLayer.push({
            'event': 'productClick',
            'ecommerce': {
                'click': {
                    'actionField': {'list': products[0].list},      // Optional list property.
                    'products': products
                }
            },
            'eventCallback': function() {
                document.location = url
            }
        });

        /* Если используется блокировщик GTM скрипта не препятствуем переходу */
        if (typeof google_tag_manager == "undefined") {
            document.location = url;
        }
    },

    /**
     * @param {Array} products
     * + quantity
     */
    addToCart: function (products) {
        this._log({'addToCart': products});

        dataLayer.push({
            'event': 'addToCart',
            'ecommerce': {
                'currencyCode': 'UAH',
                'add': {                                // 'add' actionFieldObject measures.
                    'actionField': {'list': products[0].list},      // Optional list property.
                    'products': products
                }
            }
        });
    },

    /**
     * @param {Array} products
     */
    removeFromCart: function (products) {
        this._log({'removeFromCart': products});

        dataLayer.push({
            'event': 'removeFromCart',
            'ecommerce': {
                'remove': {                               // 'remove' actionFieldObject measures.
                    'products': products
                }
            }
        });
    },

    /**
     * @param {Array} promotions
     */
    promotionImpressions: function (promotions) {
        this._log({'promotionImpressions': promotions});

        dataLayer.push({
            'ecommerce': {
                'promoView': {
                    'promotions': promotions
                }
            },
            event: "promoImpression"
        });
    },

    /**
     * @param {Array} promotions
     * @param url
     */
    promotionClicks: function (promotions, url) {
        this._log({'promotionClicks': promotions});

        dataLayer.push({
            'event': 'promotionClick',
            'ecommerce': {
                'promoClick': {
                    'promotions': promotions
                }
            },
            'eventCallback': function () {
                document.location = url;
            }
        });

        /* Если используется блокировщик GTM скрипта не препятствуем переходу */
        if (typeof google_tag_manager == "undefined") {
            document.location = url;
        }
    },

    /**
     * @param {Array} products
     * @param {string} url
     */
    cartEnter: function(products, url){
        this._log({'cartEnter': products});

        this.checkoutSteps(1, 'cart_page_open', products);

        dataLayer.push({
            'event': 'checkout',
            'ecommerce': {
                'checkout': {
                    'products': products
                }
            },
            'eventCallback': function() {
                document.location = url;
            }
        });

        if (typeof google_tag_manager == "undefined") {
            document.location = url;
        }
    },

    /**
     * @param {string} step
     * @param {string} optionVal
     * @param {string} url Опционально (если нужен переход)
     */
    checkoutOption: function (step, optionVal, url) {
        this._log({'checkoutOption': [step, optionVal]});

        var data = {
            'event': 'checkoutOption',
            'ecommerce': {
                'checkout_option': {
                    'actionField': {'step': step, 'option': optionVal}
                }
            }
        };

        if (typeof url != "undefined") {
            data.eventCallback = function () {
                document.location = url;
            };

            setTimeout(function(){
                if (typeof google_tag_manager == "undefined") {
                    document.location = url;
                }
            },100);
        }

        dataLayer.push(data);
    },

    /**
     * @param {string} step
     * @param {string} optionVal
     * @param {Array} products
     * @param {string} url Опционально (если нужен переход)
     */
    checkoutSteps: function (step, optionVal, products, url) {
        this._log({'checkoutSteps': [step, optionVal]});

        var data = {
            'event': 'checkout',
            'ecommerce': {
                'checkout': {
                    'actionField': {'step': step, 'option': optionVal},
                    'products': products
                }
            }
        };

        if (typeof url != "undefined") {
            data.eventCallback = function () {
                document.location = url;
            };

            setTimeout(function(){
                if (typeof google_tag_manager == "undefined") {
                    document.location = url;
                }
            },100);
        }

        dataLayer.push(data);
    }
};

/* Общие для всего сайта события */
$(function(){

    /* Переход в корзину */
    $('body').on('click', 'a[href$="shopping-cart"], button[data-link$="shopping-cart"]', function (e) {
        e.preventDefault();
        var $this = $(this);

        /* Получим ссылку в зависимости от элемента, на котором был клик */
        var link = '';
        switch ($this.prop('nodeName')) {
            case 'BUTTON':
                link = $this.data('link');
                break;
            case 'A':
                link = $this.attr('href');
                break;
        }

        var $cartContainer = $('#cart');
        var products = [];
        $cartContainer.find('meta[data-type="product-info"]').each(function () {
            products.push(JSON.parse($(this).attr('content')));
        });
        EEProcessor.cartEnter(products, link);
    });

    /* Первый переход на страницу чекаута */
    $('body').on('click', 'a[href$="checkout"], button[data-link$="checkout"]', function (e) {
        e.preventDefault();
        var $this = $(this);

        /* Получим ссылку в зависимости от элемента, на котором был клик */
        var link = '';
        switch ($this.prop('nodeName')) {
            case 'BUTTON':
                link = $this.data('link');
                break;
            case 'A':
                link = $this.attr('href');
                break;
        }

        var $cartContainer = $('#cart');
        var products = [];
        $cartContainer.find('meta[data-type="product-info"]').each(function () {
            products.push(JSON.parse($(this).attr('content')));
        });

        EEProcessor.checkoutSteps(1, 'cart_page_open', products);   // решили не пропускать 1й шаг, потому вызываем его здесь
        EEProcessor.checkoutSteps(2, 'first_checkout_page_open', products, link);
    });

});