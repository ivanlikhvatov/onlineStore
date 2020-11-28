<#import "parts/common.ftlh" as c>

<@c.page>
    <p style="font-size: xx-large; font-weight: bold; color: #007bff">${username}, Ваш заказ №${orderId} принят</p>

    <br>

    На указанный почтовый адрес отправлено письмо с подтверждением заказа. В случае необходимости наш оператор позвонит Вам для уточнения деталей заказа.
    Вся информация о заказе теперь доступна в <a href="/order/list/ACTIVE">мои заказы</a>.
</@c.page>