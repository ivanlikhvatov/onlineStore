<#import "parts/common.ftlh" as c>

<@c.page>

    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Редактирование слайдера</p>
    <br>

    <form action="${slider.id}" method="post" enctype="multipart/form-data">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название:</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" value="${slider.name}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 1 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription1" class="form-control" value="${slider.topInscription1}" required max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 1 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription1" class="form-control" value="${slider.underInscription1}" required max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 2 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription2" class="form-control" value="${slider.topInscription2}" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 2 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription2" class="form-control" value="${slider.underInscription2}" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 3 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription3" class="form-control" value="${slider.topInscription3}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 3 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription3" class="form-control" value="${slider.underInscription3}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 4 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription4" class="form-control" value="${slider.topInscription4}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 4 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription4" class="form-control" value="${slider.underInscription4}" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group">
            <label class="btn btn-primary"><input id="fileMulti" type="file" name="file" accept="image/jpeg,image/png" multiple>Выберите файл</label>
        </div>

        <div class="form-group">
            <span id="outputMulti"></span>
        </div>

        <#if slider.filesNames?hasContent>
            <div class="form-group">
                <h5>Старые фото</h5>

                <span id="outputMulti">
                    <#list slider.filesNames as name>
                        <span>
                            <img class="img-thumbnail" src="/img/${name}">
                        </span>
                    </#list>
                </span>
            </div>
        <#else>
            <p>Нет фотографий</p>
        </#if>

        <input type="hidden" value="${slider.id}" name="sliderId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button class="btn btn-primary" type="submit">Сохранить</button>
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
