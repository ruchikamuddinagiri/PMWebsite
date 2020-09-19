// Page loadinmg animation

if ((".loader").length) {
    // show Preloader until the website ist loaded
    $(window).on('load', function () {
        $(".loader").fadeOut("slow");
    });
}

/* Onpage linkng smooth effect */

$('a[href^="#"]').on('click', function (event) {

    var target = $($(this).attr('href'));

    if (target.length) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: target.offset().top
        }, 1000);
    }

});

// Sticky Header
$(window).scroll(function () {
    var scroll = $(window).scrollTop();

    if (scroll >= 100) {
        $(".top-nav").addClass("light-header");
    } else {
        $(".top-nav").removeClass("light-header");
    }
});

// Year for copy content
$(function () {
    var theYear = new Date().getFullYear();
    $('#year').html(theYear);
});


function add() {
    $("#myModalAdd").modal('show');   
}


$(".input").focus(function () {
    $(this).parent().addClass("focus");
});



function GetSelectedRow(lnk) {
    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var name = row.cells[0].innerText;
    var type = row.cells[1].innerText;
    var vid = row.cells[2].innerText;

    document.getElementById('HiddenField_vid').value = vid;
    document.getElementById('txtbx_vname_upd').value = name;
    document.getElementById('dd_type_upd').value = type;

    $("#myModalEdit").modal('show');
    return false;

}

function GetSelectedRow1(lnk) {
    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var vid = row.cells[2].innerText;

    document.getElementById('HiddenField_vid').value = vid;

    $("#myModalDelete").modal('show');
    return false;

}

function GetSelectedRow_Offers(lnk) {
    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var vendor = row.cells[0].innerText;
    var offername = row.cells[1].innerText;
    var descr = row.cells[2].innerText;
    var oid = row.cells[3].innerText;

    document.getElementById('HiddenField_oid').value = oid;
    document.getElementById('txtbx_offer_upd').value = offername;
    document.getElementById('txtbx_descr_upd').value = descr;
    $("#dd_vendor_upd option:contains(" + vendor + ")").attr('selected', 'selected');

    $("#myModalEdit").modal('show');
    return false;

}


function GetSelectedRow_Offers1(lnk) {
    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var oid = row.cells[3].innerText;

    document.getElementById('HiddenField_oid').value = oid;

    $("#myModalDelete").modal('show');
    return false;

}


function GetSelectedRow_product(lnk) {

    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var image = row.cells[0].innerHTML;
    var x = document.getElementsByTagName("img").item(0);
    var src_img = x.getAttribute("src");
    var pname = row.cells[1].innerText;
    var catg = row.cells[2].innerText;
    var price = row.cells[3].innerText;
    var dprice = row.cells[4].innerText;
    var is_disc = row.cells[5].innerText;
    var pid = row.cells[6].innerText;

    document.getElementById('HiddenField_pid').value = pid;
    document.getElementById('txtbx_pname_upd').value = pname;
    document.getElementById('txtbx_price_upd').value = price;
    document.getElementById('txtbx_dprice_upd').value = dprice;
    $("#dd_catg_upd option:contains(" + catg + ")").attr('selected', 'selected');

    var radio = document.getElementById('chkbx_disc_upd').getElementsByTagName("input");

    if (is_disc == "Yes") {
        radio[0].checked = true;
    }
    else if (is_disc == "No") {
        radio[1].checked = true;
    }

    var img = $('<img />').attr({
        'src': src_img,
        'alt': 'image',
        'width': '100px',
        'height': '100px',
    }).appendTo('#div_image');

    $("#myModalEdit").modal('show');
    return false;

}


function GetSelectedRow_pdel(lnk) {
    var row = lnk.parentNode.parentNode;
    var rowIndex = row.rowIndex - 1;
    var pid = row.cells[6].innerText;

    document.getElementById('HiddenField_pid').value = pid;

    $("#myModalDelete").modal('show');
    return false;

}


$(".price").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
        return false;
    }
});

$(".dprice").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#dprice_errmsg").html("Digits Only").show().fadeOut("slow");
        return false;
    }
});


$(".qty").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg1").html("Digits Only").show().fadeOut("slow");
        return false;
    }
});

$(".totalprice").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg2").html("Digits Only").show().fadeOut("slow");
        return false;
    }
});


$(".txtOnly").keypress(function (event) {
    var key = event.keyCode;
    if (key >= 48 && key <= 57) {
        event.preventDefault();
    }
    else {
        if (key == 32) {

        }
        else {
            if (!((event.keyCode >= 65) && (event.keyCode <= 90) || (event.keyCode >= 97) && (event.keyCode <= 122) || (event.keyCode >= 48) && (event.keyCode <= 57))) {
                event.preventDefault();
            }
        }
    }

});


$(".mob").keypress(function (e) {
    //if the letter is not digit then display error and don't type anything
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
        return false;
    }
});



$(".searchdate").datepicker({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    changeYear: true,
    yearRange: "-100:+0",

});


function MutExChkList(chk) {
    var chkList = chk.parentNode.parentNode.parentNode;
    var chks = chkList.getElementsByTagName("input");
    for (var i = 0; i < chks.length; i++) {
        if (chks[i] != chk && chk.checked) {
            chks[i].checked = false;
        }
    }
}


