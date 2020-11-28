<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>User editor</h5>

    <br>

    <form action="/user" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <br>
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</@c.page>