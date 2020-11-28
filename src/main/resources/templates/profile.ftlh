<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя:</label>

            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Имя" value="${username}" maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>

            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.some" value="${email!''}" maxlength="100"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>

            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль" maxlength="100"/>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</@c.page>