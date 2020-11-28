<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <#if product.type.name() = "TELEPHONE">
        <p style="font-size: x-large; color: #007bff">
           ${product.brand}
           ${product.name}
           ${productService.findByNameAndProduct("internalMemory", product).value}
           ${product.color}
        </p>
    </#if>

    <#if product.type.name() = "COMPUTER">
        <p style="font-size: x-large; color: #007bff">
            ${product.brand}
            ${product.name}
            ${productService.findByNameAndProduct("screenDiagonal", product).value}
            ${productService.findByNameAndProduct("cpu", product).value}
            ${productService.findByNameAndProduct("ram", product).value}
            ${productService.findByNameAndProduct("internalMemory", product).value}
            ${productService.findByNameAndProduct("graphicsProcessor", product).value}
            ${product.color}
        </p>
    </#if>

    <#if product.type.name() = "NOTEBOOK">
        <p style="font-size: x-large; color: #007bff">
            ${product.brand}
            ${product.name}
            ${productService.findByNameAndProduct("screenDiagonal", product).value}
            ${productService.findByNameAndProduct("cpu", product).value}
            ${productService.findByNameAndProduct("ram", product).value}
            ${productService.findByNameAndProduct("internalMemory", product).value}
            ${productService.findByNameAndProduct("graphicsProcessor", product).value}
            ${product.color}
        </p>
    </#if>

    <#if product.type.name() = "TV">
        <p style="font-size: x-large; color: #007bff">
            ${product.brand}
            ${product.name}
            ${productService.findByNameAndProduct("screenDiagonal", product).value}
        </p>
    </#if>

    <br>

    <div class="container">
        <div class="row">
            <div class="col-md-5 mr-5">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
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
                                    <img id="carousel-image" src="/img/${product.filesNames[0]}" height="350" alt="...">
                                </div>
                            </#if>

                            <#if product.filesNames[1]?hasContent>
                                <div class="carousel-item">
                                    <img id="carousel-image" src="/img/${product.filesNames[1]}" height="350" alt="...">
                                </div>
                            </#if>

                            <#if product.filesNames[2]?hasContent>
                                <div class="carousel-item">
                                    <img id="carousel-image" src="/img/${product.filesNames[2]}" height="350" alt="...">
                                </div>
                            </#if>

                            <#if product.filesNames[3]?hasContent>
                                <div class="carousel-item">
                                    <img id="carousel-image" src="/img/${product.filesNames[3]}" height="350" alt="...">
                                </div>
                            </#if>

                            <#if product.filesNames[4]?hasContent>
                                <div class="carousel-item">
                                    <img id="carousel-image" src="/img/${product.filesNames[4]}" height="350" alt="...">
                                </div>
                            </#if>

                            <#if product.filesNames[5]?hasContent>
                                <div class="carousel-item">
                                    <img id="carousel-image" src="/img/${product.filesNames[5]}" height="350" alt="...">
                                </div>
                            </#if>
                        </div>

                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>

                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </#if>
                </div>
            </div>

            <div class="">
                <div class="card mt-3" style="width: 30rem;">
                    <div class="card-body">
                        <div class="row" style="margin-left: 1px; margin-bottom: 20px">
                            <h5 class="card-title text-muted" style="margin-top: 5px; margin-right: 40px">Цвет    </h5>

                            <#list productVariationsByColor as color, productWithNeedColor>
                                <#if color = "Green">
                                    <#if product.color = "Green">
                                        <a id="colorRound" class="colorRound" value="Green" style="background: #1f4f16; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" class="colorRound" value="Green" style="background: #1f4f16; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>

                                <#if color = "Grey">
                                    <#if product.color = "Grey">
                                        <a id="colorRound" class="colorRound" value="Grey" style="background: #546973; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" class="colorRound" value="Grey" style="background: #546973; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>

                                <#if color = "White">
                                    <#if product.color = "White">
                                        <a id="colorRound" class="colorRound" value="White" style="background: #e3e5e3; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" class="colorRound" value="White" style="background: #e3e5e3; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>

                                <#if color = "Gold">
                                    <#if product.color = "Gold">
                                        <a id="colorRound" class="colorRound" value="Gold" style="background: #fae3ae; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" class="colorRound" value="Gold" style="background: #fae3ae; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>

                                <#if color = "Black">
                                    <#if product.color = "Black">
                                        <a id="colorRound" class="colorRound" value="Black" style="background: #0d0d0d; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" class="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" value="Black" style="background: #0d0d0d; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>

                                <#if color = "Silver">
                                    <#if product.color = "Silver">
                                        <a id="colorRound" class="colorRound" value="Silver" style="background: #c0c0c0; margin-left: 20px; box-shadow: 0 0 0 2px white, 0 0 0 4px #007bff;">

                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE" || product.type.name() = "NOTEBOOK">
                                        <a id="colorRound" class="colorRound" href="/product/fullInformation/${productWithNeedColor.id}" value="Silver" style="background: #c0c0c0; margin-left: 20px">

                                        </a>
                                    </#if>
                                </#if>
                            </#list>
                        </div>

                        <div class="row" style="margin-left: 1px; margin-bottom: 20px">
                            <h5 class="card-title text-muted" style="margin-top: 5px; margin-right: 40px">Память    </h5>

                            <#list productVariationsByMemory as memory, productWithNeedMemory>
                                <#if memory = "64 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "64 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "256 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "256 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "512 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "512 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "1024 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "1024 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "2048 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "2048 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "4096 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "4096 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            ${memory}
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>

                                <#if memory = "8192 gb">
                                    <#if productService.findByNameAndProduct("internalMemory", product).value = "8192 gb">
                                        <a id="memoryRectangle" style="box-shadow: 0 0 0 2px #007bff;">
                                            <div style="font-size: small;">
                                                ${memory}
                                            </div>
                                        </a>
                                    <#elseIf product.type.name() = "TELEPHONE">
                                        <a id="memoryRectangle" href="/product/fullInformation/${productWithNeedMemory.id}">
                                            ${memory}
                                        </a>
                                    </#if>
                                </#if>
                            </#list>
                        </div>

                        <hr class="accent-4 mb-2 mt-0 d-inline-block mx-auto" style="width: 90%; background-color: #4285F4">
                        <p style="font-size: x-large; color: #007bff">${product.price} ₽</p>

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

                        <hr class="accent-4 mb-2 mt-0 d-inline-block mx-auto" style="width: 90%; background-color: #4285F4">
                        <h5 class="card-title text-muted">Производитель:    ${product.brand}</h5>
                        <h5 class="card-title text-muted">Описание:    ${product.description}</h5>
                    </div>
                </div>
            </div>
        </div>


        <div class="card" style="width: 90%; margin-top: 10%">
            <div class="card-body">
                <p class="card-title" style="font-size: x-large; color: #007bff">Характеристики</p>
                <h5 class="card-title text-muted">Страна производитель: ${product.country}</h5>

                <#if product.type.name() = "TELEPHONE">
                    <h5 class="card-title text-muted">Диагональ экрана: ${productService.findByNameAndProduct("screenDiagonal", product).value}</h5>
                    <h5 class="card-title text-muted">Разрешение экрана: ${productService.findByNameAndProduct("screenResolution", product).value}</h5>
                    <h5 class="card-title text-muted">Платформа: ${productService.findByNameAndProduct("platform", product).value}</h5>
                    <h5 class="card-title text-muted">Главная камера: ${productService.findByNameAndProduct("mainCamera", product).value}</h5>
                    <h5 class="card-title text-muted">Фронтальная камера: ${productService.findByNameAndProduct("frontCamera", product).value}</h5>
                    <h5 class="card-title text-muted">Встроенная память: ${productService.findByNameAndProduct("internalMemory", product).value}</h5>

                </#if>

                <#if product.type.name() = "COMPUTER">
                    <h5 class="card-title text-muted">Диагональ экрана: ${productService.findByNameAndProduct("screenDiagonal", product).value}</h5>
                    <h5 class="card-title text-muted">Разрешение экрана: ${productService.findByNameAndProduct("screenResolution", product).value}</h5>
                    <h5 class="card-title text-muted">Встроенная память: ${productService.findByNameAndProduct("internalMemory", product).value}</h5>
                    <h5 class="card-title text-muted">Оперативная память: ${productService.findByNameAndProduct("ram", product).value}</h5>
                    <h5 class="card-title text-muted">Процессор: ${productService.findByNameAndProduct("cpu", product).value}</h5>
                    <h5 class="card-title text-muted">Частота процессора: ${productService.findByNameAndProduct("cpuFrequency", product).value}</h5>
                    <h5 class="card-title text-muted">Количество ядер: ${productService.findByNameAndProduct("countOfCores", product).value}</h5>
                    <h5 class="card-title text-muted">Графический процессор: ${productService.findByNameAndProduct("graphicsProcessor", product).value}</h5>
                    <h5 class="card-title text-muted">Год релиза: ${productService.findByNameAndProduct("yearRelease", product).value}</h5>
                </#if>

                <#if product.type.name() = "NOTEBOOK">
                    <h5 class="card-title text-muted">Диагональ экрана: ${productService.findByNameAndProduct("screenDiagonal", product).value}</h5>
                    <h5 class="card-title text-muted">Разрешение экрана: ${productService.findByNameAndProduct("screenResolution", product).value}</h5>
                    <h5 class="card-title text-muted">Встроенная память: ${productService.findByNameAndProduct("internalMemory", product).value}</h5>
                    <h5 class="card-title text-muted">Оперативная память: ${productService.findByNameAndProduct("ram", product).value}</h5>
                    <h5 class="card-title text-muted">Процессор: ${productService.findByNameAndProduct("cpu", product).value}</h5>
                    <h5 class="card-title text-muted">Частота процессора: ${productService.findByNameAndProduct("cpuFrequency", product).value}</h5>
                    <h5 class="card-title text-muted">Количество ядер: ${productService.findByNameAndProduct("countOfCores", product).value}</h5>
                    <h5 class="card-title text-muted">Графический процессор: ${productService.findByNameAndProduct("graphicsProcessor", product).value}</h5>
                    <h5 class="card-title text-muted">Год релиза: ${productService.findByNameAndProduct("yearRelease", product).value}</h5>
                </#if>

                <#if product.type.name() = "TV">
                    <h5 class="card-title text-muted">Диагональ экрана: ${productService.findByNameAndProduct("screenDiagonal", product).value}</h5>
                    <h5 class="card-title text-muted">Разрешение экрана: ${productService.findByNameAndProduct("screenResolution", product).value}</h5>
                    <h5 class="card-title text-muted">Год релиза: ${productService.findByNameAndProduct("yearRelease", product).value}</h5>
                    <h5 class="card-title text-muted">Платформа: ${productService.findByNameAndProduct("platform", product).value}</h5>
                    <h5 class="card-title text-muted">Smart-TV: ${productService.findByNameAndProduct("smartTV", product).value}</h5>
                    <h5 class="card-title text-muted">Таймер сна: ${productService.findByNameAndProduct("sleepTimer", product).value}</h5>
                    <h5 class="card-title text-muted">Звук: ${productService.findByNameAndProduct("sound", product).value}</h5>
                    <h5 class="card-title text-muted">Тип пульта ДУ: ${productService.findByNameAndProduct("typeOfRemoteControl", product).value}</h5>
                    <h5 class="card-title text-muted">Размер: ${productService.findByNameAndProduct("size", product).value}</h5>
                    <h5 class="card-title text-muted">Вес: ${productService.findByNameAndProduct("weight", product).value}</h5>
                    <h5 class="card-title text-muted">Количество HDMI портов: ${productService.findByNameAndProduct("countOfHdmiPorts", product).value}</h5>
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
            margin-bottom: 5px;
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

         .round {
             width: 10em;
             height: 10em;
             border: 2px solid red;
             border-radius: 50%;
             background: mistyrose;
         }

        #colorRound{
            width: 2em;
            height: 2em;
            /*border: #424242;*/
            border-radius: 50%;
        }

        #colorRound:hover{
            cursor: pointer;
            box-shadow: 0 0 0 2px white, 0 0 0 4px #79a3e5;
        }

        #memoryRectangle{
            text-decoration: none;
            font-weight: initial;
            /*font-size: small;*/
            text-align: center;
            width: 4em;
            height: 2em;
            box-shadow: 0 0 0 2px #d3d5d3;
            border-radius: 10%;
            color: #2f2e32;
            padding-top: 2px;
            margin-right: 15px;
        }

        #memoryRectangle:hover{
            cursor: pointer;
            box-shadow: 0 0 0 2px #9a979e;
        }
    </style>
</@c.page>


