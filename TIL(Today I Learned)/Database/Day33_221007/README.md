# 📚 Day33_221007

Author: 고범종
Created Time: 2022년 10월 7일 오전 8:49
Status: 🖨 Published
Updated Time: 2022년 10월 7일 오후 6:52

# 1. HTML

## 가상선택자

## Class, ID 선택자 (클래스와 아이디)

*.hong	{color: blue} /* . 만든것은 class적용 page에 여러개 적용*/

#kglim {color: gold} /* # 만든것은 id적용 page에 1개만 적용 */*

## Table

## List

## Float

## Semantic web

![https://user-images.githubusercontent.com/92353613/194453958-a91ef861-e829-45af-b913-58c4f377aa72.png](https://user-images.githubusercontent.com/92353613/194453958-a91ef861-e829-45af-b913-58c4f377aa72.png)

## Float, div

```html
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>영역을 정의하는 div와 float</title>
</head>

<body>
    <div style="width: 100px; height:100px; background-color: yellow;"></div>
    <div style="width: 100px; height:100px; background-color: red;"></div>
    <div style="width: 100px; height:100px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 120px; height:100px; background-color: red;"></div>
    <div style="width: 100px; height:100px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 100px; height:100px; background-color: red; float: left"></div>
    <div style="width: 220px; height:100px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 100px; height:100px; background-color: red; float: left"></div>
    <div style="width: 100px; height:100px; background-color: blue; float: left"></div>
</body>

</html>
```

[출력]

![https://user-images.githubusercontent.com/92353613/194457366-cb0f2b8c-f33c-404e-8c34-38d3a72563f8.png](https://user-images.githubusercontent.com/92353613/194457366-cb0f2b8c-f33c-404e-8c34-38d3a72563f8.png)

## **HTML Forms**

form 태그는 전송을 담당하는 태그 (클라이언트가 입력한 데이터를 가지고 서버로 가기)

## GET방식 POST방식

Ex12_Form_Input.html

<option value="2022">2022년</option> <!-- 옵션은 내부적으로 배열임 -→

# 과제


    ```html
    <!DOCTYPE html>
    <html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-compatible" content="IE=edge">
        <meta property="og:title" content="사는 재미의 발견, 티몬">
        <meta property="og:image" content="http://img3.tmon.kr/cdn3/service_common/OG_img3.png">
        <meta property="og:description" content=" No.1 라이프스타일 커머스 티몬">

        <title>사는 재미의 발견, 티몬</title>

        <meta name="google-site-verification" content="QdQofYukhicF9dhcY_spJY1lIoc9kWxs0FMB9y2UUMg">
        <script type="text/javascript" async=""
            src="https://web-sdk-cdn.singular.net/singular-gtm-interface/latest/singular-gtm-interface.js"></script>
        <script type="text/javascript" async=""
            src="https://www.googletagmanager.com/gtag/js?id=G-9XET9RH0RC&amp;l=dataLayer&amp;cx=c"></script>
        <script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
        <script type="text/javascript" async="" src="https://www.google-analytics.com/plugins/ua/linkid.js"></script>
        <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-56M8BJF"></script>
        <script src="https://connect.facebook.net/signals/config/1506050232762893?v=2.9.84&amp;r=stable" async=""></script>
        <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
        <script async="" src="//www.google-analytics.com/analytics.js"></script>
        <script src="/static/analysis/ga_create.js?v=17f5e9676878d7e6f34868c539aa6b77a4ce3aad"></script>
        <script>
            ga("set", { "dimension17": "v01-32b12ed7-a2ba-4a64-895d-962ee4d08f80-1318007974" });

            ga("send", "pageview");

        </script>
        <!--Granify Script Start!!! -->
        <script src="/static/analysis/granifyManager.js?v=b6cdb50acf5715d49fdcb54483b2180eb21ed821"></script>
        <script>    GranifyManager.init(1088);
            GranifyManager.trackPageView("other");
        </script>
        <!--Granify Script End!!! -->

        <link href="https://img2.tmon.kr/static/img/favi_tmon.ico" rel="shortcut icon">
        <link href="/static/gen/cssl/common_new.css?v=20191107&amp;v=" rel="stylesheet" type="text/css" charset="utf-8">
        <link href="/static/gen/cssl/cs_mem_new.css?v=8210bf7c65fea620469b8398feff4234f4f7c1f8" rel="stylesheet"
            type="text/css" charset="utf-8">
        <link href="/static/fancybox/jquery.fancybox-1.3.4.css?v=20110520" rel="stylesheet" type="text/css" charset="utf-8"
            media="screen">
        <link href="/static/gen/cssl/jquery.mCustomScrollbar.css?v=" rel="stylesheet" type="text/css" charset="utf-8">

        <link href="https://img2.tmon.kr/resources/shared/p/css/shared.css?v2=20211210" rel="stylesheet" type="text/css">

        <script src="/static/js/jquery-1.8.3.min.js"></script>
        <script src="/static/js/jquery.cookie.js"></script>
        <script src="/static/js/jquery.lazyload-1.8.4.min.js"></script>
        <script src="/static/js/jquery.validate.min.js?v=201305071600"></script>
        <script src="/static/fancybox/jquery.fancybox-1.3.4.js"></script>
        <script src="/static/js/jquery.number_format.js?v=2011111915"></script>
        <script src="/static/js/jquery.slides.min.js?v=201305071600"></script>
        <script src="/static/js/jquery.placeholder.js"></script>
        <script src="/static/js/jquery-ui-1.9.2.min.js"></script>
        <!--script src="/static/js/jquery.vticker-min.js"></script//-->
        <script src="/static/common.js?v=20180312012549"></script>
        <script src="/static/js/lz-string-1.3.3-min.js"></script>
        <!--<script src="/static/tl.js" sg:hash></script>-->
        <!--<script src="/static/tab.js" sg:hash></script>-->
        <script src="/static/log.js?v=c00b74c2a2f42ebf809d0bdde355a673e05f3c30"></script>
        <script src="/static/plog.js?v=86791a53fef017bcb4ad7099fb2b57672c80d8c7"></script>
        <script src="/static/js/jquery.mCustomScrollbar.concat.min.js?v=201406021738"></script>
        <script src="/static/jquery.tmpl.min.js"></script>

        <script type="text/javascript">    $(document).ready(function () {
                $('input[placeholder], textarea[placeholder]').placeholder(); // IE placeholder 지원
            });
        </script>

        <!-- Facebook Pixel Code -->
        <script>    function isUnderIE9() {
                var word = "msie ";
                var version = 9;

                var agent = navigator.userAgent.toLowerCase();
                //        var name = navigator.appName;

                var reg = new RegExp(word + "([0-9]{1,})(\\.{0,}[0-9]{0,1})");
                if (reg.exec(agent) != null) {
                    version = parseFloat(RegExp.$1 + RegExp.$2);
                }

                if (version <= 8) {
                    return true;
                }

                return false;
            }

            if (isUnderIE9() == true) {
                window.fbq = function () { };
            } else {
                !function (f, b, e, v, n, t, s) {
                    if (f.fbq) return; n = f.fbq = function () { n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments) }
                        ; if (!f._fbq) f._fbq = n;
                    n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0;
                    t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s)
                }(window,
                    document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
                fbq('init', '1506050232762893'); // Insert your pixel ID here.
                fbq('track', 'PageView');
            }
        </script>
        <!-- DO NOT MODIFY -->
        <!-- End Facebook Pixel Code -->

        <!-- begin additional head -->
        <!-- end additional head -->
        <link href="/static/css/swiper.min.css" rel="stylesheet">
        <script src="/static/js/swiper.min.js"></script>
        <script src="/static/js/jquery.pcSlider.js"></script>
        <script src="/static/js/gnb.js?v=20180130"></script>

        <!-- Global site tag (gtag.js) - Google Ads: 604239000 -->
        <script src="https://www.googletagmanager.com/gtag/js?id=AW-604239000" async=""></script>
        <script>        window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', 'AW-604239000');
            gtag('config', 'G-9XET9RH0RC'); //GA4
        </script>

        <!-- Google Tag Manager -->
        <script>    (function (w, d, s, l, i) {
                w[l] = w[l] || []; w[l].push({
                    'gtm.start':
                        new Date().getTime(), event: 'gtm.js'
                }); var f = d.getElementsByTagName(s)[0],
                    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-56M8BJF');
        </script>
        <!-- End Google Tag Manager -->

        <meta http-equiv="origin-trial"
            content="A7bG5hJ4XpMV5a3V1wwAR0PalkFSxLOZeL9D/YBYdupYUIgUgGhfVJ1zBFOqGybb7gRhswfJ+AmO7S2rNK2IOwkAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjY5NzY2Mzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
        <script type="text/javascript" async=""
            src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/604239000/?random=1665129311299&amp;cv=9&amp;fst=1665129311299&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1067&amp;u_w=1707&amp;u_ah=1036&amp;u_aw=1707&amp;u_cd=24&amp;u_his=9&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oaa50&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Flogin.tmon.co.kr%2Fuser%2Fsignup%2Fform&amp;ref=https%3A%2F%2Flogin.tmon.co.kr%2Fuser%2Fsignup%2Fterm&amp;tiba=%EC%82%AC%EB%8A%94%20%EC%9E%AC%EB%AF%B8%EC%9D%98%20%EB%B0%9C%EA%B2%AC%2C%20%ED%8B%B0%EB%AA%AC&amp;auid=1670376283.1665129305&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
        <script type="text/javascript" src="https://web-sdk-cdn.singular.net/singular-sdk/latest/singular-sdk.js"></script>
        <style type="text/css">
            #wrap {width: 1000px; margin: auto;}
            #header {
                width: 100%;
                padding : 100px 0;
                background: #EB6F28;

    
                font-size: xx-large;
                text-align: center;
                color: white;
            }
            #main {margin-top: 10px;}

            #header_size {
                width: 1000px;
            }
            
            .menu_background {
                width: 100%;
                height: 45px;
                background: rgb(8, 1, 71);
            }

            .menu_select {
                width: 20%;
                padding: 20px;
                background: #EE9E70;
                float: left;
                
                font-size: small;
                text-align: center;
                color: gray;
            }
        
            #m {clear: both;}

            #down{
                width: 100%;
                padding : 30px 0;
                background-color: #EB6F28;
        
                font-size: xx-large;
                text-align: center;
                color: white;
                
            }

            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #EE9E70;
            }

            li {
                float: left;
            }

            li a {
                display: inline-block;
                color: white;
                text-align: center;
                padding: 14px 40px;
                text-decoration: none;
            }

            li a:hover {
            background-color: #B8571F;
            }
        </style>
    </head>

    <body>
        <div id="wrap">
            <div id="header">안녕하세요 1조입니다</div>
            <ul>
                <li><a href="#home">홈</a></li>
                <li><a href="#news">게시판</a></li>
                <li><a href="#contact">Q&A</a></li>
                <li><a href="#about">신고</a></li>
            </ul>
            
                <script src="/static/js/form_tools.js" type="text/javascript"></script>
                    <div class="join_wrap">
                        
                        <div class="join_contain join_form">
                            <!--suppress XmlUnboundNsPrefix -->
                            <!--suppress HtmlFormInputWithoutLabel -->
                            <script src="/static/js/jsbn.js" type="text/javascript"></script>
                            <script src="/static/js/rsa.js" type="text/javascript"></script>
                            <script src="/static/js/sha1.js" type="text/javascript"></script>
                            <script src="/static/js/tmon.passcheck.js?1665129310" type="text/javascript"></script>
                            <script src="/static/js/user/common.js" type="text/javascript"></script>
                            <script src="/static/js/selectbox.min.js" type="text/javascript"></script>

                            <h2 class="join_title">
                                회원정보 입력
                            </h2>
                            <dl class="form_wrap">
                                <dt>아이디</dt>
                                <dd>
                                    <div class="input"><input id="userId" data-bind="id" type="text" placeholder="아이디를 입력해 주세요"
                                            value=""></div>
                                    <p class="msg">영문/숫자 4자 이상을 입력해 주세요.</p>
                                </dd>
                                <dt>비밀번호</dt>
                                <dd>
                                    <div class="input"><input id="userPw" data-bind="password" type="password"
                                            placeholder="비밀번호를 입력해 주세요" maxlength="20"></div>
                                    <p class="msg">8 ~ 20자의 영문 대/소문자, 숫자, 특수문자를 사용하세요.</p>
                                </dd>
                                <dt>비밀번호 재확인</dt>
                                <dd>
                                    <div class="input"><input id="userPwConfirm" data-bind="passwordVerify" type="password"
                                            placeholder="비밀번호를 다시한번 입력해 주세요" maxlength="20"></div>
                                    <p class="msg"></p>
                                </dd>
                                <dt>이름</dt>
                                <dd>
                                    <div class="input"><input id="userName" data-bind="name" type="text" placeholder="이름을 입력해주세요"
                                            value=""></div>
                                    <p class="msg"></p>
                                </dd>
                                <dt>생년월일<span class="no_required">(선택)</span></dt>
                                <dd class="date">
                                    <div class="direct" style="display: none;"><span><input type="text"></span></div>
                                    <div class="uio_select_box year" id="year">
                                        <div class="value"><input id="year_inp" type="hidden" data-onchange="false"><a href="#">년도</a><i
                                                class="ico_arr"></i></div>
                                        <ul class="lst">
                                            <li><a href="#" data-uri="년도">년도</a></li>
                                            <li><a href="#" data-uri="2008">2008</a></li>
                                            <li><a href="#" data-uri="2007">2007</a></li>
                                            <li><a href="#" data-uri="2006">2006</a></li>
                                            <li><a href="#" data-uri="2005">2005</a></li>
                                            <li><a href="#" data-uri="2004">2004</a></li>
                                            <li><a href="#" data-uri="2003">2003</a></li>
                                            <li><a href="#" data-uri="2002">2002</a></li>
                                            <li><a href="#" data-uri="2001">2001</a></li>
                                            <li><a href="#" data-uri="2000">2000</a></li>
                                            <li><a href="#" data-uri="1999">1999</a></li>
                                            <li><a href="#" data-uri="1998">1998</a></li>
                                            <li><a href="#" data-uri="1997">1997</a></li>
                                            <li><a href="#" data-uri="1996">1996</a></li>
                                            <li><a href="#" data-uri="1995">1995</a></li>
                                            <li><a href="#" data-uri="1994">1994</a></li>
                                            <li><a href="#" data-uri="1993">1993</a></li>
                                            <li><a href="#" data-uri="1992">1992</a></li>
                                            <li><a href="#" data-uri="1991">1991</a></li>
                                            <li><a href="#" data-uri="1990">1990</a></li>
                                            <li><a href="#" data-uri="1989">1989</a></li>
                                            <li><a href="#" data-uri="1988">1988</a></li>
                                            <li><a href="#" data-uri="1987">1987</a></li>
                                            <li><a href="#" data-uri="1986">1986</a></li>
                                            <li><a href="#" data-uri="1985">1985</a></li>
                                            <li><a href="#" data-uri="1984">1984</a></li>
                                            <li><a href="#" data-uri="1983">1983</a></li>
                                            <li><a href="#" data-uri="1982">1982</a></li>
                                            <li><a href="#" data-uri="1981">1981</a></li>
                                            <li><a href="#" data-uri="1980">1980</a></li>
                                            <li><a href="#" data-uri="1979">1979</a></li>
                                            <li><a href="#" data-uri="1978">1978</a></li>
                                            <li><a href="#" data-uri="1977">1977</a></li>
                                            <li><a href="#" data-uri="1976">1976</a></li>
                                            <li><a href="#" data-uri="1975">1975</a></li>
                                            <li><a href="#" data-uri="1974">1974</a></li>
                                            <li><a href="#" data-uri="1973">1973</a></li>
                                            <li><a href="#" data-uri="1972">1972</a></li>
                                            <li><a href="#" data-uri="1971">1971</a></li>
                                            <li><a href="#" data-uri="1970">1970</a></li>
                                            <li><a href="#" data-uri="1969">1969</a></li>
                                            <li><a href="#" data-uri="1968">1968</a></li>
                                            <li><a href="#" data-uri="1967">1967</a></li>
                                            <li><a href="#" data-uri="1966">1966</a></li>
                                            <li><a href="#" data-uri="1965">1965</a></li>
                                            <li><a href="#" data-uri="1964">1964</a></li>
                                            <li><a href="#" data-uri="1963">1963</a></li>
                                            <li><a href="#" data-uri="1962">1962</a></li>
                                            <li><a href="#" data-uri="1961">1961</a></li>
                                            <li><a href="#" data-uri="1960">1960</a></li>
                                            <li><a href="#" data-uri="1959">1959</a></li>
                                            <li><a href="#" data-uri="1958">1958</a></li>
                                            <li><a href="#" data-uri="1957">1957</a></li>
                                            <li><a href="#" data-uri="1956">1956</a></li>
                                            <li><a href="#" data-uri="1955">1955</a></li>
                                            <li><a href="#" data-uri="1954">1954</a></li>
                                            <li><a href="#" data-uri="1953">1953</a></li>
                                            <li><a href="#" data-uri="1952">1952</a></li>
                                            <li><a href="#" data-uri="1951">1951</a></li>
                                            <li><a href="#" data-uri="1950">1950</a></li>
                                            <li><a href="#" data-uri="1949">1949</a></li>
                                            <li><a href="#" data-uri="1948">1948</a></li>
                                            <li><a href="#" data-uri="1947">1947</a></li>
                                            <li><a href="#" data-uri="1946">1946</a></li>
                                            <li><a href="#" data-uri="1945">1945</a></li>
                                            <li><a href="#" data-uri="1944">1944</a></li>
                                            <li><a href="#" data-uri="1943">1943</a></li>
                                            <li><a href="#" data-uri="1942">1942</a></li>
                                            <li><a href="#" data-uri="1941">1941</a></li>
                                            <li><a href="#" data-uri="1940">1940</a></li>
                                            <li><a href="#" data-uri="1939">1939</a></li>
                                            <li><a href="#" data-uri="1938">1938</a></li>
                                            <li><a href="#" data-uri="1937">1937</a></li>
                                            <li><a href="#" data-uri="1936">1936</a></li>
                                            <li><a href="#" data-uri="1935">1935</a></li>
                                            <li><a href="#" data-uri="1934">1934</a></li>
                                            <li><a href="#" data-uri="1933">1933</a></li>
                                            <li><a href="#" data-uri="1932">1932</a></li>
                                            <li><a href="#" data-uri="1931">1931</a></li>
                                            <li><a href="#" data-uri="1930">1930</a></li>
                                            <li><a href="#" data-uri="1929">1929</a></li>
                                            <li><a href="#" data-uri="1928">1928</a></li>
                                            <li><a href="#" data-uri="1927">1927</a></li>
                                            <li><a href="#" data-uri="1926">1926</a></li>
                                            <li><a href="#" data-uri="1925">1925</a></li>
                                            <li><a href="#" data-uri="1924">1924</a></li>
                                            <li><a href="#" data-uri="1923">1923</a></li>
                                            <li><a href="#" data-uri="1922">1922</a></li>
                                            <li><a href="#" data-uri="1921">1921</a></li>
                                            <li><a href="#" data-uri="1920">1920</a></li>
                                            <li><a href="#" data-uri="1919">1919</a></li>
                                            <li><a href="#" data-uri="1918">1918</a></li>
                                            <li><a href="#" data-uri="1917">1917</a></li>
                                            <li><a href="#" data-uri="1916">1916</a></li>
                                            <li><a href="#" data-uri="1915">1915</a></li>
                                            <li><a href="#" data-uri="1914">1914</a></li>
                                            <li><a href="#" data-uri="1913">1913</a></li>
                                            <li><a href="#" data-uri="1912">1912</a></li>
                                        </ul>
                                    </div><select id="year" class="year" style="display: none;">
                                        <option>년도</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                        <option value="2002">2002</option>
                                        <option value="2001">2001</option>
                                        <option value="2000">2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                        <option value="1996">1996</option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>
                                        <option value="1965">1965</option>
                                        <option value="1964">1964</option>
                                        <option value="1963">1963</option>
                                        <option value="1962">1962</option>
                                        <option value="1961">1961</option>
                                        <option value="1960">1960</option>
                                        <option value="1959">1959</option>
                                        <option value="1958">1958</option>
                                        <option value="1957">1957</option>
                                        <option value="1956">1956</option>
                                        <option value="1955">1955</option>
                                        <option value="1954">1954</option>
                                        <option value="1953">1953</option>
                                        <option value="1952">1952</option>
                                        <option value="1951">1951</option>
                                        <option value="1950">1950</option>
                                        <option value="1949">1949</option>
                                        <option value="1948">1948</option>
                                        <option value="1947">1947</option>
                                        <option value="1946">1946</option>
                                        <option value="1945">1945</option>
                                        <option value="1944">1944</option>
                                        <option value="1943">1943</option>
                                        <option value="1942">1942</option>
                                        <option value="1941">1941</option>
                                        <option value="1940">1940</option>
                                        <option value="1939">1939</option>
                                        <option value="1938">1938</option>
                                        <option value="1937">1937</option>
                                        <option value="1936">1936</option>
                                        <option value="1935">1935</option>
                                        <option value="1934">1934</option>
                                        <option value="1933">1933</option>
                                        <option value="1932">1932</option>
                                        <option value="1931">1931</option>
                                        <option value="1930">1930</option>
                                        <option value="1929">1929</option>
                                        <option value="1928">1928</option>
                                        <option value="1927">1927</option>
                                        <option value="1926">1926</option>
                                        <option value="1925">1925</option>
                                        <option value="1924">1924</option>
                                        <option value="1923">1923</option>
                                        <option value="1922">1922</option>
                                        <option value="1921">1921</option>
                                        <option value="1920">1920</option>
                                        <option value="1919">1919</option>
                                        <option value="1918">1918</option>
                                        <option value="1917">1917</option>
                                        <option value="1916">1916</option>
                                        <option value="1915">1915</option>
                                        <option value="1914">1914</option>
                                        <option value="1913">1913</option>
                                        <option value="1912">1912</option>
                                    </select>
                                    <div class="direct" style="display: none;"><span><input type="text"></span></div>
                                    <div class="uio_select_box month" id="month">
                                        <div class="value"><input id="month_inp" type="hidden" data-onchange="false"><a href="#">월</a><i
                                                class="ico_arr"></i></div>
                                        <ul class="lst">
                                            <li><a href="#" data-uri="월">월</a></li>
                                            <li><a href="#" data-uri="1">1</a></li>
                                            <li><a href="#" data-uri="2">2</a></li>
                                            <li><a href="#" data-uri="3">3</a></li>
                                            <li><a href="#" data-uri="4">4</a></li>
                                            <li><a href="#" data-uri="5">5</a></li>
                                            <li><a href="#" data-uri="6">6</a></li>
                                            <li><a href="#" data-uri="7">7</a></li>
                                            <li><a href="#" data-uri="8">8</a></li>
                                            <li><a href="#" data-uri="9">9</a></li>
                                            <li><a href="#" data-uri="10">10</a></li>
                                            <li><a href="#" data-uri="11">11</a></li>
                                            <li><a href="#" data-uri="12">12</a></li>
                                        </ul>
                                    </div><select id="month" class="month" style="display: none;">
                                        <option>월</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                    <div class="direct" style="display: none;"><span><input type="text"></span></div>
                                    <div class="uio_select_box day" id="day">
                                        <div class="value"><input id="day_inp" type="hidden" data-onchange="false"><a href="#">일</a><i
                                                class="ico_arr"></i></div>
                                        <ul class="lst">
                                            <li><a href="#" data-uri="일">일</a></li>
                                            <li><a href="#" data-uri="1">1</a></li>
                                            <li><a href="#" data-uri="2">2</a></li>
                                            <li><a href="#" data-uri="3">3</a></li>
                                            <li><a href="#" data-uri="4">4</a></li>
                                            <li><a href="#" data-uri="5">5</a></li>
                                            <li><a href="#" data-uri="6">6</a></li>
                                            <li><a href="#" data-uri="7">7</a></li>
                                            <li><a href="#" data-uri="8">8</a></li>
                                            <li><a href="#" data-uri="9">9</a></li>
                                            <li><a href="#" data-uri="10">10</a></li>
                                            <li><a href="#" data-uri="11">11</a></li>
                                            <li><a href="#" data-uri="12">12</a></li>
                                            <li><a href="#" data-uri="13">13</a></li>
                                            <li><a href="#" data-uri="14">14</a></li>
                                            <li><a href="#" data-uri="15">15</a></li>
                                            <li><a href="#" data-uri="16">16</a></li>
                                            <li><a href="#" data-uri="17">17</a></li>
                                            <li><a href="#" data-uri="18">18</a></li>
                                            <li><a href="#" data-uri="19">19</a></li>
                                            <li><a href="#" data-uri="20">20</a></li>
                                            <li><a href="#" data-uri="21">21</a></li>
                                            <li><a href="#" data-uri="22">22</a></li>
                                            <li><a href="#" data-uri="23">23</a></li>
                                            <li><a href="#" data-uri="24">24</a></li>
                                            <li><a href="#" data-uri="25">25</a></li>
                                            <li><a href="#" data-uri="26">26</a></li>
                                            <li><a href="#" data-uri="27">27</a></li>
                                            <li><a href="#" data-uri="28">28</a></li>
                                            <li><a href="#" data-uri="29">29</a></li>
                                            <li><a href="#" data-uri="30">30</a></li>
                                            <li><a href="#" data-uri="31">31</a></li>
                                        </ul>
                                    </div><select id="day" class="day" style="display: none;">
                                        <option>일</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                </dd>
                                <dt>성별<span class="no_required">(선택)</span></dt>
                                <dd class="two_selector">
                                    <label class="selector"><input type="radio" name="gender" value="M"><span>남자</span></label>
                                    <label class="selector"><input type="radio" name="gender" value="F"><span>여자</span></label>
                                </dd>
                                <dt>이메일</dt>
                                <dd>
                                    <div class="input"><input id="userEmail" data-bind="email" type="text" placeholder="이메일을 입력해주세요"
                                            value=""></div>
                                    <p class="msg">이메일을 입력해주세요.</p>
                                    <button class="btn_send_mail" style="display: none">인증메일 전송하기</button>
                                    <div class="auth_mail_box" style="display: none">
                                        <div class="input">
                                            <input id="certCode" type="text" class="number" maxlength="6" oninput="maxLengthCheck(this)"
                                                placeholder="인증번호">
                                        </div>
                                        <button class="btn_mail_auth">확인</button>
                                    </div>
                                    <p class="msg "></p>
                                </dd>
                            </dl>
                            <div class="banner_supersave">
                                <img src="/static/img/membership/banner_supersave.jpg"
                                    alt="회원가입 완료 후 티몬 유료멤버쉽 ‘슈퍼세이브’ 무료체험권이 14일간 자동 제공됩니다.">
                                <button type="button" class="check_supersave">
                                    <span class="blind">내용보기</span>
                                </button>
                            </div>
                            <!-- 웰컴이벤트 슈퍼세이브 무료체험 레이어 -->
                            <div class="layer_membership type_supersave" style="display:none;">
                                <div class="content">
                                    <button type="button" class="close_layer"><span class="blind">팝업닫기</span></button>
                                    <p class="event_title">웰컴이벤트상세내용</p>
                                    <dl class="event_desc">
                                        <dt>무료체험 기간</dt>
                                        <dd>가입 완료일로부터 14일</dd>
                                        <dt>무료체험 이용상세</dt>
                                        <dd>무료 체험 기간동안 슈퍼세이브회원과 동일한 혜택을 받을 수 있으며 무료 체험권은 1ID 기준 1회에 한하여 제공됩니다. (단, 일부 혜택의 경우 제한이 있을 수
                                            있습니다)</dd>
                                        <dd>본 혜택은 추가과금 / 비용없이 가입일로부터 14일간 혜택이 무료로 제공 되고 기간이후 별도의 해지절차없이 만료됩니다.</dd>
                                        <dd>체험권 기간중 슈퍼세이브 미리 결제딜 구매를 통해 슈퍼세이브혜택을 연장 할 수 있으며, 체험권 종료 후에는 슈퍼세이브 가입딜 구매를 통해 슈퍼세이브에 재가입 할 수
                                            있습니다.</dd>
                                    </dl>
                                </div>
                            </div>
                            <script>    $(function () {
                                    var supersaveLayer = $('div.type_supersave');
                                    $('button.check_supersave, button.close_layer')
                                        .on('click', function () { supersaveLayer.toggle(); });
                                });
                            </script>
                            <!-- // 웰컴이벤트 슈퍼세이브 무료체험 레이어 -->
                            <div class="btns_area">
                                <button class="btn_type1">가입 완료하기</button>
                            </div>

                            <form name="complete" action="/user/welcome" method="post" target="_self">
                                <input type="hidden" name="completeUrl" value="">
                                <input type="hidden" name="returnUrl" value="">
                            </form>

                            <script type="text/javascript">    TMON.selectbox3 = new Selectbox('year', { defaultText: '년도', wrapClass: 'uio_select_box year' });
                                TMON.selectbox4 = new Selectbox('month', { defaultText: '월', wrapClass: 'uio_select_box month' });
                                TMON.selectbox5 = new Selectbox('day', { defaultText: '일', wrapClass: 'uio_select_box day' });
                            </script>

                            <script type="text/javascript">    $(function () {
                                    var pub_key = RSA.getPublicKey("-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu3KwRVS6Buca1RLgV+vb\ne2bEeH5Gl8zmOc8qVO9QpDfoBLrhsgokDY\/nS5aj5GBIAYIkEerV4YvxyR7xshwE\nkuoZUhrmpTxHBGaugy+1WuK\/aQwh61H3byOxSdxX2OGdDmz1U74ZarY5NwB3gd5n\nznKc21e2VpMfgq6EV5dK3bDohcNBmLZlbiF9MkHEQ3+Nry2MUm7T6TAn1\/l\/e7vB\n2N2\/s1aymoXe0BB\/otfokFFRZgRZ9cBK82Ejny7e9RWRWh5Gs2ZswuJlRZJSPq9\/\ncV70vQQ1NiWb9+OSln8592AbjdzIpoB7m7WkhzaMJRA7fnoVkfkQ5c5EcOcml0nH\npwIDAQAB\n-----END PUBLIC KEY-----");
                                    var data = {
                                        user: {
                                            id: null,
                                            password: null,
                                            passwordVerify: null,
                                            userEmail: null,
                                            userEmailHost: null,
                                            email: null,
                                            isYouth: 'Y',
                                            usedAgree: 'Y',
                                            privateAgree: 'Y',
                                            bdYear: null,
                                            bdMonth: null,
                                            bdDate: null,
                                            gender: null,
                                            birthAgree: 'Y',
                                            genderAgree: 'Y',
                                            emailAgree: 'Y',
                                            periodAgree: 'Y',
                                            emailToken: null,
                                            emailCertCode: null,
                                            ts: '1665129310',
                                            hash: 'f537ec3bbc7502af90c27e6000511f7350434331',
                                            snsConnection: '',
                                            returnUrl: '',
                                            completeUrl: '',
                                            snsTp: '',
                                            snsId: '',
                                            memberNm: '',
                                            memberEmail: '',
                                            viewMode: ''
                                        },
                                        valid: {
                                            id: false,
                                            password: false,
                                            passwordVerify: false,
                                            name: false,
                                            email: false
                                        },
                                        alert: {
                                            id: null,
                                            password: null,
                                            passwordVerify: null,
                                            name: null,
                                            email: null
                                        },
                                        setStatus: function ($el, valid, message, alert) {
                                            var $parent = $el.parents('dd');
                                            var $msg = $($parent.find('p.msg')[0]);
                                            $msg.html(message);

                                            if (valid) {
                                                $msg.removeClass('dont');
                                                $parent.find('div.input').addClass('checked');
                                            } else {
                                                $msg.addClass('dont');
                                                $parent.find('div.input').removeClass('checked');
                                            }

                                            this['valid'][$el.data('bind')] = valid;
                                            if (alert != undefined) {
                                                this['alert'][$el.data('bind')] = alert;
                                            } else {
                                                this['alert'][$el.data('bind')] = message;
                                            }

                                            var allValid = true;
                                            for (var key in this['valid']) {
                                                allValid = allValid && this['valid'][key];
                                            }
                                        }
                                    };

                                    $('[data-bind]').on('change', function () {
                                        var $this = $(this);
                                        var bind = $this.data('bind');
                                        if (bind.indexOf('password') === 0 || bind === 'id') {
                                            data.user[bind] = RSA.encrypt($this.val(), pub_key);
                                        } else {
                                            data.user[bind] = $this.val();
                                        }
                                    });

                                    $("#userId").each(function () {
                                        var $this = $(this);
                                        var prevUserId = '';
                                        var checker = function () {
                                            var userId = $this.val();
                                            if (userId !== '' && (prevUserId === userId)) return;
                                            var validate = validateId(userId);
                                            data.setStatus($this, validate.valid, validate.message);
                                            return validate.valid;
                                        };

                                        $this.on('focus', function () {
                                            // prevUserId = $(this).val();
                                        });
                                        $this.on('keyup', checker);
                                        // $(this).on('focusout', checker);
                                        $this.on('blur', function () {
                                            var userId = $this.val();
                                            if (checker && prevUserId !== userId) {
                                                validateDuplicationId(userId, function (status) {
                                                    prevUserId = $this.val();
                                                    data.setStatus($this, status.valid, status.message);
                                                });
                                            }
                                        });
                                        if ($this.val() !== '') {
                                            $this.trigger('change').trigger('blur');
                                        }
                                    });

                                    $('#userPw').each(function () {
                                        var $this = $(this);
                                        var $confirm = $('#userPwConfirm');
                                        $this.on('keyup keypress blur change', function () {
                                            var validate = fnCheckPassword($this.val());
                                            if (validate['isOk']) {
                                                validate['sMessage'] = '사용 가능한 비밀번호 입니다.';
                                            }
                                            data.setStatus($this, validate['isOk'], validate['sMessage']);
                                            $confirm.trigger('keyup')
                                        });

                                        $confirm.each(function () {
                                            $confirm.on('keyup keypress blur change', function () {
                                                var validate;
                                                if ($this.val() !== '' && $confirm.val() === '') {
                                                    validate = { valid: false, message: '필수 입력 정보입니다' };
                                                } else {
                                                    if ($this.val() !== '' && $this.val() === $confirm.val()) {
                                                        validate = { valid: true, message: '' };
                                                    } else if ($confirm.val() !== '') {
                                                        validate = { valid: false, message: '비밀번호가 일치하지 않습니다.' };
                                                    }
                                                }
                                                if (validate) {
                                                    data.setStatus($confirm, validate.valid, validate.message);
                                                }
                                            });
                                        });
                                    });

                                    $('#userName').each(function () {
                                        var $this = $(this);
                                        $this.on('keyup change blur', function (e) {
                                            var validation = validateName($this.val());
                                            data.setStatus($this, false, validation.message);
                                            if (validation.valid && e.type === 'blur') {
                                                $this.val($.trim($this.val()));
                                                data.setStatus($this, true, validation.message);
                                            }
                                        });
                                        if ($this.val() !== '') {
                                            $this.trigger('change').trigger('blur');
                                        }
                                    });

                                    $('dd.date').each(function () {
                                        var $this = $(this);
                                        var $year = $('select.year');
                                        var $month = $('select.month');
                                        var $day = $('select.day');

                                        // <dummy sg:if="$self->viewType === 'pc'">
                                        $year = $('#year_inp');
                                        $month = $('#month_inp');
                                        $day = $('#day_inp');
                                        // </dummy>

                                        var date = new Date();
                                        $this.find('select, input').on('chage', function () {
                                            var year = parseInt($year.val());
                                            var month = parseInt($month.val());
                                            var day = parseInt($day.val());
                                            if (year > 0 && month > 0 && day > 0) {
                                                date.setFullYear(year);
                                                date.setMonth(month - 1);
                                                date.setDate(day);
                                            }
                                            if (data.user.birthAgree === 'Y' && date.getFullYear() === year && date.getMonth() - 1 === month && date.getDate() === day) {
                                                data.user.bdYear = $year.val();
                                                data.user.bdMonth = $month.val();
                                                data.user.bdDate = $day.val();
                                            } else {
                                                data.user.bdYear = '';
                                                data.user.bdMonth = '';
                                                data.user.bdDate = '';
                                            }
                                        });
                                    });

                                    $('input[name="gender"]').on('change', function () {
                                        if (data.user.genderAgree === 'Y') {
                                            data.user.gender = this.value;
                                        }
                                    });

                                    $('#userEmail').each(function () {
                                        var $this = $(this);
                                        var prevEmail = null;

                                        $this.on('keyup change blur', function (e) {
                                            if (prevEmail === $this.val()) return;
                                            var validation = validateEmail($this.val());
                                            data.setStatus($this, false, validation.message);
                                            if (validation.valid) {
                                                if (e.type === 'blur') {
                                                    prevEmail = $this.val();
                                                    $this.val($.trim($this.val()));
                                                    validDuplicateEmail($this.val(), function (validation) {
                                                        data.setStatus($this, validation.valid, validation.message, validation.alert);
                                                        data.user.emailToken = validation.data;
                                                        data.user.emailCertCode = '';
                                                        prevEmail = $this.val();
                                                    });
                                                } else {
                                                    resetCert();
                                                    $('button.btn_send_mail').show();
                                                }
                                            } else {
                                                resetCert();
                                            }
                                        });
                                        if (navigator.userAgent.match(/Android/i)) {
                                            $('#userEmail').on('textInput', function (e) { return e.originalEvent.data.charCodeAt(0) !== 32; });
                                        } else {
                                            $('#userEmail').on('keydown', function (e) { return e.keyCode !== 32; });
                                        }

                                        $('#certCode').on('keyup change blur', function () {
                                            var $certCode = $(this);
                                            if ($certCode.val().length === 6) {
                                                $certCode.parent('div').addClass('checked');
                                                $('button.btn_mail_auth').removeAttr('disabled');
                                            } else {
                                                $certCode.parent('div').removeClass('checked');
                                                $('button.btn_mail_auth').attr('disabled', 'disabled');
                                            }
                                        }).on('paste', function (e) {
                                            e.preventDefault();
                                            var text = e.originalEvent.clipboardData.getData('Text');
                                            text = text.replace(/\s+/g, '').trim();
                                            $(this).val(text);
                                        });

                                        $('button.btn_send_mail').on('click', function () {
                                            var $email = $('#userEmail');
                                            var sp = $email.val().split('@');
                                            var userEmail = sp[0];
                                            var userEmailHost = sp[1];
                                            $.ajax({
                                                "type": "POST",
                                                "url": "/user/validate_email_prepare",
                                                "data": { "email_local": userEmail, "email_domain": userEmailHost, "email": $email.val() },
                                                "dataType": "json"
                                            }).done(function (resp) {
                                                if (resp.success === "OK") {
                                                    $('div.auth_mail_box').show();
                                                    $("button.btn_send_mail").hide();
                                                    var $dd = $('#certCode').removeAttr('disabled').focus().parents('dd');
                                                    $($dd.find('p.msg')[1]).html(userEmail + "@" + userEmailHost + "로 인증메일이 발송되었습니다.\n인증번호를 입력해 주세요.");
                                                } else {
                                                    data.setStatus($this, false, resp.error.message);
                                                }
                                            });
                                        });

                                        $("button.btn_mail_auth").on('click', function () {
                                            var $certButton = $(this);
                                            var certCode = $('#certCode').val();
                                            var sp = $('#userEmail').val().split('@');
                                            var userEmail = sp[0];
                                            var userEmailHost = sp[1];
                                            $.ajax({
                                                "type": "POST",
                                                "url": "/user/validate_email",
                                                "data": { "email_local": userEmail, "email_domain": userEmailHost, "certCode": certCode, "email": $('#userEmail').val() },
                                                "dataType": "json"
                                            }).done(function (resp) {
                                                if (resp.success === "OK") {
                                                    data.user.emailToken = resp.result.data.token;
                                                    data.user.emailCertCode = certCode;
                                                    data.setStatus($this, true, '이메일 소유확인이 완료되었습니다. 가입절차를 진행해주세요.');
                                                    resetCert();
                                                } else {
                                                    var $dd = $certButton.parents('dd');
                                                    $('#certCode').val('').trigger('change');
                                                    $($dd.find('p.msg')[1]).html('인증번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.');
                                                }
                                            });
                                        });

                                        var resetCert = function () {
                                            $('button.btn_send_mail').hide();
                                            $('div.auth_mail_box').hide();
                                            $("button.btn_mail_auth").attr('disabled', 'disabled');
                                            var $dd = $('#certCode').val('').parents('dd');
                                            $($dd.find('p.msg')[1]).html('');
                                        };

                                        if ($this.val() !== '') {
                                            $this.trigger('change').trigger('blur');
                                        }
                                    });

                                    var delayRun = function () { regist(data) };
                                    $('div.btns_area > button.btn_type1').on('click', function () {
                                        var $this = $('#userName');
                                        var validation = validateName($this.val());
                                        data.setStatus($this, false, validation.message);
                                        if (validation.valid) {
                                            $this.val($.trim($this.val()));
                                            data.setStatus($this, true, validation.message);
                                            validforbiddenWord($this.val(), function (validation) {
                                                data.setStatus($this, validation.valid, validation.message);
                                            });
                                        }
                                        setTimeout(delayRun, 1000);
                                    });

                                });

                                //아이디 체크
                                var validateId = function (userId) {
                                    userId = $.trim(userId);
                                    if (userId === $("#userName").attr('placeholder')) return { valid: false, message: '아이디를 입력해주세요.' };
                                    else if (userId === '' || userId.length < 4) return { valid: false, message: '아이디는 4자 이상이어야 합니다.' };
                                    else if (/^[a-zA-Z0-9_\-]+$/.test(userId) === false) return { valid: false, message: '아이디는 영문자, 숫자, -, _ 문자만 사용 가능합니다.' };
                                    else return { valid: false, message: "중복확인이 필요합니다." };
                                };

                                //이름 체크
                                function validateName(userName) {
                                    userName = $.trim(userName);
                                    if (userName === '' || (userName === $("#userName").attr('placeholder'))) return { valid: false, message: '이름을 입력 해주세요.' };

                                    var korReg = /^[가-힝]{1,15}$/;
                                    var engReg = /^[a-zA-Z]{1,30}$/;
                                    if (getByteLength(userName) > 30) {
                                        return { valid: false, message: '이름은 최대 30byte(한글 15자/영문 30자)까지 입력이 가능합니다.' };
                                    } else if (!korReg.test(userName) && !engReg.test(userName)) {
                                        return { valid: false, message: '이름은 한글, 영문 대소문자만 사용해주세요.' };
                                    }
                                    return { valid: true, message: '' };
                                }

                                //문자열 바이트
                                function getByteLength(s, b, i, c) {
                                    for (b = i = 0; c == s.charCodeAt(i++); b += c >> 11 ? 2 : c >> 7 ? 2 : 1) { };
                                    return b;
                                }

                                //이메일 체크
                                function validateEmail(email) {
                                    var validation = new ValidationStatus();
                                    var reg = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
                                    var validation = new ValidationStatus();
                                    validation.valid = false;
                                    if (email === '') {
                                        validation.message = '이메일 입력 해주세요.';
                                    } else if (!reg.test(email)) {
                                        validation.message = '올바른 이메일 형식을 입력해주세요.';
                                    } else {
                                        validation.valid = true;
                                    }
                                    return validation;
                                }

                                function validforbiddenWord(value, callback) {
                                    $.ajax({ "type": "POST", "url": "/user/check_username_forbiddenword", "data": { "userName": value }, "dataType": "json", "async": false }
                                    ).done(function (resp) {
                                        var status = new ValidationStatus();
                                        status.valid = resp.success === "OK";
                                        if (resp.success === "OK") {
                                            status.message = resp.result.message;
                                        } else {
                                            status.message = '이름에 [' + resp.error.data.name + ']은(는) 사용할 수 없는 단어입니다.<br/>금칙어로 입력이 제한된 단어를 삭제하신 후 다시 등록해주세요.<br/>안내 : 건전한 인터넷 문화 조성을 위한 회원님의 적극적인 협조를 부탁 드립니다.';
                                        }
                                        if (typeof callback === 'function') {
                                            callback(status);
                                        }
                                    });
                                }

                                function validDuplicateEmail(value, callback) {
                                    var sp = value.split('@');
                                    var userEmail = sp[0];
                                    var userEmailHost = sp[1];
                                    $.ajax({
                                        "type": "POST",
                                        "url": "/user/check_duplicate_email",
                                        "data": { "email_local": userEmail, "email_domain": userEmailHost },
                                        "dataType": "json"
                                    }).done(function (resp) {
                                        var status = new ValidationStatus();
                                        if (resp.success === 'OK' || resp.error.message === '') {
                                            if (resp.success === 'OK') {
                                                status.data = resp.result.data.token;
                                            } else {
                                                var dupId = resp.error.data;
                                                var message = dupId + "아이디로 이미 가입된 이메일입니다. 가입완료 시 기존 아이디의 이메일은 초기화됩니다.";
                                                status.message = message
                                            }
                                            status.alert = '이메일 인증 진행 후 가입을 완료해주세요';
                                            // $('button.btn_send_mail').show();
                                        } else {
                                            status.message = resp.error.message;
                                        }
                                        if (typeof callback === 'function') {
                                            callback(status);
                                        }
                                    });
                                }

                                function sendCertCode(email, callback) {
                                    var sp = email.split('@');
                                    var userEmail = sp[0];
                                    var userEmailHost = sp[1];
                                    $.ajax({
                                        "type": "POST",
                                        "url": "/user/validate_email_prepare",
                                        "data": { "email_local": userEmail, "email_domain": userEmailHost },
                                        "dataType": "json"
                                    }).done(function (resp) {

                                        if (resp.success === "OK") {
                                            $('div.auth_mail_box').show();
                                            $("button.btn_send_mail").hide();
                                            var $dd = $('#certCode').removeAttr('disabled').focus().parents('dd');
                                            $($dd.find('p.msg')[1]).html(userEmail + "@" + userEmailHost + "로 인증메일이 발송되었습니다.\n인증번호를 입력해 주세요.");
                                        } else {
                                            data.setStatus($this, false, resp.error.message);
                                        }
                                        // callback
                                    });
                                }

                                function validateDuplicationId(userId, callback) {
                                    $.ajax({
                                        "type": "POST",
                                        "url": "/user/validate_id",
                                        "data": { 'id': userId },
                                        "dataType": "json"
                                    }).done(function (resp) {
                                        var str = '';
                                        var data = null;
                                        var status = new ValidationStatus();
                                        status.valid = resp.success === "OK";
                                        if (status.valid) {
                                            status.message = resp.result.message;
                                            status.data = resp.result.data;
                                        } else {
                                            status.message = resp.error.message;
                                            status.data = resp.error.data;
                                        }
                                        if (typeof callback === 'function') {
                                            callback(status);
                                        }
                                    });
                                }

                                function regist(data) {
                                    if (window.pending) return;

                                    for (var key in data.valid) {
                                        if (!data.valid[key]) {
                                            invalidMessage(key, data.alert[key]);
                                            return;
                                        }
                                    }

                                    var $year = $('#year');
                                    var $month = $('#month');
                                    var $day = $('#day');
                                    if ($('#year_inp').length > 0) {
                                        $year = $('#year_inp');
                                        $month = $('#month_inp');
                                        $day = $('#day_inp');
                                    }

                                    data.user.bdYear = parseInt($year.val());
                                    data.user.bdMonth = parseInt($month.val());
                                    data.user.bdDate = parseInt($day.val());

                                    window.pending = true;
                                    $.ajax({
                                        "type": "POST",
                                        "url": "/user/signup/regist",
                                        "data": data.user,
                                        "dataType": "json"
                                    }).done(function (resp) {
                                        if (resp.success !== "OK") {
                                            window.pending = false;
                                            alert(resp.error.message);
                                            return;
                                        }
                                        if (resp.result.data.snsErrorMessage) {
                                            alert(resp.result.data.snsErrorMessage);
                                        }
                                        /*document.location.href = '/user/signup/complete?&returnUrl='
                                            + encodeURI('') + '&completeUrl=' + encodeURI('');*/
                                        document.complete.submit(); return;
                                    });
                                }

                                var ValidationStatus = function () {
                                    this.valid = false;
                                    this.message = '';
                                    this.alert = '';
                                    this.data = {};
                                };

                                var invalidMessage = function (key, message) {
                                    var $el = null;
                                    switch (key) {
                                        case 'email':
                                            $el = $('#userEmail');
                                            break;
                                        case 'id':
                                            $el = $('#userId');
                                            break;
                                        case 'name':
                                            $el = $('#userName');
                                            break;
                                        case 'password':
                                            $el = $('#userPw');
                                            break;
                                        case 'passwordVerify':
                                            $el = $('#userPwConfirm');
                                            break;
                                    }
                                    if ($el) {
                                        var $parent = $el.parents('dd');

                                        if (message === null) {
                                            message = $($parent.find('p.msg')[0]).text();
                                        }

                                        if (message && message !== '') {
                                            alert(message);
                                            $el.focus().select();
                                        }
                                    }
                                }

                            </script>
                        </div>
                        <div class="join_footer">
                            <div class="copyright">
                                COPYRIGHT. TMON INC. ALL RIGHTS RESERVED.
                            </div>
                        </div>
                    </div>
                    <!--/ #wrap -->
                    <script>var tl_vars = { "m_no": 0, "nav1": 0, "nav2": 0, "nav3": 0, "abtest_name": { "v16": "B", "v18": "A", "v19": "B", "v110": "B", "v111": "A", "v144": "B", "v149": "A", "v150": "A", "v151": "B", "v153": "A", "v160": "A", "v162": "A", "v164": "A", "v165": "A", "v166": "B" }, "abtest_version": [], "referer": "https:\/\/login.tmon.co.kr\/user\/signup\/term", "p_id": "v01-32b12ed7-a2ba-4a64-895d-962ee4d08f80-1318007974", "s_id": "34bdf11f-fd1a-4ecb-b34b-9a1afc42e731", "sid_ctime": 1665129305, "tl_aid": "45b1c2d1-dfec-47d6-ab96-038e568b6701", "aid_ctime": 1665129305, "aid_ltime": 1665129310, "tl_seq": 5, "tl_aid_seq": 5 };
                    </script>

                    <div id="fancybox-tmp"></div>
                    <div id="fancybox-loading">
                        <div></div>
                    </div>
                    <div id="fancybox-overlay"></div>
                    <div id="fancybox-wrap">
                        <div id="fancybox-outer">
                            <div class="fancybox-bg" id="fancybox-bg-n"></div>
                            <div class="fancybox-bg" id="fancybox-bg-ne"></div>
                            <div class="fancybox-bg" id="fancybox-bg-e"></div>
                            <div class="fancybox-bg" id="fancybox-bg-se"></div>
                            <div class="fancybox-bg" id="fancybox-bg-s"></div>
                            <div class="fancybox-bg" id="fancybox-bg-sw"></div>
                            <div class="fancybox-bg" id="fancybox-bg-w"></div>
                            <div class="fancybox-bg" id="fancybox-bg-nw"></div>
                            <div id="fancybox-content"></div><a id="fancybox-close"></a>
                            <div id="fancybox-title"></div><a href="javascript:;" id="fancybox-left"><span class="fancy-ico"
                                    id="fancybox-left-ico"></span></a><a href="javascript:;" id="fancybox-right"><span class="fancy-ico"
                                    id="fancybox-right-ico"></span></a>
                        </div>
                    </div>

            <div id="down">copyright 1조 Group 1</div>
        </div>
        
    </body>

    </html>
    ```

![https://user-images.githubusercontent.com/92353613/194526192-46856ed5-5756-4886-860c-2875cc56ddaa.png](https://user-images.githubusercontent.com/92353613/194526192-46856ed5-5756-4886-860c-2875cc56ddaa.png)