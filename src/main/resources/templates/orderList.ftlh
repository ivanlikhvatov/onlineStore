<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Список заказов</p>

    <br>

    <a href="/order/list/all" class="btn btn-primary">Все</a>
    <a href="/order/list/ACCEPTED" class="btn btn-primary">Принятые</a>
    <a href="/order/list/ACTIVE" class="btn btn-primary">Активные</a>
    <a href="/order/list/DELIVERED" class="btn btn-primary">Доставленные</a>
    <#if user.isAdmin()>
        <a href="/order/list/CANCELED" class="btn btn-primary">Отменённые</a>
    </#if>




    <#if user.isAdmin()>
        <div class="form-row" style="margin-top: 2%">
            <div class="form-group col-md-6">
                <form class="form-inline" method="get" action="/order/list/${status}">
                    <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                           placeholder="Поиск по e-mail">
                    <button class="btn btn-primary ml-2" type="submit">Поиск</button>
                </form>
            </div>
        </div>
    </#if>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <#list orders as order>
                    <div class="card mb-3 border-primary">

                        <div class="card-header">
                            <div class="card-title">
                                <p style="font-size: x-large; font-weight: bold; color: #007bff">Заказ № ${order.id}</p>
                            </div>
                        </div>

                        <div class="card-body">

                            <div class="card-text">
                                <p>Статус:
                                    <#if order.status.name() = "ACTIVE">Активен</#if>
                                    <#if order.status.name() = "ACCEPTED">Принят, ожидает подтверждения</#if>
                                    <#if order.status.name() = "DELIVERED">Доставлен</#if>
                                    <#if order.status.name() = "CANCELED">Отменён</#if>
                                </p>
                            </div>

                            <div class="card-text">
                                <p>Тип оплаты: ${order.typePay}</p>
                            </div>

                            <div class="card-text">
                                <p>Дата и время отправки: ${order.dispatchDate}</p>
                            </div>

                            <div class="card-text">
                                <p>Ожидаемые дата и время доставки: ${order.dispatchDate}</p>
                            </div>

                            <#if order.status.name() = "DELIVERED">
                                <div class="card-text">
                                    <p>Был доставлен: ${order.deliveredDate}</p>
                                </div>
                            </#if>

                            <div class="card-text">
                                <p>Имя заказчика: ${order.userName}</p>
                            </div>

                            <div class="card-text">
                                <p>Указанный адрес: ${order.address}</p>
                            </div>

                            <div class="card-text">
                                <p>Телефон заказчика: ${order.phoneNumber}</p>
                            </div>

                            <div class="card-text">
                                <p>E-mail заказчика: ${order.email}</p>
                            </div>

                            <div class="card-text">
                                <p>Общая стоимость заказа: ${order.cost} ₽</p>
                            </div>


                            <#if isAdmin>

                                <#if order.status.name() = "ACTIVE">
                                    <a class="btn btn-success doDelivered" value="${order.id}" style="color: white">Доставлен</a>
                                    <a class="btn btn-danger" href="/order/reasonToCanceled/${order.id}" style="color: white">Отменить заказ</a>
                                </#if>

                                <#if order.status.name() = "CANCELED">
                                    <a class="btn btn-success doActive" value="${order.id}" style="color: white">Возобновить заказ</a>
                                </#if>

                            </#if>
                        </div>




                        <div class="card-footer">

                            <div class="card-title">
                                <p style="font-size: x-large; font-weight: bold; color: #007bff">Товары в заказе</p>
                            </div>

                            <div class="row no-gutters">
                                <div class="col-md-12">
                                    <#list order.getProducts() as product>

                                        <div class="card mb-3">
                                            <div class="row no-gutters">
                                                <div class="col-md-2" style="padding-top: 6px; padding-bottom: 6px">
                                                    <img id="carousel-image" src="/img/${productService.findById(product.id).get().filesNames[0]}" height="100" alt="...">
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="card-body">
                                                        <div class="price">${product.price} ₽</div>
                                                        <#if product.type.name() = "TELEPHONE">
                                                            <div class="card-text">
                                                                <small class="text-muted">
                                                                    Смартфон
                                                                    ${product.brand}
                                                                    ${product.name}
                                                                    ${productService.findByNameAndProduct("internalMemory", productService.findById(product.id).get()).value}
                                                                    ${productService.findById(product.id).get().color}
                                                                </small>
                                                            </div>
                                                        </#if>

                                                        <#if productService.findById(product.id).get().type.name() = "COMPUTER">
                                                            <div class="card-text">
                                                                <small class="text-muted">
                                                                    Компьютер
                                                                    ${productService.findById(product.id).get().brand}
                                                                    ${productService.findById(product.id).get().name}
                                                                    ${productService.findByNameAndProduct("screenDiagonal", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("cpu", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("ram", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("internalMemory", productService.findById(product.id).get()).value}
                                                                    ${productService.findById(product.id).get().color}
                                                                </small>
                                                            </div>
                                                        </#if>

                                                        <#if productService.findById(product.id).get().type.name() = "NOTEBOOK">
                                                            <div class="card-text">
                                                                <small class="text-muted">
                                                                    Ноутбук
                                                                    ${productService.findById(product.id).get().brand}
                                                                    ${productService.findById(product.id).get().name}
                                                                    ${productService.findByNameAndProduct("screenDiagonal", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("cpu", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("ram", productService.findById(product.id).get()).value}
                                                                    ${productService.findByNameAndProduct("internalMemory", productService.findById(product.id).get()).value}
                                                                    ${productService.findById(product.id).get().color}
                                                                </small>
                                                            </div>
                                                        </#if>

                                                        <#if productService.findById(product.id).get().type.name() = "TV">
                                                            <div class="card-text">
                                                                <small class="text-muted">
                                                                    Телевизор
                                                                    ${productService.findById(product.id).get().brand}
                                                                    ${productService.findById(product.id).get().name}
                                                                    ${productService.findByNameAndProduct("yearRelease", productService.findById(product.id).get()).value}
                                                                </small>
                                                            </div>
                                                        </#if>

                                                        Количество: ${product.count} шт
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </#list>
                                </div>
                            </div>
                        </div>

                    </div>
                </#list>
            </div>
        </div>
    </div>



    <br>
    <br>


    <br>
    <br>


    <style>
        #carousel-image {
            display: block;
            margin: 0 auto;
        }

        .price {
            position: absolute;
            top: 14%;
            right: 4%;
            font-weight: bold;
            font-size: x-large;
            color: #007bff;
        }

        .topCardText {
            font-size: small;
            /*margin-top: 10px;*/
            display: flex;
            margin-bottom: 10px;
        }

        .isExist {
            margin-left: 3px;
        }

        .greenCircle {
            /*margin-left: 7px;*/
            margin-top: 2px;
            width: 10px;
            height: 10px;
            background: chartreuse;
            -moz-border-radius: 50px;
            -webkit-border-radius: 50px;
            border-radius: 50px;
        }

        .redCircle {
            /*margin-left: 7px;*/
            margin-top: 2px;
            width: 10px;
            height: 10px;
            background: crimson;
            -moz-border-radius: 50px;
            -webkit-border-radius: 50px;
            border-radius: 50px;
        }

        #iconsOnCard {
            margin-right: 10px;
            color: #007bff;
        }

        #iconsOnCard:hover {
            cursor: pointer;
            color: #0069d9;
        }

        #blockIconsOnCard {
            display: flex;
        }

        .deleteBlock{
            position: absolute;
            cursor: pointer;
            top: 61%;
            right: 3%;
        }

        .counter{
            display: flex;
            position: absolute;
            top: 58%;
            right: 10%;
        }

        .buttonMinus{text-decoration:none; text-align:center;
            cursor: pointer;
            padding:8px 14px;
            border:solid 1px #9c9fa1;
            -webkit-border-radius:7px 0px 0px 7px; 	 				 border-radius: 7px 0px 0px 7px; 					-moz-border-radius-topleft:7px; 					-moz-border-radius-topright:0px; 					-moz-border-radius-bottomleft:7px; 					-moz-border-radius-bottomright:0px;
            font:14px Tahoma, Geneva, sans-serif;
            font-weight:bold;
            color:#999999;
            background-color:#fcfcfc;
            background-image: -moz-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -webkit-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -o-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -ms-linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
            background-image: linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

        }.buttonMinus:hover{
             padding:8px 14px;
             border:solid 1px #e3e3e3;
             -webkit-border-radius:7px 0px 0px 7px; 	 				 border-radius: 7px 0px 0px 7px; 					-moz-border-radius-topleft:7px; 					-moz-border-radius-topright:0px; 					-moz-border-radius-bottomleft:7px; 					-moz-border-radius-bottomright:0px;
             font:14px Tahoma, Geneva, sans-serif;
             font-weight:bold;
             color:#999999;
             background:#e3e3e3;
             -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

         }.buttonMinus:active{
              padding:8px 14px;
              border:solid 1px #9c9fa1;
              -webkit-border-radius:7px 0px 0px 7px; 	 				 border-radius: 7px 0px 0px 7px; 					-moz-border-radius-topleft:7px; 					-moz-border-radius-topright:0px; 					-moz-border-radius-bottomleft:7px; 					-moz-border-radius-bottomright:0px;
              font:14px Tahoma, Geneva, sans-serif;
              font-weight:bold;
              color:#999999;
              background:#e3e3e3;
              -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

          }




        .buttonPlus{text-decoration:none; text-align:center;
            cursor: pointer;
            padding:8px 11px;
            border:solid 1px #9c9fa1;
            -webkit-border-radius:0px 7px 7px 0px; 	 				 border-radius: 0px 7px 7px 0px; 					-moz-border-radius-topleft:0px; 					-moz-border-radius-topright:7px; 					-moz-border-radius-bottomleft:0px; 					-moz-border-radius-bottomright:7px;
            font:14px Tahoma, Geneva, sans-serif;
            font-weight:bold;
            color:#999999;
            background-color:#fcfcfc;
            background-image: -moz-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -webkit-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -o-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -ms-linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
            background-image: linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

        }.buttonPlus:hover{
             padding:8px 11px;
             border:solid 1px #e3e3e3;
             -webkit-border-radius:0px 7px 7px 0px; 	 				 border-radius: 0px 7px 7px 0px; 					-moz-border-radius-topleft:0px; 					-moz-border-radius-topright:7px; 					-moz-border-radius-bottomleft:0px; 					-moz-border-radius-bottomright:7px;
             font:14px Tahoma, Geneva, sans-serif;
             font-weight:bold;
             color:#999999;
             background:#e3e3e3;
             -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

         }.buttonPlus:active{
              padding:8px 11px;
              border:solid 1px #9c9fa1;
              -webkit-border-radius:0px 7px 7px 0px; 	 				 border-radius: 0px 7px 7px 0px; 					-moz-border-radius-topleft:0px; 					-moz-border-radius-topright:7px; 					-moz-border-radius-bottomleft:0px; 					-moz-border-radius-bottomright:7px;
              font:14px Tahoma, Geneva, sans-serif;
              font-weight:bold;
              color:#999999;
              background:#e3e3e3;
              -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

          }


        .countBlock{
            text-decoration:none; text-align:center;
            padding:8px 11px;
            border:solid 1px #9c9fa1;
            min-width: 40px;

            font:14px Tahoma, Geneva, sans-serif;
            font-weight:bold;
            color:#000000;
            background-color:#fcfcfc;
            background-image: -moz-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -webkit-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -o-linear-gradient(top, #fcfcfc 0%, #ffffff 100%);
            background-image: -ms-linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
            background-image: linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;
        }


        .buttonPlusNoActive{
            text-decoration:none;
            text-align:center;
            padding:8px 11px;
            border:solid 1px #9c9fa1;
            -webkit-border-radius:0px 7px 7px 0px;
            border-radius: 0px 7px 7px 0px;
            -moz-border-radius-topleft:0px;
            -moz-border-radius-topright:7px;
            -moz-border-radius-bottomleft:0px;
            -moz-border-radius-bottomright:7px;
            font:14px Tahoma, Geneva, sans-serif;
            font-weight:bold;
            color:#999999;
            background-color:#e3e3e3;
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
            background-image: linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;
        }
        .buttonMinusNoActive{
            text-decoration:none;
            text-align:center;
            padding:8px 14px;
            border:solid 1px #9c9fa1;
            -webkit-border-radius:7px 0px 0px 7px; 	 				 border-radius: 7px 0px 0px 7px; 					-moz-border-radius-topleft:7px; 					-moz-border-radius-topright:0px; 					-moz-border-radius-bottomleft:7px; 					-moz-border-radius-bottomright:0px;
            font:14px Tahoma, Geneva, sans-serif;
            font-weight:bold;
            color:#999999;
            background-color:#e3e3e3;
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
            background-image: linear-gradient(top, #fcfcfc 0% ,#ffffff 100%);
            -webkit-box-shadow:inset 0,0,0px 0,0,0px 1,1,1px #ffffff,#ffffff,#ffffff;  -moz-box-shadow:inset 0px 0px 1px #ffffff;  box-shadow:inset 0px 0px 1px #ffffff;

        }
    </style>





</@c.page>


