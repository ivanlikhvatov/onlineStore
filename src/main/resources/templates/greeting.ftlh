<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
    <#if mainSlider?has_content>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" style="border: #007bff">
                <div class="carousel-item active" style="text-align: center">
                    <img height="500" src="/img/${mainSlider.filesNames[0]}" alt="Первый слайд">
                    <div class="carousel-caption d-none d-md-block" style="color: #64b5f6;top: 82%">
                        <h3>${mainSlider.topInscription1}</h3>
                        <p>${mainSlider.underInscription1}</p>
                    </div>
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img height="500" src="/img/${mainSlider.filesNames[1]}" alt="Второй слайд">
                    <div class="carousel-caption d-none d-md-block" style="color: #ffbb33; bottom: 9%">
                        <h3>${mainSlider.topInscription2}</h3>
                        <p>${mainSlider.underInscription2}</p>
                    </div>
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img height="500" src="/img/${mainSlider.filesNames[2]}" alt="Третий слайд">
                    <div class="carousel-caption d-none d-md-block" style="color: #33b5e5">
                        <h3>${mainSlider.topInscription3}</h3>
                        <p>${mainSlider.underInscription3}</p>
                    </div>
                </div>
                <div class="carousel-item" style="text-align: center">
                    <img height="500" src="/img/${mainSlider.filesNames[3]}" alt="Четвертый слайд">
                    <div class="carousel-caption d-none d-md-block" style="color: #2BBBAD">
                        <h3>${mainSlider.topInscription4}</h3>
                        <p>${mainSlider.underInscription4}</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </#if>



    <div style="margin-top: 10%; text-align: center">
        <p style="font-size: xx-large; font-weight: bold; color: #3E4551">Товары в тренде</p>
    </div>


    <div class="row" style="margin-top: 5%">


        <div class="col-md-6 col-xl-3 mb-lg-4">
            <div class="card">
                <img class="card-img" height="400" src="/img/iphone11proList.jpg" alt="...">

                <div class="card-img-overlay" style="margin-top: 120%; text-align: center">
                    <h5 style="color: #3F729B"><a class="text-info" href="/product/iPhone 11 Pro/list" style="text-decoration: none">iPhone 11 Pro</a> </h5>
                    <p style="color: #4B515D; font-size: large">от 89990 ₽</p>
                </div>
            </div>
        </div>




        <div class="col-md-6 col-xl-6 mb-lg-4">
            <div class="card">
                <img class="card-img" height="400" src="/img/galaxyA71List.jpeg" alt="...">

                <div class="card-img-overlay" style="margin-top: 56%; text-align: center">
                    <h5 style="color: #3F729B"><a class="text-info" href="/product/Galaxy A71/list" style="text-decoration: none">Galaxy A71</a> </h5>
                    <p style="color: #4B515D; font-size: large">от 26990 ₽</p>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-xl-3 mb-lg-4">
            <div class="card">
                <img class="card-img" height="250" style="margin-top: 70px; margin-bottom: 80px" src="/img/iphone11List.jpg" alt="...">

                <div class="card-img-overlay" style="margin-top: 120%; text-align: center">
                    <h5 style="color: #3F729B"><a class="text-info" href="/product/iPhone 11/list" style="text-decoration: none">iPhone 11</a> </h5>
                    <p style="color: #4B515D; font-size: large">от 59990 ₽</p>
                </div>
            </div>
        </div>
    </div>
</@c.page>
