<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Корзина</p>

    <br>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form class="form-inline" method="get" action="/basket">
                <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                       placeholder="Поиск по имени">
                <button class="btn btn-primary ml-2" type="submit">Поиск</button>
            </form>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <#list products as product>
                <div class="card mb-3">
                    <div class="row no-gutters">
                        <div class="col-md-2" style="padding-top: 6px; padding-bottom: 6px">
                            <img id="carousel-image" src="/img/${product.filesNames[0]}" height="120" alt="...">
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
                                            ${productService.findByNameAndProduct("internalMemory", product).value}
                                            ${product.color}
                                        </small>
                                    </div>
                                </#if>

                                <#if product.type.name() = "COMPUTER">
                                    <div class="card-text">
                                        <small class="text-muted">
                                            Компьютер
                                            ${product.brand}
                                            ${product.name}
                                            ${productService.findByNameAndProduct("screenDiagonal", product).value}
                                            ${productService.findByNameAndProduct("cpu", product).value}
                                            ${productService.findByNameAndProduct("ram", product).value}
                                            ${productService.findByNameAndProduct("internalMemory", product).value}
                                            ${product.color}
                                        </small>
                                    </div>
                                </#if>

                                <#if product.type.name() = "NOTEBOOK">
                                    <div class="card-text">
                                        <small class="text-muted">
                                            Ноутбук
                                            ${product.brand}
                                            ${product.name}
                                            ${productService.findByNameAndProduct("screenDiagonal", product).value}
                                            ${productService.findByNameAndProduct("cpu", product).value}
                                            ${productService.findByNameAndProduct("ram", product).value}
                                            ${productService.findByNameAndProduct("internalMemory", product).value}
                                            ${product.color}
                                        </small>
                                    </div>
                                </#if>

                                <#if product.type.name() = "TV">
                                    <div class="card-text">
                                        <small class="text-muted">
                                            Телевизор
                                            ${product.brand}
                                            ${product.name}
                                            ${productService.findByNameAndProduct("yearRelease", product).value}
                                        </small>
                                    </div>
                                </#if>

                                <#if product.count != 0>
                                    <div class="card-text topCardText">
                                        <div class="greenCircle"></div>
                                        <small class="text-muted isExist">В наличии</small>
                                    </div>
                                <#else>
                                    <div class="card-text topCardText">
                                        <div class="redCircle"></div>
                                        <small class="text-muted isExist">Нет в наличии</small>
                                    </div>
                                </#if>

                                <div class="counter">
                                    <#if (basketRepo.findByUserAndProductId(userFromBd, product.id).count < product.count) && (basketRepo.findByUserAndProductId(userFromBd, product.id).count > 1)>
                                        <a class="buttonMinus deleteOneFromBasket" value="${product.id}">-</a>
                                        <a class="countBlock">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</a>
                                        <a class="buttonPlus addOneToBasket" value="${product.id}">+</a>
                                    <#elseIf (basketRepo.findByUserAndProductId(userFromBd, product.id).count < product.count) && (basketRepo.findByUserAndProductId(userFromBd, product.id).count = 1)>
                                        <a class="buttonMinusNoActive" value="${product.id}">-</a>
                                        <a class="countBlock">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</a>
                                        <a class="buttonPlus addOneToBasket" value="${product.id}">+</a>
                                    <#elseIf (basketRepo.findByUserAndProductId(userFromBd, product.id).count >= product.count) && (basketRepo.findByUserAndProductId(userFromBd, product.id).count > 1)>
                                        <a class="buttonMinus deleteOneFromBasket" value="${product.id}">-</a>
                                        <a class="countBlock">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</a>
                                        <a class="buttonPlusNoActive" value="${product.id}">+</a>
                                    <#elseIf (basketRepo.findByUserAndProductId(userFromBd, product.id).count >= product.count) && (basketRepo.findByUserAndProductId(userFromBd, product.id).count = 1)>
                                        <a class="buttonMinusNoActive">-</a>
                                        <a class="countBlock">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</a>
                                        <a class="buttonPlusNoActive">+</a>
                                    </#if>
                                </div>

                                <div class="deleteBlock">
                                    <a class="deleteAllFromBasket" value="${product.id}">
                                        <svg class="bi bi-x" width="1.7em" height="1.7em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
                                            <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
                                        </svg>
                                    </a>
                                </div>

                                <div style="display: flex; margin-top: 20px">
                                    <div>
                                        <a href="/product/fullInformation/${product.id}" class="btn btn-primary">Подробнее</a>
                                    </div>

                                    <div style="margin-top: 5px; margin-left: 10px">
                                        <a class="addToFavorites" id="iconsOnCard" value="${product.id}">
                                            <#if userFromBd.isContainsProductInFavorites(product.id)>
                                                <svg class="bi bi-heart-fill" width="1.7em" height="1.7em" viewBox="0 0 16 16"
                                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                                </svg>
                                            <#else>
                                                <svg class="bi bi-heart" width="1.7em" height="1.7em" viewBox="0 0 16 16"
                                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                                </svg>
                                            </#if>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </#list>
            </div>

            <#assign sum = 0>
            <#list basketRepo.findAllByUser(userFromBd) as product>
                <#assign sum = sum + product.count * product.price>
            </#list>

            <#assign count = 0>
            <#list basketRepo.findAllByUser(userFromBd) as product>
                <#assign count = count + product.count>
            </#list>
            <div class="col-md-offset-1">
                <div class="card mb-3" id="cartCard" style="max-width: 19rem;">
                    <div class="card-body">
                        <div class="card-text" style="display: flex">
                            <div style="font-weight: bolder; font-size: medium; color: #007bff">
                                В вашей корзине
                            </div>

                            <small style="font-size: x-small; margin-left: 5px">
                                #{count}

                                <#if count % 10 = 1 && count % 100 != 11>
                                    товар
                                <#elseIf (count % 10 = 2 || count % 10 = 3 || count % 10 = 4) && (count % 100 != 12 && count % 100 != 13 && count % 100 != 14)>
                                    товара
                                <#else>
                                    товаров
                                </#if>
                            </small>
                        </div>

                        <div class="card-text" style="display: flex">
                            <div style="font-weight: bold; font-size: small">
                                Сумма при <br> получении заказа:
                            </div>

                            <div style="font-weight: bolder; font-size: medium; color: #007bff; margin-left: 20px; margin-top: 4px">
                                ${sum} ₽
                            </div>
                        </div>
                    </div>
                </div>

                <#if basketRepo.findAllByUser(userFromBd)?hasContent>
                    <a href="/order/checkout" class="btn btn-primary" id="checkoutButton">Оформить заказ</a>
                <#else>
                    <div class="btn btn-primary" id="checkoutButton">Добавьте товар</div>
                </#if>
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
            display: flex;
            margin-bottom: 10px;
        }

        .isExist {
            margin-left: 3px;
        }

        .greenCircle {
            margin-top: 2px;
            width: 10px;
            height: 10px;
            background: chartreuse;
            -moz-border-radius: 50px;
            -webkit-border-radius: 50px;
            border-radius: 50px;
        }

        .redCircle {
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


