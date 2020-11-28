<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>Список пользователей</h5>
    <br>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form class="form-inline" method="get" action="/user">
                <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                       placeholder="Поиск по имени">
                <button class="btn btn-primary ml-2" type="submit">Поиск</button>
            </form>
        </div>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
        </tbody>
    </table>
</@c.page>