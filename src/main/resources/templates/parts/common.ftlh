<#macro page>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="_csrf" content="${_csrf.token}" id="csrfUserList">
            <title>TechPort</title>
            <link rel="stylesheet" href="/static/style.css">
            <link rel="stylesheet" href="/static/fontawesome.css">
            <link rel="stylesheet" href="/static/mdb1.css">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
                  integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                  crossorigin="anonymous">
        </head>

        <body>
            <#include "navbar.ftlh">
            <div class="container mt-5">
                <#nested>
            </div>
            <#include "footer.ftlh">
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                    integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                    crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

            <script>
                $('.addToFavorites').on('click', function () {
                    let product = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", product);
                    $.ajax({
                        type: "POST",
                        url: "/user/addToFavorites",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR : ", jqXHR.responseText);

                        }
                    });
                });
            </script>

            <script>
                $('.addOneToBasket').on('click', function () {
                    let product = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", product);
                    $.ajax({
                        type: "POST",
                        url: "/user/addOneToBasket",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>


            <script>
                $('.deleteOneFromBasket').on('click', function () {
                    let product = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", product);
                    $.ajax({
                        type: "POST",
                        url: "/user/deleteOneFromBasket",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.deleteAllFromBasket').on('click', function () {
                    let product = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", product);
                    $.ajax({
                        type: "POST",
                        url: "/user/deleteAllFromBasket",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.addProduct').on('click', function () {
                    let type = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("type", type);
                    $.ajax({
                        type: "GET",
                        url: "/product/add",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function(data, textStatus, jqXHR) {
                            console.log("SUCCESS : ", data);
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.deleteProduct').on('click', function () {
                    let data = new FormData();
                    let productId = $(this).attr("value");
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", productId);
                    $.ajax({
                        type: "POST",
                        url: "/product/deleteProduct",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.activateProduct').on('click', function () {
                    let data = new FormData();
                    let productId = $(this).attr("value");
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("productId", productId);
                    $.ajax({
                        type: "POST",
                        url: "/product/activateProduct",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.addProduct').on('click', function () {
                    let type = $(this).attr("value");
                    let data = new FormData();
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("type", type);
                    $.ajax({
                        type: "GET",
                        url: "/product/add",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function(data, textStatus, jqXHR) {
                            console.log("SUCCESS : ", data);
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>


            <script>
                $('.doDelivered').on('click', function () {
                    let data = new FormData();
                    let orderId = $(this).attr("value");
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("orderId", orderId);
                    $.ajax({
                        type: "POST",
                        url: "/order/doDelivered",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                $('.doActive').on('click', function () {
                    let data = new FormData();
                    let orderId = $(this).attr("value");
                    let csrfToken = $("#csrfUserList").attr("content");
                    data.append("_csrf", csrfToken);
                    data.append("orderId", orderId);
                    $.ajax({
                        type: "POST",
                        url: "/order/doActive",
                        processData: false,
                        contentType: false,
                        cache: false,
                        timeout: 1000000,
                        data: data,

                        success: function() {
                            location.reload();
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR : ", jqXHR.responseText);
                        }
                    });
                });
            </script>

            <script>
                function setWidthCheckoutButton() {
                    $("#checkoutButton").width($("#cartCard").width());
                }
                setWidthCheckoutButton();
            </script>

            <style>
                .img-thumbnail {
                    height: 100px;
                    border: 1px solid #000;
                    margin: 0px 5px 0 0;
                }
            </style>
        </body>
    </html>
</#macro>