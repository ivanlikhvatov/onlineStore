<#import "parts/common.ftlh" as c>

<@c.page>

    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Добавление нового слайдера</p>
    <br>

    <form action="/slider/add" method="post" enctype="multipart/form-data">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название:</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" placeholder="Название" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 1 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription1" class="form-control" placeholder="Верхняя надпись 1 слайд" required max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 1 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription1" class="form-control" placeholder="Нижняя надпись 1 слайд" required max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 2 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription2" class="form-control" placeholder="Верхняя надпись 2 слайд" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 2 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription2" class="form-control" placeholder="Нижняя надпись 2 слайд" required max="2147483647" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 3 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription3" class="form-control" placeholder="Верхняя надпись 3 слайд" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 3 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription3" class="form-control" placeholder="Нижняя надпись 3 слайд" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Верхняя надпись 4 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="topInscription4" class="form-control" placeholder="Верхняя надпись 4 слайд" required maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Нижняя надпись 4 слайд:</label>
            <div class="col-sm-6">
                <input type="text" name="underInscription4" class="form-control" placeholder="Нижняя надпись 4 слайд" required maxlength="100"/>
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
            var files = evt.target.files; // FileList object
            document.getElementById('outputMulti').innerHTML = "";
            var sumSize = 0;
            for (var i = 0, f; f = files[i]; i++) {

                // Only process image files.
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

                // Closure to capture the file information.
                reader.onload = (function (theFile) {
                    return function (e) {
                        // Render thumbnail.
                        var span = document.createElement('span');
                        span.innerHTML = ['<img class="img-thumbnail" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                        document.getElementById('outputMulti').insertBefore(span, null);
                    };
                })(f);

                // Read in the image file as a data URL.
                reader.readAsDataURL(f);
            }
        }

        document.getElementById('fileMulti').addEventListener('change', handleFileSelectMulti, false);
    </script>


    <style>
        #fileMulti{display:none;}
    </style>

</@c.page>
