<#import "parts/common.ftlh" as c>

<@c.page>

    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Оформление заказа</p>
    <br>
    <p style="font-size: large; font-weight: bold; color: #007bff">На данный момент на сайте действует только оплата при получении</p>
    <br>

    <h5>${message?ifExists}</h5>

    <div class="container">
        <div class="row">
            <div class="col-md-7">


                <form method="post" action="/order/checkout">

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Email:</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control" value="${user.email}" required maxlength="100"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Имя:</label>
                        <div class="col-sm-8">
                            <input type="text" name="userName" class="form-control" value="${user.username}" required maxlength="100"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Телефон:</label>
                        <div class="col-sm-8">
                            <input type="tel" name="phoneNumber" class="form-control" required maxlength="11"/>
                        </div>
                    </div>

                    <fieldset class="form-group">
                        <div class="row">
                            <legend class="col-form-label col-sm-3 pt-0">Способ оплаты:</legend>
                            <div class="col-sm-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="typePay" id="gridRadios1" value="Наличные" checked>
                                    <label class="form-check-label" for="gridRadios1">
                                        Наличные
                                    </label>
                                </div>
                                <div class="form-check disabled">
                                    <input class="form-check-input" type="radio" name="typePay" id="gridRadios3" value="Картой">
                                    <label class="form-check-label" for="gridRadios3">
                                        Картой
                                    </label>
                                </div>
                                <div class="form-check disabled">
                                    <input class="form-check-input" type="radio" name="typePay" id="gridRadios3" value="Онлайн" disabled>
                                    <label class="form-check-label" for="gridRadios3">
                                        Онлайн
                                    </label>
                                </div>
                            </div>
                        </div>
                    </fieldset>



                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Полный адрес:</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" class="form-control" required maxlength="255"/>
                        </div>
                    </div>

                    <#assign sum = 0>
                    <#list basketRepo.findAllByUser(user) as product>
                        <#assign sum = sum + product.count * product.price>
                    </#list>

                    <div style="color: #007bff; font-weight: bold">
                        Итоговая сумма: ${sum} ₽
                    </div>


                    <br>

                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit" style="width: 91.5%">Оформить</button>

                </form>
            </div>

            <div class="col-md-offset-1" style="min-width: 400px">
                <div style="text-align: center">
                    <p style="font-size: large; font-weight: bold; color: #007bff">Ваши товары</p>
                </div>


                <#list products as product>
                    <div class="card mb-3" id="cartCard" style="max-width: 25rem;">
                        <div class="row no-gutters">
                            <div class="col-md-2" style="padding-top: 6px; padding-bottom: 6px">
                                <#if product.type.name() = "COMPUTER" || product.type.name() = "TV" || product.type.name() = "NOTEBOOK">
                                    <img id="carousel-image" src="/img/${product.filesNames[0]}" width="80" style="max-height: 80px" alt="...">
                                </#if>

                                <#if product.type.name() = "TELEPHONE">
                                    <img id="carousel-image" src="/img/${product.filesNames[0]}" height="100" alt="..." style="max-width: 80px">
                                </#if>
                            </div>
                            <div class="col-md-10">
                                <div class="card-body">
                                    <div class="price" style="font-weight: bold; font-size: small; color: #007bff">${product.price} ₽</div>
                                    <#if product.type.name() = "TELEPHONE">
                                        <div class="card-text">
                                            <small class="text-muted" style="font-size: x-small">
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
                                            <small class="text-muted" style="font-size: x-small">
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
                                            <small class="text-muted" style="font-size: x-small">
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

                                    <#if product.type = "TV">
                                        <div class="card-text">
                                            <small class="text-muted" style="font-size: x-small">
                                                Телевизор
                                                ${product.brand}
                                                ${product.name}
                                                ${productService.findByNameAndProduct("yearRelease", product).value}
                                            </small>
                                        </div>
                                    </#if>

                                    <div class="count" style="font-size: small; color: #007bff; font-weight: bold">
                                        <a class="countBlock">${basketRepo.findByUserAndProductId(user, product.id).count} шт</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</@c.page>