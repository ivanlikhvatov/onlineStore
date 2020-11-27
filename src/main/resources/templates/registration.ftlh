<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h5>${message?ifExists}</h5>
    <br>
    <@l.login "/registration" true/>
</@c.page>