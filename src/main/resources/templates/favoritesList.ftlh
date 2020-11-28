<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Избранное</p>

    <br>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form class="form-inline" method="get" action="/favorites/list">
                <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                       placeholder="Поиск по имени">
                <button class="btn btn-primary ml-2" type="submit">Поиск</button>
            </form>
        </div>
    </div>

    <div class="row">
        <#list products as product>
            <div class="col-md-6 col-xl-3 mb-lg-4">
                <div class="card h-100">
                    <div id="carouselExampleIndicators${product.id}" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <#if product.filesNames?hasContent && product.filesNames[0]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            </#if>
                            <#if product.filesNames?hasContent && product.filesNames[1]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            </#if>
                            <#if product.filesNames?hasContent && product.filesNames[2]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </#if>
                            <#if product.filesNames?hasContent && product.filesNames[3]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            </#if>
                            <#if product.filesNames?hasContent && product.filesNames[4]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                            </#if>
                            <#if product.filesNames?hasContent && product.filesNames[5]?hasContent>
                                <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                            </#if>
                        </ol>

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

                        <#if product.filesNames?hasContent>
                            <div class="carousel-inner card-img-top">
                                <#if product.filesNames[0]?hasContent>
                                    <div class="carousel-item active">
                                        <img id="carousel-image" src="/img/${product.filesNames[0]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>

                                <#if product.filesNames[1]?hasContent>
                                    <div class="carousel-item">
                                        <img id="carousel-image" src="/img/${product.filesNames[1]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>

                                <#if product.filesNames[2]?hasContent>
                                    <div class="carousel-item">
                                        <img id="carousel-image" src="/img/${product.filesNames[2]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>

                                <#if product.filesNames[3]?hasContent>
                                    <div class="carousel-item">
                                        <img id="carousel-image" src="/img/${product.filesNames[3]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>

                                <#if product.filesNames[4]?hasContent>
                                    <div class="carousel-item">
                                        <img id="carousel-image" src="/img/${product.filesNames[4]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>

                                <#if product.filesNames[5]?hasContent>
                                    <div class="carousel-item">
                                        <img id="carousel-image" src="/img/${product.filesNames[5]}" height="200" style="max-width: 240px" alt="...">
                                    </div>
                                </#if>
                            </div>

                            <a class="carousel-control-prev" href="#carouselExampleIndicators${product.id}" role="button"
                               data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>

                            <a class="carousel-control-next" href="#carouselExampleIndicators${product.id}" role="button"
                               data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </#if>
                    </div>

                    <div class="card-body">
                        <#if product.type.name() = "TELEPHONE">
                            <p class="card-text">
                                <small class="text-muted">
                                    Смартфон
                                    ${product.brand}
                                    ${product.name}
                                    ${productService.findByNameAndProduct("internalMemory", product).value}
                                    ${product.color}
                                </small>
                            </p>
                        </#if>

                        <#if product.type.name() ="COMPUTER">
                            <p class="card-text">
                                <small class="text-muted">
                                    Компьютер
                                    ${product.brand}
                                    ${product.name}
                                    ${productService.findByNameAndProduct("screenDiagonal", product).value}
                                    ${productService.findByNameAndProduct("cpu", product).value}
                                    ${productService.findByNameAndProduct("ram", product).value}
                                    ${productService.findByNameAndProduct("internalMemory", product).value}
                                    ${productService.findByNameAndProduct("graphicsProcessor", product).value}
                                    ${product.color}
                                </small>
                            </p>
                        </#if>

                        <#if product.type.name() ="NOTEBOOK">
                            <p class="card-text">
                                <small class="text-muted">
                                    Ноутбук
                                    ${product.brand}
                                    ${product.name}
                                    ${productService.findByNameAndProduct("screenDiagonal", product).value}
                                    ${productService.findByNameAndProduct("cpu", product).value}
                                    ${productService.findByNameAndProduct("ram", product).value}
                                    ${productService.findByNameAndProduct("internalMemory", product).value}
                                    ${productService.findByNameAndProduct("graphicsProcessor", product).value}
                                    ${product.color}
                                </small>
                            </p>
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
                    </div>

                    <div class="card-footer border-0" style="background-color: white">
                        <p class="price">${product.price} ₽</p>

                        <div id="blockIconsOnCard">
                            <#if user??>
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

                                <#if (product.count > 0)>
                                    <#if basketRepo.findByUserAndProductId(userFromBd, product.id)??>
                                        <#if (basketRepo.findByUserAndProductId(userFromBd, product.id).count < product.count)>
                                            <a class="addOneToBasket" id="iconsOnCard" value="${product.id}">
                                                <svg class="bi bi-cart-plus" width="1.7em" height="1.7em"
                                                     viewBox="0 0 16 16" fill="currentColor"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M8.5 5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M8 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0v-2z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                </svg>
                                            </a>

                                            <div id="iconsOnCard">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</div>

                                            <a class="deleteOneFromBasket" id="iconsOnCard" value="${product.id}">
                                                <svg class="bi bi-cart-dash" width="1.7em" height="1.7em"
                                                     viewBox="0 0 16 16" fill="currentColor"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                </svg>
                                            </a>
                                        <#elseIf (basketRepo.findByUserAndProductId(userFromBd, product.id).count >= product.count)>
                                            <a style="color: darkgrey; margin-right: 10px">
                                                <svg class="bi bi-cart-plus" width="1.7em" height="1.7em"
                                                     viewBox="0 0 16 16" fill="currentColor"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M8.5 5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M8 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0v-2z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                </svg>
                                            </a>

                                            <div id="iconsOnCard">${basketRepo.findByUserAndProductId(userFromBd, product.id).count}</div>

                                            <a class="deleteOneFromBasket" id="iconsOnCard" value="${product.id}">
                                                <svg class="bi bi-cart-dash" width="1.7em" height="1.7em"
                                                     viewBox="0 0 16 16" fill="currentColor"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd"
                                                          d="M6 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                </svg>
                                            </a>
                                        </#if>
                                    <#else>
                                        <a class="addOneToBasket" id="iconsOnCard" value="${product.id}">
                                            <svg class="bi bi-cart-plus" width="1.7em" height="1.7em"
                                                 viewBox="0 0 16 16" fill="currentColor"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M8.5 5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 .5-.5z"/>
                                                <path fill-rule="evenodd"
                                                      d="M8 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0v-2z"/>
                                                <path fill-rule="evenodd"
                                                      d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                            </svg>
                                        </a>
                                    </#if>
                                </#if>
                            <#else>
                                <a id="iconsOnCard" href="/login">
                                    <svg class="bi bi-heart" width="1.7em" height="1.7em" viewBox="0 0 16 16"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                    </svg>
                                </a>

                                <a id="iconsOnCard" href="/login">
                                    <svg class="bi bi-cart" width="1.7em" height="1.7em" viewBox="0 0 16 16"
                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                    </svg>
                                </a>
                            </#if>
                        </div>

                        <br>
                        <br>

                        <a href="/product/fullInformation/${product.id}" class="btn btn-primary">Подробнее</a>

                        <br>
                        <br>

                        <#if isAdmin>
                            <a href="/product/${product.id}">Редактировать</a>
                        </#if>

                        <br>

                        <#if isAdmin && product.getState().toString() = "ACTIVE">
                            <a id="deleteProduct" class="deleteProduct" value="${product.id}">Удалить товар</a>
                        </#if>
                    </div>
                </div>
            </div>
        </#list>
    </div>

    <style>
        #carousel-image {
            display: block;
            margin: 0 auto;
        }

        .price {
            font-weight: bold;
            font-size: x-large;
            color: #7b1fa2;
        }

        .topCardText {
            font-size: small;
            margin-top: 10px;
            display: flex;
            margin-bottom: 10px;
        }

        .isExist {
            margin-left: 3px;
        }

        .greenCircle {
            margin-left: 7px;
            margin-top: 2px;
            width: 10px;
            height: 10px;
            background: chartreuse;
            -moz-border-radius: 50px;
            -webkit-border-radius: 50px;
            border-radius: 50px;
        }

        .redCircle {
            margin-left: 7px;
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

        #deleteProduct{
            margin-right: 10px;
            color: #007bff;
        }

        #deleteProduct:hover{
            cursor: pointer;
            color: #0069d9;
            text-decoration: underline;
        }
    </style>
</@c.page>