<#macro login path isRegisterForm>
    <form action="${path}" method="post">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.some" required maxlength="255"/>
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Имя пользователя:</label>
                <div class="col-sm-6">
                    <input type="text" name="username" class="form-control" placeholder="Имя пользователя" required maxlength="100"/>
                </div>
            </div>
        </#if>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль" required maxlength="100"/>
            </div>
        </div>


        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Создать<#else>Войти</#if></button>
        <#if !isRegisterForm><a class="btn btn-primary" href="/registration">Зарегистрироваться</a></#if>

    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="dropdown-item" type="submit">Выйти</button>
    </form>
</#macro>