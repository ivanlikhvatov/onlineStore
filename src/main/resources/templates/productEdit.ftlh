<#import "parts/common.ftlh" as c>

<@c.page>
    <#if product.type.name() = "TELEPHONE">
        <p style="font-size: large; font-weight: bold; color: #007bff">
            Редактирование информации о смартфоне/телефоне
            ${product.brand}
            ${product.name}
            ${productService.findByNameAndProduct("internalMemory", product).value}
            ${product.color}
        </p>
    </#if>

    <#if product.type.name() ="COMPUTER">
        <p style="font-size: large; font-weight: bold; color: #007bff">
            Редактирование информации о компьютере
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

    <#if product.type.name() ="NOTEBOOK">
        <p style="font-size: large; font-weight: bold; color: #007bff">
            Редактирование информации о ноутбуке
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

    <#if product.type.name() ="TV">
        <p style="font-size: large; font-weight: bold; color: #007bff">
            Редактирование информации о телевизоре
            ${product.brand}
            ${product.name}
            ${productService.findByNameAndProduct("screenDiagonal", product)}
        </p>
    </#if>

    <br>
    <br>

    <form action="${product.id}" method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название модели:</label>

            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" value="${product.name}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Количество:</label>

            <div class="col-sm-6">
                <input type="number" name="count" class="form-control" value="#{product.count}" required max="9223372036854775807" min="0">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цена:</label>

            <div class="col-sm-6">
                <input type="number" name="price" class="form-control" value="#{product.price}" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цвет:</label>

            <div class="col-sm-6">
                <select id="colorSelect" name="color" class="form-control" value="${product.color}" required>
                    <option value="Green">Green</option>

                    <option value="Black">Black</option>

                    <option value="Gold">Gold</option>

                    <option value="White">White</option>

                    <option value="Grey">Grey</option>

                    <option value="Yellow">Yellow</option>

                    <option value="Pink">Pink</option>

                    <option value="Brown">Brown</option>

                    <option value="Orange">Orange</option>

                    <option value="Red">Red</option>

                    <option value="Silver">Silver</option>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Производитель:</label>

            <div class="col-sm-6">
                <input type="text" name="brand" class="form-control" value="${product.brand}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Страна:</label>

            <div class="col-sm-6">
                <input type="text" name="country" class="form-control" value="${product.country}" required maxlength="100"/>
            </div>
        </div>


        <#if product.type.name() = "TELEPHONE">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" value="${productService.findByNameAndProduct("screenResolution", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" value="${productService.findByNameAndProduct("screenDiagonal", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Платформа:</label>

                <div class="col-sm-6">
                    <input type="text" name="platform" class="form-control" value="${productService.findByNameAndProduct("platform", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Главная камера:</label>

                <div class="col-sm-6">
                    <input type="text" name="mainCamera" class="form-control" value="${productService.findByNameAndProduct("mainCamera", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фронтальная камера:</label>

                <div class="col-sm-6">
                    <input type="text" name="frontCamera" class="form-control" value="${productService.findByNameAndProduct("frontCamera", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select id="memorySelect" name="internalMemory" class="form-control" value="${productService.findByNameAndProduct("internalMemory", product).value}" required>
                        <option value="1 gb">1 gb</option>

                        <option value="2 gb">2 gb</option>

                        <option value="4 gb">4 gb</option>

                        <option value="8 gb">8 gb</option>

                        <option value="16 gb">16 gb</option>

                        <option value="32 gb">32 gb</option>

                        <option value="64 gb">64 gb</option>

                        <option value="128 gb">128 gb</option>

                        <option value="256 gb">256 gb</option>

                        <option value="512 gb">512 gb</option>

                        <option value="1024 gb">1024 gb</option>

                        <option value="2048 gb">2048 gb</option>

                        <option value="4096 gb">4096 gb</option>

                        <option value="8192 gb">8192 gb</option>

                        <option value="16384 gb">16384 gb</option>

                        <option value="32768 gb">32768 gb</option>

                        <option value="65536 gb">65536 gb</option>
                    </select>

                </div>
            </div>
        </#if>

        <#if product.type.name() = "COMPUTER">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" value="${productService.findByNameAndProduct("screenResolution", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" value="${productService.findByNameAndProduct("screenDiagonal", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select id="memorySelect" name="internalMemory" class="form-control" value="${productService.findByNameAndProduct("internalMemory", product).value}" required>
                        <option value="1 gb">1 gb</option>

                        <option value="2 gb">2 gb</option>

                        <option value="4 gb">4 gb</option>

                        <option value="8 gb">8 gb</option>

                        <option value="16 gb">16 gb</option>

                        <option value="32 gb">32 gb</option>

                        <option value="64 gb">64 gb</option>

                        <option value="128 gb">128 gb</option>

                        <option value="256 gb">256 gb</option>

                        <option value="512 gb">512 gb</option>

                        <option value="1024 gb">1024 gb</option>

                        <option value="2048 gb">2048 gb</option>

                        <option value="4096 gb">4096 gb</option>

                        <option value="8192 gb">8192 gb</option>

                        <option value="16384 gb">16384 gb</option>

                        <option value="32768 gb">32768 gb</option>

                        <option value="65536 gb">65536 gb</option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Оперативная память:</label>
                <div class="col-sm-6">
                    <input type="text" name="ram" class="form-control" value="${productService.findByNameAndProduct("ram", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>
                <div class="col-sm-6">
                    <input type="text" name="cpu" class="form-control" value="${productService.findByNameAndProduct("cpu", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>
                <div class="col-sm-6">
                    <input type="text" name="cpuFrequency" class="form-control" value="${productService.findByNameAndProduct("cpuFrequency", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>
                <div class="col-sm-6">
                    <input type="text" name="countOfCores" class="form-control" value="${productService.findByNameAndProduct("countOfCores", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>
                <div class="col-sm-6">
                    <input type="text" name="graphicsProcessor" class="form-control" value="${productService.findByNameAndProduct("graphicsProcessor", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>
                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" value="${productService.findByNameAndProduct("yearRelease", product).value}" required maxlength="100"/>
                </div>
            </div>
        </#if>

        <#if product.type.name() = "NOTEBOOK">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" value="${productService.findByNameAndProduct("screenResolution", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" value="${productService.findByNameAndProduct("screenDiagonal", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select id="memorySelect" name="internalMemory" class="form-control" value="${productService.findByNameAndProduct("internalMemory", product).value}" required>
                        <option value="1 gb">1 gb</option>

                        <option value="2 gb">2 gb</option>

                        <option value="4 gb">4 gb</option>

                        <option value="8 gb">8 gb</option>

                        <option value="16 gb">16 gb</option>

                        <option value="32 gb">32 gb</option>

                        <option value="64 gb">64 gb</option>

                        <option value="128 gb">128 gb</option>

                        <option value="256 gb">256 gb</option>

                        <option value="512 gb">512 gb</option>

                        <option value="1024 gb">1024 gb</option>

                        <option value="2048 gb">2048 gb</option>

                        <option value="4096 gb">4096 gb</option>

                        <option value="8192 gb">8192 gb</option>

                        <option value="16384 gb">16384 gb</option>

                        <option value="32768 gb">32768 gb</option>

                        <option value="65536 gb">65536 gb</option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Оперативная память:</label>

                <div class="col-sm-6">
                    <input type="text" name="ram" class="form-control" value="${productService.findByNameAndProduct("ram", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpu" class="form-control" value="${productService.findByNameAndProduct("cpu", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpuFrequency" class="form-control" value="${productService.findByNameAndProduct("cpuFrequency", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>

                <div class="col-sm-6">
                    <input type="text" name="countOfCores" class="form-control" value="${productService.findByNameAndProduct("countOfCores", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="graphicsProcessor" class="form-control" value="${productService.findByNameAndProduct("graphicsProcessor", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" value="${productService.findByNameAndProduct("yearRelease", product).value}" required maxlength="100"/>
                </div>
            </div>
        </#if>

        <#if product.type.name() = "TV">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" value="${productService.findByNameAndProduct("screenResolution", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" value="${productService.findByNameAndProduct("screenDiagonal", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" value="${productService.findByNameAndProduct("yearRelease", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Операционная система:</label>

                <div class="col-sm-6">
                    <input type="text" name="platform" class="form-control" value="${productService.findByNameAndProduct("platform", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">smart TV:</label>

                <div class="col-sm-6">
                    <input type="text" name="smartTV" class="form-control" value="${productService.findByNameAndProduct("smartTV", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Sleep-таймер:</label>

                <div class="col-sm-6">
                    <input type="text" name="sleepTimer" class="form-control" value="${productService.findByNameAndProduct("sleepTimer", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Звук:</label>

                <div class="col-sm-6">
                    <input type="text" name="sound" class="form-control" value="${productService.findByNameAndProduct("sound", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Тип дистанционного управления:</label>

                <div class="col-sm-6">
                    <input type="text" name="typeOfRemoteControl" class="form-control" value="${productService.findByNameAndProduct("typeOfRemoteControl", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Размер:</label>

                <div class="col-sm-6">
                    <input type="text" name="size" class="form-control" value="${productService.findByNameAndProduct("size", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Вес:</label>

                <div class="col-sm-6">
                    <input type="text" name="weight" class="form-control" value="${productService.findByNameAndProduct("weight", product).value}" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">HDMI порты:</label>

                <div class="col-sm-6">
                    <input type="text" name="countOfHdmiPorts" class="form-control" value="${productService.findByNameAndProduct("countOfHdmiPorts", product).value}" required maxlength="100"/>
                </div>
            </div>
        </#if>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Описание продукта:</label>

            <div class="col-sm-6">
                <textarea class="form-control" name="description" required maxlength="4294967295">${product.description}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="btn btn-primary"><input id="fileMulti" type="file" name="file" accept="image/jpeg,image/png" multiple>Выберите файл</label>
        </div>

        <div class="form-group">
            <span id="outputMulti"></span>
        </div>

        <#if product.filesNames?hasContent>
            <div class="form-group">
                <h5>Старые фото</h5>

                <span id="outputMulti">
                    <#list product.filesNames as name>
                        <span>
                            <img class="img-thumbnail" src="/img/${name}">
                        </span>
                    </#list>
                </span>
            </div>
        <#else>
            <p>Нет фотографий</p>
        </#if>

        <input type="hidden" value="${product.id}" name="productId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>

    <style>
        #fileMulti {
            display: none;
        }
    </style>

    <script>
        function handleFileSelectMulti(evt) {
            var files = evt.target.files;
            document.getElementById('outputMulti').innerHTML = "";
            var sumSize = 0;
            for (var i = 0, f; f = files[i]; i++) {

                if (!f.type.match('image.*')) {
                    alert("Только изображения....");
                }
                sumSize += f.size;

                if (sumSize > 30*1024*1024){
                    alert("Превышен допустимый размер файла");
                    $('#fileMulti').val('');
                    break;
                }

                var reader = new FileReader();

                reader.onload = (function (theFile) {
                    return function (e) {
                        var span = document.createElement('span');
                        span.innerHTML = ['<img class="img-thumbnail" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                        document.getElementById('outputMulti').insertBefore(span, null);
                    };
                })(f);

                reader.readAsDataURL(f);
            }
        }

        document.getElementById('fileMulti').addEventListener('change', handleFileSelectMulti, false);
    </script>

    <script>
        window.onload = function setSelect() {
            var memory = '${productService.findByNameAndProduct("internalMemory", product).value}';
            document.getElementById("memorySelect").value=memory;

            var color = '${product.color}';
            document.getElementById("colorSelect").value=color;
        }
    </script>

</@c.page>