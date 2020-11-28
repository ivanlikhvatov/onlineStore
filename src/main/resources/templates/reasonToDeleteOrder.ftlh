<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <h5>${message?ifExists}</h5>

    <p style="font-size: xx-large; font-weight: bold; color: #007bff">Описание причины удаления заказа</p>

    <div>
        Причина удаления заказа:
    </div>


    <form method="post" action="/order/reasonToCanceled">

        <input type="hidden" name="orderId" value="${orderId}">
        <div class="form-group row">
            <div class="col-sm-6">
                <textarea class="form-control" name="reason" cols="80" rows="8" required maxlength="100000"></textarea>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-danger">Удалить заказ</button>
    </form>
</@c.page>


