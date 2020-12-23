<#import "parts/common.ftlh" as c>

<@c.page>
    <#if start?hasContent && end?hasContent>
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Отчет по продажам c ${start} по ${end}</p>
    <#elseIf (start?hasContent)>
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Отчет по продажам c ${start}</p>
    <#elseIf (end?hasContent)>
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Отчет по продажам по ${end}</p>
    <#else>
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Отчет по продажам за текущий год</p>
    </#if>

    <div class="form-group mt-5 mb-5">
        <form class="form-inline" method="get" action="/report">
            <div class="row">
                <div class="row ml-4">
                    <label class="col-sm-2 col-form-label">Начало:</label>
                    <div class="col-sm-5">
                        <input class="form-control" type="date" name="start" value="${start?ifExists}">
                    </div>
                </div>

                <div class="row ml-5">
                    <label class="col-sm-2 col-form-label">Конец:</label>
                    <div class="col-sm-5">
                        <input class="form-control" type="date" name="end" value="${end?ifExists}">
                    </div>
                </div>
            </div>

            <button class="btn btn-primary ml-2" type="submit">Поиск</button>
        </form>
    </div>


    <div align="center" style="width: 1000px;">
        <p style="font-size: x-large; font-weight: normal; color: #2f2e32">Продажи по месяцам</p>
        <div id="rectangle1"></div>
        <div id="circle1" style="width: 900px; height: 500px;"></div>
    </div>

    <div align="center" style="width: 1000px;">
        <p style="font-size: x-large; font-weight: normal; color: #2f2e32">Популярные товары</p>
        <div id="rectangle2"></div>
        <div id="circle2" style="width: 900px; height: 500px;"></div>
    </div>

    <script>
        window.onload = function () {
            var currentYearMoneyProfit = new Map();
            var currentYearCountProfit = new Map();
            var currentYearProductMoneyProfit = new Map();
            var currentYearProductCountProfit = new Map();

            <#list currentYearMoneyProfit as key, value>
            currentYearMoneyProfit.set('${key}', #{value})
            </#list>

            <#list currentYearCountProfit as key, value>
            currentYearCountProfit.set('${key}', #{value})
            </#list>

            <#list currentYearProductMoneyProfit as key, value>
            var res;

            <#if orderService.findProductById(key).type.name() == "TELEPHONE">
            res = '${orderService.findProductById(key).brand} ${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "COMPUTER">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("cpu", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("ram", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("graphicsProcessor", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "NOTEBOOK">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("cpu", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("ram", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("graphicsProcessor", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "TV">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value}'
            </#if>

            currentYearProductMoneyProfit.set(res, #{value})
            </#list>

            <#list currentYearProductCountProfit as key, value>
            var res;

            <#if orderService.findProductById(key).type.name() == "TELEPHONE">
            res = '${orderService.findProductById(key).brand} ${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "COMPUTER">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("cpu", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("ram", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("graphicsProcessor", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "NOTEBOOK">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("cpu", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("ram", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("internalMemory", orderService.findProductById(key)).value} ' +
                '${productService.findByNameAndProductId("graphicsProcessor", orderService.findProductById(key)).value} ' +
                '${orderService.findProductById(key).color}'
            </#if>

            <#if orderService.findProductById(key).type.name() == "TV">
            res = '${orderService.findProductById(key).brand} ' +
                '${orderService.findProductById(key).name} ' +
                '${productService.findByNameAndProductId("screenDiagonal", orderService.findProductById(key)).value}'
            </#if>


            currentYearProductCountProfit.set(res, #{value})
            </#list>


            $(document).ready(function () {
                google.charts.load('current', {
                    packages: ['corechart', 'bar']
                });
                google.charts.setOnLoadCallback(rectangle1Chart);
                google.charts.setOnLoadCallback(circle1Chart);
                google.charts.setOnLoadCallback(rectangle2Chart);
                google.charts.setOnLoadCallback(circle2Chart);
            });

            function rectangle1Chart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Year');
                data.addColumn('number', 'Сумма');

                currentYearMoneyProfit.forEach(function (value, key) {
                    data.addRow([key.toString(), value]);
                });

                var options = {
                    title: 'Прибыль за каждый месяц',
                    hAxis: {
                        title: 'Месяц',
                    },
                    vAxis: {
                        title: 'Прибыль в рублях'
                    }
                };
                var chart = new google.visualization.ColumnChart(document
                    .getElementById('rectangle1'));
                chart.draw(data, options);
            }

            function circle1Chart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Месяц');
                data.addColumn('number', 'Views');
                currentYearCountProfit.forEach(function (value, key) {
                    data.addRow([key.toString(), value]);
                });
                var options = {
                    title: 'Количество проданных товаров'
                };
                var chart = new google.visualization.PieChart(document
                    .getElementById('circle1'));
                chart.draw(data, options);
            }


            function rectangle2Chart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Year');
                data.addColumn('number', 'Сумма');

                currentYearProductMoneyProfit.forEach(function (value, key) {
                    data.addRow([key.toString(), value]);
                });

                var options = {
                    title: 'Прибыль от каждого товара',
                    hAxis: {
                        title: 'Товар',
                    },
                    vAxis: {
                        title: 'Прибыль в рублях'
                    }
                };
                var chart = new google.visualization.ColumnChart(document
                    .getElementById('rectangle2'));
                chart.draw(data, options);
            }

            function circle2Chart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Месяц');
                data.addColumn('number', 'Views');
                currentYearProductCountProfit.forEach(function (value, key) {
                    data.addRow([key.toString(), value]);
                });
                var options = {
                    title: 'Количество проданного товара каждого типа'
                };
                var chart = new google.visualization.PieChart(document
                    .getElementById('circle2'));
                chart.draw(data, options);
            }
        }


    </script>





</@c.page>