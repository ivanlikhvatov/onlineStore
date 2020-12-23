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
                <select name="name" class="form-control" required>
                    <#list directoryRepo.findAllByName("name") as directory>
                        <option value="${directory.value}">${directory.value}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group dropright" id="plus">
                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                         class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd"
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>

                <div class="dropdown-menu p-4" style="min-width: 300px">
                    <div class="directoryForm form-group">
                        <label for="attributeValue">Введите новое значение</label>
                        <input type="text" class="form-control" nameAttr="name" id="attributeValue">
                    </div>

                    <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                    <div>
                        <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                    </div>

                    <div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list directoryRepo.findAllByName("name") as directory>
                                <tr>
                                    <td>${directory.name}</td>
                                    <td>${directory.value}</td>
                                    <td>
                                        <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                 fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                <path fill-rule="evenodd"
                                                      d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Количество:</label>
            <div class="col-sm-6">
                <input type="number" name="count" class="form-control" placeholder="Количество" required
                       max="9223372036854775807" min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цена:</label>
            <div class="col-sm-6">
                <input type="number" name="price" class="form-control" placeholder="Цена" required max="2147483647"
                       min="0"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Цвет:</label>

            <div class="col-sm-6">
                <select name="color" class="form-control" required>
                    <#list directoryRepo.findAllByName("color") as directory>
                        <option value="${directory.value}">${directory.value}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group dropright" id="plus">
                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                         class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd"
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>

                <div class="dropdown-menu p-4" style="min-width: 300px">
                    <div class="directoryForm form-group">
                        <label for="attributeValue">Введите новое значение</label>
                        <input type="text" class="form-control" nameAttr="color" id="attributeValue">
                    </div>

                    <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                    <div>
                        <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                    </div>

                    <div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list directoryRepo.findAllByName("color") as directory>
                                <tr>
                                    <td>${directory.name}</td>
                                    <td>${directory.value}</td>
                                    <td>
                                        <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                 fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                <path fill-rule="evenodd"
                                                      d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Производитель:</label>

            <div class="col-sm-6">
                <select name="brand" class="form-control" required>
                    <#list directoryRepo.findAllByName("brand") as directory>
                        <option value="${directory.value}">${directory.value}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group dropright" id="plus">
                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                         class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd"
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>

                <div class="dropdown-menu p-4" style="min-width: 300px">
                    <div class="directoryForm form-group">
                        <label for="attributeValue">Введите новое значение</label>
                        <input type="text" class="form-control" nameAttr="brand" id="attributeValue">
                    </div>

                    <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                    <div>
                        <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                    </div>

                    <div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list directoryRepo.findAllByName("brand") as directory>
                                <tr>
                                    <td>${directory.name}</td>
                                    <td>${directory.value}</td>
                                    <td>
                                        <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                 fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                <path fill-rule="evenodd"
                                                      d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Страна:</label>

            <div class="col-sm-6">
                <select name="country" class="form-control" required>
                    <#list directoryRepo.findAllByName("country") as directory>
                        <option value="${directory.value}">${directory.value}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group dropright" id="plus">
                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                         class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd"
                              d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </a>

                <div class="dropdown-menu p-4" style="min-width: 300px">
                    <div class="directoryForm form-group">
                        <label for="attributeValue">Введите новое значение</label>
                        <input type="text" class="form-control" nameAttr="country" id="attributeValue">
                    </div>

                    <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                    <div>
                        <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                    </div>

                    <div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Value</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list directoryRepo.findAllByName("country") as directory>
                                <tr>
                                    <td>${directory.name}</td>
                                    <td>${directory.value}</td>
                                    <td>
                                        <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                 fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                      d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                <path fill-rule="evenodd"
                                                      d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <#if type = "TELEPHONE">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <select name="screenResolution" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenResolution") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenResolution" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenResolution") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <select name="screenDiagonal" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenDiagonal" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Платформа:</label>

                <div class="col-sm-6">
                    <select name="platform" class="form-control" required>
                        <#list directoryRepo.findAllByName("platform") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="platform" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("platform") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Главная камера:</label>

                <div class="col-sm-6">
                    <select name="mainCamera" class="form-control" required>
                        <#list directoryRepo.findAllByName("mainCamera") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="mainCamera" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("mainCamera") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фронтальная камера:</label>

                <div class="col-sm-6">
                    <select name="frontCamera" class="form-control" required>
                        <#list directoryRepo.findAllByName("frontCamera") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="frontCamera" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("frontCamera") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
                        <#list directoryRepo.findAllByName("internalMemory") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="internalMemory" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("internalMemory") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </#if>

        <#if type = "COMPUTER">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <select name="screenResolution" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenResolution") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenResolution" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenResolution") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <select name="screenDiagonal" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenDiagonal" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
                        <#list directoryRepo.findAllByName("internalMemory") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="internalMemory" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("internalMemory") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Оперативная память:</label>

                <div class="col-sm-6">
                    <select name="ram" class="form-control" required>
                        <#list directoryRepo.findAllByName("ram") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="ram" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("ram") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>

                <div class="col-sm-6">
                    <select name="cpu" class="form-control" required>
                        <#list directoryRepo.findAllByName("cpu") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="cpu" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="cpu">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("cpu") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>

                <div class="col-sm-6">
                    <select name="cpuFrequency" class="form-control" required>
                        <#list directoryRepo.findAllByName("cpuFrequency") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="cpuFrequency" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="cpuFrequency">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("cpuFrequency") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>

                <div class="col-sm-6">
                    <select name="countOfCores" class="form-control" required>
                        <#list directoryRepo.findAllByName("countOfCores") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="countOfCores" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="countOfCores">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("countOfCores") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>

                <div class="col-sm-6">
                    <select name="graphicsProcessor" class="form-control" required>
                        <#list directoryRepo.findAllByName("graphicsProcessor") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="graphicsProcessor" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="graphicsProcessor">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("graphicsProcessor") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <select name="yearRelease" class="form-control" required>
                        <#list directoryRepo.findAllByName("yearRelease") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="yearRelease" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="yearRelease">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("yearRelease") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </#if>



        <#if type = "NOTEBOOK">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <select name="screenResolution" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenResolution") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenResolution" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="screenResolution">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenResolution") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <select name="screenDiagonal" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenDiagonal" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="screenDiagonal">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Встроенная память:</label>

                <div class="col-sm-6">
                    <select name="internalMemory" class="form-control" required>
                        <#list directoryRepo.findAllByName("internalMemory") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="internalMemory" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="internalMemory">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("internalMemory") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Оперативная память:</label>

                <div class="col-sm-6">
                    <select name="ram" class="form-control" required>
                        <#list directoryRepo.findAllByName("ram") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="ram" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="ram">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("ram") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Процессор:</label>

                <div class="col-sm-6">
                    <select name="cpu" class="form-control" required>
                        <#list directoryRepo.findAllByName("cpu") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="cpu" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="cpu">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("cpu") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Частота процессора:</label>

                <div class="col-sm-6">
                    <select name="cpuFrequency" class="form-control" required>
                        <#list directoryRepo.findAllByName("cpuFrequency") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="cpuFrequency" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="cpuFrequency">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("cpuFrequency") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Количество ядер:</label>

                <div class="col-sm-6">
                    <select name="countOfCores" class="form-control" required>
                        <#list directoryRepo.findAllByName("countOfCores") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="countOfCores" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="countOfCores">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("countOfCores") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Графический процессор:</label>

                <div class="col-sm-6">
                    <select name="graphicsProcessor" class="form-control" required>
                        <#list directoryRepo.findAllByName("graphicsProcessor") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="graphicsProcessor" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="graphicsProcessor">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("graphicsProcessor") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <select name="yearRelease" class="form-control" required>
                        <#list directoryRepo.findAllByName("yearRelease") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="yearRelease" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="yearRelease">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("yearRelease") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </#if>


        <#if type = "TV">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Разрешение экрана:</label>

                <div class="col-sm-6">
                    <select name="screenResolution" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenResolution") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenResolution" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="screenResolution">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenResolution") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Диагональ экрана:</label>

                <div class="col-sm-6">
                    <select name="screenDiagonal" class="form-control" required>
                        <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="screenDiagonal" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="screenDiagonal">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("screenDiagonal") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Год выпуска:</label>

                <div class="col-sm-6">
                    <select name="yearRelease" class="form-control" required>
                        <#list directoryRepo.findAllByName("yearRelease") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="yearRelease" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="yearRelease">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("yearRelease") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Операционная система:</label>

                <div class="col-sm-6">
                    <select name="platform" class="form-control" required>
                        <#list directoryRepo.findAllByName("platform") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="platform" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="platform">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("platform") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">smart TV:</label>

                <div class="col-sm-6">
                    <select name="smartTV" class="form-control" required>
                        <#list directoryRepo.findAllByName("smartTV") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="smartTV" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="smartTV">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("smartTV") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Sleep-таймер:</label>

                <div class="col-sm-6">
                    <select name="sleepTimer" class="form-control" required>
                        <#list directoryRepo.findAllByName("sleepTimer") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="sleepTimer" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="sleepTimer">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("sleepTimer") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Звук:</label>

                <div class="col-sm-6">
                    <select name="sound" class="form-control" required>
                        <#list directoryRepo.findAllByName("sound") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="sound" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="sound">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("sound") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Тип дистанционного управления:</label>

                <div class="col-sm-6">
                    <select name="typeOfRemoteControl" class="form-control" required>
                        <#list directoryRepo.findAllByName("typeOfRemoteControl") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="typeOfRemoteControl" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="typeOfRemoteControl">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("typeOfRemoteControl") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
                    <select name="countOfHdmiPorts" class="form-control" required>
                        <#list directoryRepo.findAllByName("countOfHdmiPorts") as directory>
                            <option value="${directory.value}">${directory.value}</option>
                        </#list>
                    </select>
                </div>

                <div class="form-group dropright" id="plus">
                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                             class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd"
                                  d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </a>

                    <div class="dropdown-menu p-4" style="min-width: 300px">
                        <div class="directoryForm form-group">
                            <label for="attributeValue">Введите новое значение</label>
                            <input type="text" class="form-control" nameAttr="countOfHdmiPorts" id="attributeValue">
                        </div>

                        <a class="addDirectoryAttribute btn btn-primary" value="countOfHdmiPorts">Добавить</a>

                        <div>
                            <hr class="accent-3 mb-5 mt-4 d-inline-block mx-auto" style="width: 370px; background-color: #424242">
                        </div>

                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list directoryRepo.findAllByName("countOfHdmiPorts") as directory>
                                    <tr>
                                        <td>${directory.name}</td>
                                        <td>${directory.value}</td>
                                        <td>
                                            <a class="deleteDirectoryAttribute" id="minus" value="${directory.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                     fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                          d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                    <path fill-rule="evenodd"
                                                          d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
            <label class="btn btn-primary"><input id="fileMulti" type="file" name="file" accept="image/jpeg,image/png"
                                                  multiple>Выберите файл</label>
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

                if (sumSize > 30 * 1024 * 1024) {
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
        #fileMulti {
            display: none;
        }

        #plus {
            margin-left: 30px;
            margin-top: 7px;
            color: #007bff;
        }

        #plus:hover {
            cursor: pointer;
            color: #0069d9;
        }

        #minus {
            margin-left: 30px;
            margin-top: 7px;
            color: #007bff;
        }

        #minus:hover {
            cursor: pointer;
            color: #0069d9;
        }
    </style>

</@c.page>
