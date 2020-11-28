<#import "parts/common.ftlh" as c>

<@c.page>
    <#if type = "TELEPHONE">
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Добавление нового телефона</p>
    </#if>

    <#if type ="COMPUTER">
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Добавление нового компьютера</p>
    </#if>

    <#if type ="NOTEBOOK">
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Добавление нового ноутбука</p>
    </#if>

    <#if type ="TV">
        <p style="font-size: xx-large; font-weight: bold; color: #007bff">Добавление нового телевизора</p>
    </#if>

    <br>

    <form action="/product/add" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${type}" name="type">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название модели:</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" placeholder="Название модели" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Количество:</label>
            <div class="col-sm-6">
                <input type="number" name="count" class="form-control" placeholder="Количество" required max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цена:</label>
            <div class="col-sm-6">
                <input type="number" name="price" class="form-control" placeholder="Цена" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цвет:</label>
            <div class="col-sm-6">

                <select name="color" class="form-control" required>
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
                <input type="text" name="brand" class="form-control" placeholder="Производитель" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Страна:</label>
            <div class="col-sm-6">
                <input type="text" name="country" class="form-control" placeholder="Страна" required maxlength="100"/>
            </div>
        </div>

        <#if type = "TELEPHONE">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>
                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" placeholder="Разрешение экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>
                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" placeholder="Диагональ экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Платформа:</label>
                <div class="col-sm-6">
                    <input type="text" name="platform" class="form-control" placeholder="Платформа" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Главная камера:</label>
                <div class="col-sm-6">
                    <input type="text" name="mainCamera" class="form-control" placeholder="Главная камера" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фронтальная камера:</label>
                <div class="col-sm-6">
                    <input type="text" name="frontCamera" class="form-control" placeholder="Фронтальная камера" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
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

        <#if type = "COMPUTER">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" placeholder="Разрешение экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" placeholder="Диагональ экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
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
                    <input type="text" name="ram" class="form-control" placeholder="Оперативная память" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpu" class="form-control" placeholder="Процессор" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpuFrequency" class="form-control" placeholder="Частота процессора" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>

                <div class="col-sm-6">
                    <input type="text" name="countOfCores" class="form-control" placeholder="Количество ядер" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="graphicsProcessor" class="form-control" placeholder="Графический процессор" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" placeholder="Год выпуска" required maxlength="100"/>
                </div>
            </div>
        </#if>



        <#if type = "NOTEBOOK">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" placeholder="Разрешение экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" placeholder="Диагональ экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
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
                    <input type="text" name="ram" class="form-control" placeholder="Оперативная память" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpu" class="form-control" placeholder="Процессор" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>

                <div class="col-sm-6">
                    <input type="text" name="cpuFrequency" class="form-control" placeholder="Частота процессора" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>

                <div class="col-sm-6">
                    <input type="text" name="countOfCores" class="form-control" placeholder="Количество ядер" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>

                <div class="col-sm-6">
                    <input type="text" name="graphicsProcessor" class="form-control" placeholder="Графический процессор" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" placeholder="Год выпуска" required maxlength="100"/>
                </div>
            </div>
        </#if>


        <#if type = "TV">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenResolution" class="form-control" placeholder="Разрешение экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <input type="text" name="screenDiagonal" class="form-control" placeholder="Диагональ экрана" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <input type="text" name="yearRelease" class="form-control" placeholder="Год выпуска" required maxlength="100"/>
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Операционная система:</label>

                <div class="col-sm-6">
                    <input type="text" name="platform" class="form-control" placeholder="Операционная система" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">smart TV:</label>

                <div class="col-sm-6">
                    <input type="text" name="smartTV" class="form-control" placeholder="smartTV" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Sleep-таймер:</label>

                <div class="col-sm-6">
                    <input type="text" name="sleepTimer" class="form-control" placeholder="Sleep-таймер" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Звук:</label>

                <div class="col-sm-6">
                    <input type="text" name="sound" class="form-control" placeholder="Звук" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Тип дистанционного управления:</label>

                <div class="col-sm-6">
                    <input type="text" name="typeOfRemoteControl" class="form-control" placeholder="Тип дистанционного управления" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Размер:</label>

                <div class="col-sm-6">
                    <input type="text" name="size" class="form-control" placeholder="Размер" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Вес:</label>

                <div class="col-sm-6">
                    <input type="text" name="weight" class="form-control" placeholder="Вес" required maxlength="100"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">HDMI порты:</label>

                <div class="col-sm-6">
                    <input type="text" name="countOfHdmiPorts" class="form-control" placeholder="HDMI порты" required maxlength="100"/>
                </div>
            </div>
        </#if>



        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Описание продукта:</label>

            <div class="col-sm-6">
                <textarea class="form-control" name="description" required maxlength="4294967295"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="btn btn-primary"><input id="fileMulti" type="file" name="file" accept="image/jpeg,image/png" multiple>Выберите файл</label>
        </div>

        <div class="form-group">
            <span id="outputMulti"></span>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit" id="save">Сохранить</button>
    </form>

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

    <style>
        #fileMulti{display:none;}
    </style>

</@c.page>
