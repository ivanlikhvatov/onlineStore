<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-md navbar-dark brown stylish-color-dark" id="firstNavbar">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <a class="navbar-brand" href="/">TechPort</a>

            <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>
        </ul>
    </div>

    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/favorites/list">
                        <svg class="bi bi-heart" width="1.7em" height="1.7em" viewBox="0 0 16 16" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                        </svg>
                    </a>
                </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" href="/login">
                        <svg class="bi bi-heart" width="1.7em" height="1.7em" viewBox="0 0 16 16" fill="currentColor"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                        </svg>
                    </a>
                </li>
            </#if>

            <li class="nav-item">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <svg class="bi bi-person-circle" width="1.7em" height="1.7em" viewBox="0 0 16 16"
                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                        <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        <path fill-rule="evenodd"
                              d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                    </svg>
                </a>

                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <#if !user??>
                        <button class="dropdown-item" onclick="document.location='/login'">Войти</button>
                        <button class="dropdown-item" onclick="document.location='/registration'">Зарегистрироваться</button>
                    </#if>

                    <#if user??>
                        <button class="dropdown-item" onclick="document.location='/user/profile'">Профиль</button>
                        <#if !isAdmin>
                            <button class="dropdown-item" onclick="document.location='/order/list/ACTIVE'">Мои заказы</button>
                        </#if>
                    </#if>

                    <#if isAdmin>
                        <button class="dropdown-item" onclick="document.location='/user'">Список всех пользователей</button>
                        <button class="dropdown-item" onclick="document.location='/order/list/ACTIVE'">Список заказов</button>
                        <button class="dropdown-item" onclick="document.location='/product/deleted/list'">Список удаленных товаров</button>
                        <button class="dropdown-item" onclick="document.location='/listProductForAdd'">Добавить товар</button>
                        <button class="dropdown-item" onclick="document.location='/slider/add'">Добавить слайдер</button>
                        <button class="dropdown-item" onclick="document.location='/listProductForEdit'">Редактировать данные о товаре</button>
                        <button class="dropdown-item" onclick="document.location='/slider/list'">Редактировать слайдер</button>
                        <button class="dropdown-item" onclick="document.location='/report'">Продажи</button>
                    </#if>

                    <#if user??>
                        <@l.logout/>
                    </#if>
                </div>
            </li>
        </ul>
    </div>
</nav>

<nav class="navbar navbar-expand-md navbar-dark primary-color bg-company-red">
    <div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/">
                    <svg class="bi bi-list" width="2.2em" height="2em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </a>
            </li>
        </ul>
    </div>

    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2 nav justify-content-center">
        <ul class="navbar-nav nav nav-pills nav-fill" id="uli">
            <li class="nav-item">
                <a class="nav-link" style="font-size: large;margin-left: 10px;" href="/product/${"TELEPHONE"}/list">Телефоны</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: large; margin-left: 10px;" href="/product/${"COMPUTER"}/list">Компьютеры</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" style="font-size: large; margin-left: 10px;" href="/product/${"NOTEBOOK"}/list">Ноутбуки</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" style="font-size: large; margin-left: 10px;" href="/product/${"TV"}/list">Телевизоры</a>
            </li>
        </ul>
    </div>

    <div>
        <ul class="navbar-nav">
            <li class="nav-item">
                <div class="btn" style="width: 150px; background-color: #7b1fa2">
                    <a href="/basket" style="color: white; text-decoration: none">
                        <#if user?? && user.isEnabled()>
                            <span>
                                <svg class="bi bi-cart" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                </svg>
                            </span>

                            <span style="position: relative; bottom: 3px">
                                <#if basketRepo.findAllByUser(user)??>
                                    <#assign count = 0>
                                    <#list basketRepo.findAllByUser(user) as product>
                                        <#assign count = count + product.count>
                                    </#list>
                                    <span style="position: relative; bottom: 1px">
                                        <span>#{count}</span>
                                        <#if count % 10 = 1 && count % 100 != 11>
                                            товар
                                        <#elseif (count % 10 = 2 || count % 10 = 3 || count % 10 = 4) && (count % 100 != 12 && count % 100 != 13 && count % 100 != 14)>
                                            товара
                                        <#else>
                                            товаров
                                        </#if>
                                    </span>
                                </#if>
                            </span>
                        <#else>
                            <span>
                                    <svg class="bi bi-cart" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                    </svg>
                                </span>

                            <span style="position: relative; bottom: 3px">
                                    <span>0</span> товаров
                                </span>
                        </#if>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<style>
    #uli {
        width: 40%;
    }

    .dropdown-toggle::after {
        margin-bottom: 6px;
    }
</style>


