window.fbAsyncInit = function () {
    FB.init({
        appId: '1060067031013824',
        cookie: true,
        xfbml: true,
        version: 'v5.0'
    });

    FB.AppEvents.logPageView();

};

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

(function ($) {
    "use strict";
    /*----------------------------
     wow js active
    ------------------------------ */
    new WOW().init();

    /*----------------------------
     owl active
    ------------------------------ */
    $(".new-trend-list").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 3,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });
    /*----------------------------
     Featured Product List owl active
    ------------------------------ */
    $(".featured-product-list").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });
    /*----------------------------
     Featured Product List owl active
    ------------------------------ */
    $(".related-product").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
    Testimonial list owl active
    ------------------------------ */
    $(".testimonial-list").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 1,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='flaticon-arrows'></i>", "<i class='flaticon-arrows-1'></i>"],
        itemsDesktop: [1199, 1],
        itemsDesktopSmall: [991, 1],
        itemsTablet: [767, 1],
        itemsMobile: [479, 1],
    });

    /*----------------------------
    Blog list owl active
    ------------------------------ */
    $(".blog-list").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });
    /*----------------------------
    Blog list owl active
    ------------------------------ */
    $(".team-list").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     Banner List owl active
    ------------------------------ */
    $(".banner-listjkdl").owlCarousel({
        autoPlay: true,
        slideSpeed: 2000,
        pagination: false,
        navigation: false,
        items: 3,
        /* transitionStyle : "fade", */    /* [This code for animation ] */
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [479, 1],
    });
    /*---------------------
     2. CounterUp
    --------------------- */
    $('.counter').counterUp({
        delay: 50,
        time: 3000
    });

    /*---------------------
     countdown
    --------------------- */
    $('[data-countdown]').each(function () {
        var $this = $(this), finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function (event) {
            $this.html(event.strftime('<span class="cdown days"><span class="time-count">%-D</span> <p>Days</p></span> <span class="cdown hour"><span class="time-count">%-H</span> <p>Hour</p></span> <span class="cdown minutes"><span class="time-count">%M</span> <p>Min</p></span> <span class="cdown second"> <span><span class="time-count">%S</span> <p>Sec</p></span>'));
        });
    });
    /*--------------------------
        scrollUp
    ---------------------------- */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });
    /*----------------------------
     price-slider active
    ------------------------------ */
    $("#slider-range").slider({
        range: true,
        // min: minPriceInRupees,
        // max: maxPriceInRupees,
        // values: [currentMinValue, currentMaxValue],
        slide: function (event, ui) {
            $("#amount").val(showPrice(ui.values[0]) + "VND" + " - " + showPrice(ui.values[1]) + "VND");
        }
    });
    $("#amount").val($("#slider-range").slider("values", 0) + "VND" +
        " - " + $("#slider-range").slider("values", 1) + "VND");
    /*----------------------------------
     Create an account toggle function
     ----------------------------------*/
    $('#ship-box').on('click', function () {
        $('#ship-box-info').slideToggle(1000);
    });

    /*--------------------------------
        Create an account toggle function
    ---------------------------------*/
    $('#cbox').on('click', function () {
        $('#cbox_info').slideToggle(900);
    });

    /*---------------------
        venobox
    --------------------- */
    $('.venobox').venobox();


    /*----------------------------
        Input Plus Minus Button
    ------------------------------ */
    $(".cart-plus-minus").append('<div class="dec qtybutton">-</div><div class="inc qtybutton">+</div>');
    $(".qtybutton").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() == "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find("input").val(newVal);
    });

    /*---------------------
     Faq page Accrodian
    --------------------- */
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).parent().find(".fa-plus-square").removeClass("fa-plus-square").addClass("fa-minus-square");
    }).on('hidden.bs.collapse', function () {
        $(this).parent().find(".fa-minus-square").removeClass("fa-minus-square").addClass("fa-plus-square");
    });
    /*----------------------------
        jQuery MeanMenu
    ------------------------------ */
    jQuery('nav#dropdown').meanmenu();

})(jQuery);


// kingtxx98
function shortOfTitleCart(name) {
    return (name.length > 9 && name.substring(0, 10) + "..." || name);
}

function showPrice(price) {
    if (Math.floor(parseInt(price) / 1000) == 0) return price;
    return showPrice(Math.floor(parseInt(price) / 1000)) + "." + price.toString().substring(price.toString().length - 3);
}

function toNumberFromVND(price) {
    return price.replace(/[.\s]/g, '')

}

function showSnackbar(mess) {
    var x = $("#snackbar")
    x.text(mess);
    x.addClass("show");
    setTimeout(function () {
        x.removeClass("show");
    }, 2000);
}


function changeQuantityProduct(flag, id) {
    var selector = "#touch" + id;
    if ($(selector).val() == 1 && flag == -1) {
        return
    } else
        $.ajax({
            type: "POST",
            url: "/cart-update",   // this is my servlet
            data: {"flag": flag, "bookID": id},
            success: function (data) {
                var respon = $.parseJSON(data);
                console.log(respon.price + "đ");
                $('#giatamtinh,#thanhtien').text(respon.price + JSON.parse(JSON.stringify("đ")));
                $(selector).val((parseInt($(selector).val()) + flag));
                changeCounterCart(flag);
            }
        });
}

function changeCounterCart(flag) {
    var counter = $("#shopping-cart-counter");
    counter.text(parseInt(counter.text()) + flag);
}

function removeCartProduct(id) {
    $.ajax({
        type: "POST",
        url: "/DelProduct",   // this is my servlet
        data: {"bookID": id},
        success: function (data) {
            if (data == "true") {
                decreaseCounterCart(id);
                $("#cartproductid" + id).remove();
            }
        }
    });
}


function addToCard(id, quantity) {
    $.ajax({
        type: "POST",
        url: "/add-cart",   // this is my servlet
        data: {"bookID": id, "quantity": quantity},
        success: function (data) {
            increaseCounterCart(quantity);
            addHTMLproductCart(data);
            $('html,body').animate({scrollTop: 0}, 300);
            showSnackbar("Adding cart successfully");
        }
    });
}


function increaseCounterCart(quantity) {
    var counter = $("#shopping-cart-counter");
    counter.text(parseInt(counter.text()) + parseInt(quantity));
}

function decreaseCounterCart(id) {
    var currentQuantity = $("#quantity-id" + id).text();
    var counter = $("#shopping-cart-counter");
    counter.text(parseInt(counter.text()) - currentQuantity);
}

function decrease1CounterCart() {
    var counter = $("#shopping-cart-counter");
    counter.text(parseInt(counter.text()) - 1);
}

function addHTMLproductCart(data) {

    var datajson = $.parseJSON(data);
    var bookItem = datajson.book;
    var $cartItem = "#cartproductid" + bookItem.id;
    if ($($cartItem).length) {
        var selector = $("#quantity-id" + bookItem.id);
        var quan = selector.text();
        var newQuan = parseInt(quan) + bookItem.quantity;
        selector.text(newQuan);
    } else {
        var html = "<div class=\"cart-product\" id=\"cartproductid" + bookItem.id + "\">\n" +
            "                                    <div class=\"cart-product-image\">\n" +
            "                                        <a href=\"single-product.jsp\">\n" +
            "                                            <img src=\"/public/customer/img/shop/images/" + bookItem.img +
            "\" alt=\"\">\n" +
            "                                        </a>\n" +
            "                                    </div>\n" +
            "                                    <div class=\"cart-product-info\">\n" +
            "                                        <p>\n" +
            "                                            <span id=\"quantity-id" + bookItem.id + "\">" + bookItem.quantity +
            "</span>\n" +
            "                                            x\n" +
            "                                            <a href=\"localhost:8080/single-product?id=" + bookItem.id + "\">" + shortOfTitleCart(bookItem.title) +
            "\n" +
            "                                            </a>\n" +
            "                                        </p>\n" +
            "                                        <span class=\"cart-price\">" + showPrice(bookItem.price) +
            "</span>\n" +
            "                                    </div>\n" +
            "                                    <div class=\"cart-product-remove\" onclick=\"removeCartProduct(" + bookItem.id + ")\">\n" +
            "                                        <i class=\"fa fa-times\"></i>\n" +
            "                                    </div>\n" +
            "                                </div>";

        $("#shopping-cart-wrapper").prepend(html);
    }

    $("#cart-total-price").text(showPrice(datajson.totalPrice));
}

function showAlertLogin() {
    $('#alert-login').removeClass("hide")
}

function hideAlertLogin() {
    $('#alert-login').addClass("hide")
}


function add2Wishlist(id) {
    $.ajax({
        type: "POST",
        url: "/addWish",   // this is my servlet
        data: {"bookID": id},
        success: function (data) {
            changeCounterWish(1);
            addHTMLproductWish(data);
            $('html,body').animate({scrollTop: 0}, 300);
            showSnackbar("Adding wish product successfully");

        },
        error: function (xhr) {
            if (xhr.status === 404)
                showAlertLogin();
            else if (xhr.status === 500) {
                showSnackbar(xhr.responseText);
            }
        }
    });
}

function changeCounterWish(quantity) {
    var counter = $("#counter-wish");
    counter.text(parseInt(counter.text()) + parseInt(quantity));
}

function addHTMLproductWish(data) {
    var bookItem = $.parseJSON(data);
    var html = " <div class=\"cart-product\" id=\"wishproductid" + bookItem.id + "\">\n" +
        "                                    <div class=\"cart-product-image\">\n" +
        "                                        <a href=\"single-product.jsp\">\n" +
        "                                            <img src=\"/public/customer/img/shop/images/" + bookItem.img + "\" alt=\"\">\n" +
        "                                        </a>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"cart-product-info\">\n" +
        "                                        <a href=\"\">" + shortOfTitleCart(bookItem.title) +
        "\n" +
        "                                        </a>\n" +
        "                                        <a href=\"\">" + bookItem.type +
        "\n" +
        "                                        </a>\n" +
        "                                        <span class=\"cart-price\">" + showPrice(bookItem.price) +
        "</span>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"cart-product-remove\" onclick=\"removeWishlistItem(" + bookItem.id + ")\">\n" +
        "                                        <i class=\"fa fa-times\"></i>\n" +
        "                                    </div>\n" +
        "                                </div>";

    $("#wish-wrapper").prepend(html);
}


function addToCardFromWishlist(id) {
    addToCard(id, 1);

}

function removeWishlistItemAjax(id) {
    $.ajax({
        type: "POST",
        url: "/delWish",   // this is my servlet
        data: {"bookID": id},
        success: function (data) {
            changeCounterWish(-1);
            $("#wishproductid" + id).remove();
            showSnackbar("Remove wish product successfully");
        }
    });
}

function removeWishlistItem(id) {
    removeWishlistItemAjax(id)
    $('.wishlist-item[data-id="' + id + '"]').remove();
    changeCounterWish(-1);
    $("#wishproductid" + id).remove();
    showSnackbar("Remove wish product successfully");
}


// var HOST = "http://localhost:8080/";
//
// function setDefaultHost(path) {
//     HOST = path;
// }
//
// function fullPath(path) {
//     return HOST + path;
// }