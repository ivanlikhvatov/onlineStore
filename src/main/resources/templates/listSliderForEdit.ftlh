<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>Выберите слайдер, который который хотите редактировать</h5>
    <br>
    <#list sliders as slider>
        <a href="/slider/${slider.id}">${slider.name}</a></td>
    </#list>
</@c.page>