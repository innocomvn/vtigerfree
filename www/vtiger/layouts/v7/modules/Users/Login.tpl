{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Users/views/Login.php *}

{strip}
    <style>
        @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);

        * {
            box-sizing: content-box;
            margin: 0;
            padding: 0;
            font-weight: 300;
        }

        body {
            font-family: Roboto, Helvetica, Arial, sans-serif;
            color: white;
            font-weight: 300;
        }

        body ::-webkit-input-placeholder {
            /* WebKit browsers */
            font-family: Roboto, Helvetica, Arial, sans-serif;
            color: white;
            font-weight: 300;
        }

        body :-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            font-family: Roboto, Helvetica, Arial, sans-serif;
            color: white;
            opacity: 1;
            font-weight: 300;
        }

        body ::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            font-family: Roboto, Helvetica, Arial, sans-serif;
            color: white;
            opacity: 1;
            font-weight: 300;
        }

        body :-ms-input-placeholder {
            /* Internet Explorer 10+ */
            font-family: Roboto, Helvetica, Arial, sans-serif;
            color: white;
            font-weight: 300;
        }

        .wrapper {
            background: url(https://crm.innocom.vn/abms.jpg) no-repeat 30% 25% fixed;
            background-size: cover;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .wrapper.form-success .container h1 {
            -webkit-transform: translateY(85px) !important;
            transform: translateY(85px) !important;
        }

        .container {
            max-width: 341px;
            margin: 100px auto;
            padding: 20px 0;
            height: 320px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5);
        }

        @media only screen and (max-width: 767px) {
            .container {
                margin: 44% auto;
            }

            .login-page-footer {
                display: none;
            }
        }

        .container h1 {
            font-size: 40px !important;
            -webkit-transition-duration: 1s !important;
            transition-duration: 1s !important;
            -webkit-transition-timing-function: ease-in-put !important;
            transition-timing-function: ease-in-put !important;
            font-weight: 200 !important;
            color: white;

        }

        .container h4 {
            font-size: 13px !important;
            -webkit-transition-duration: 1s !important;
            transition-duration: 1s !important;
            -webkit-transition-timing-function: ease-in-put !important;
            transition-timing-function: ease-in-put !important;
            font-weight: 300 !important;
            color: white;
            letter-spacing: 1.2px;
            padding-top: 5px;

        }

        form {
            padding: 20px 0 !important;
            position: relative !important;
            z-index: 2 !important;
        }

        form input {
            -webkit-appearance: none !important;
            -moz-appearance: none !important;
            appearance: none !important;
            outline: 0 !important;
            border: 1px solid rgba(255, 255, 255, 0.4) !important;
            background-color: rgba(255, 255, 255, 0.2) !important;
            width: 250px !important;
            border-radius: 3px !important;
            padding: 10px 15px !important;
            margin: 0 auto 10px auto !important;
            display: block !important;
            text-align: center !important;
            font-size: 18px !important;
            color: white !important;
            -webkit-transition-duration: 0.25s !important;
            transition-duration: 0.25s !important;
            font-weight: 300 !important;
        }

        form input:hover {
            background-color: rgba(255, 255, 255, 0.4) !important;
        }

        form input:focus {
            background-color: white !important;
            width: 260px !important;
            color: #0288D1 !important;
        }

        form button {
            -webkit-appearance: none !important;
            -moz-appearance: none !important;
            appearance: none !important;
            outline: 0 !important;

            border: 0 !important;
            padding: 10px 15px !important;
            color: #0288D1 !important;
            border-radius: 3px !important;
            width: 250px !important;
            cursor: pointer !important;
            font-size: 18px !important;
            -webkit-transition-duration: 0.25s !important;
            transition-duration: 0.25s !important;
        }

        form button:hover {
            /*background-color: #f5f7f9 !important;*/
        }

        .bg-bubbles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .bg-bubbles li {
            position: absolute;
            list-style: none;
            display: block;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.15);
            bottom: -160px;
            -webkit-animation: square 25s infinite;
            animation: square 25s infinite;
            -webkit-transition-timing-function: linear;
            transition-timing-function: linear;
        }

        .bg-bubbles li:nth-child(1) {
            left: 10%;
        }

        .bg-bubbles li:nth-child(2) {
            left: 20%;
            width: 80px;
            height: 80px;
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
            -webkit-animation-duration: 17s;
            animation-duration: 17s;
        }

        .bg-bubbles li:nth-child(3) {
            left: 25%;
            -webkit-animation-delay: 4s;
            animation-delay: 4s;
        }

        .bg-bubbles li:nth-child(4) {
            left: 40%;
            width: 60px;
            height: 60px;
            -webkit-animation-duration: 22s;
            animation-duration: 22s;
            background-color: rgba(255, 255, 255, 0.25);
        }

        .bg-bubbles li:nth-child(5) {
            left: 70%;
        }

        .bg-bubbles li:nth-child(6) {
            left: 80%;
            width: 120px;
            height: 120px;
            -webkit-animation-delay: 3s;
            animation-delay: 3s;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .bg-bubbles li:nth-child(7) {
            left: 32%;
            width: 160px;
            height: 160px;
            -webkit-animation-delay: 7s;
            animation-delay: 7s;
        }

        .bg-bubbles li:nth-child(8) {
            left: 55%;
            width: 20px;
            height: 20px;
            -webkit-animation-delay: 15s;
            animation-delay: 15s;
            -webkit-animation-duration: 40s;
            animation-duration: 40s;
        }

        .bg-bubbles li:nth-child(9) {
            left: 25%;
            width: 10px;
            height: 10px;
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
            -webkit-animation-duration: 40s;
            animation-duration: 40s;
            background-color: rgba(255, 255, 255, 0.3);
        }

        .bg-bubbles li:nth-child(10) {
            left: 90%;
            width: 160px;
            height: 160px;
            -webkit-animation-delay: 11s;
            animation-delay: 11s;
        }

        @-webkit-keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
            100% {
                -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
            }
        }

        @keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
            100% {
                -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
            }
        }

        #login-button {
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid white !important;
            color: white !important;
        }

        #login-button:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        #forgot {
            color: white !important;
        }

        #logo-bottom {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        #logo-bottom img {
            width: 300px;
            opacity: 0.5;
        }


    </style>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <script src="libraries/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $("#login-button").click(function (event) {
            event.preventDefault();

            $('form').fadeOut(500);
            $('.wrapper').addClass('form-success');
        });
    </script>
    <div class="wrapper">
        <div class="container">
            <img style="width:50%" id='vtiger' src="test/logo/vtiger-crm-logo.png">
            <h4>Branch Engagement System</h4>
            <div id="loginFormDiv">
                <form class="form-horizontal" method="POST" action="index.php">
                    <input type="hidden" name="module" value="Users"/>
                    <input type="hidden" name="action" value="Login"/>
                    <div class="group">
                        <input id="username" type="text" name="username" placeholder="Username">
                        <span class="bar"></span>
                    </div>
                    <div class="group">
                        <input id="password" type="password" name="password" placeholder="Password">
                        <span class="bar"></span>
                    </div>
                    <div class="group">
                        <button type="submit" class="button buttonBlue">Sign in</button><br>
                    </div>
                    <div class="group" style="margin-top: 20px;">
                        <a class="forgotPasswordLink" style="color: #15c;">forgot password?</a>
                    </div>
                </form>
            </div>

            <div id="forgotPasswordDiv" class="hide">
                <form class="form-horizontal" action="forgotPassword.php" method="POST">
                    <div class="group">
                        <input id="fusername" type="text" name="username" placeholder="Username" >
                        <span class="bar"></span>
                    </div>
                    <div class="group">
                        <input id="email" type="email" name="emailId" placeholder="Email" >
                        <span class="bar"></span>
                    </div>
                    <div class="group">
                        <button type="submit" class="button buttonBlue forgot-submit-btn">Submit</button><br>
                    </div>
                    <div class="group" style="margin-top: 20px;">
                        <span>Please enter details and submit<a class="forgotPasswordLink pull-right" style="color: #15c; margin-right: 15%;">Back</a></span>
                    </div>
                </form>
            </div>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <script>
        jQuery(document).ready(function () {
            var validationMessage = jQuery('#validationMessage');
            var forgotPasswordDiv = jQuery('#forgotPasswordDiv');

            var loginFormDiv = jQuery('#loginFormDiv');
            loginFormDiv.find('#password').focus();

            loginFormDiv.find('a').click(function () {
                loginFormDiv.toggleClass('hide');
                forgotPasswordDiv.toggleClass('hide');
                validationMessage.addClass('hide');
            });

            forgotPasswordDiv.find('a').click(function () {
                loginFormDiv.toggleClass('hide');
                forgotPasswordDiv.toggleClass('hide');
                validationMessage.addClass('hide');
            });

            loginFormDiv.find('button').on('click', function () {
                var username = loginFormDiv.find('#username').val();
                var password = jQuery('#password').val();
                var result = true;
                var errorMessage = '';
                if (username === '') {
                    errorMessage = 'Please enter valid username';
                    result = false;
                } else if (password === '') {
                    errorMessage = 'Please enter valid password';
                    result = false;
                }
                if (errorMessage) {
                    validationMessage.removeClass('hide').text(errorMessage);
                }
                return result;
            });

            forgotPasswordDiv.find('button').on('click', function () {
                var username = jQuery('#forgotPasswordDiv #fusername').val();
                var email = jQuery('#email').val();

                var email1 = email.replace(/^\s+/, '').replace(/\s+$/, '');
                var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
                var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

                var result = true;
                var errorMessage = '';
                if (username === '') {
                    errorMessage = 'Please enter valid username';
                    result = false;
                } else if (!emailFilter.test(email1) || email == '') {
                    errorMessage = 'Please enter valid email address';
                    result = false;
                } else if (email.match(illegalChars)) {
                    errorMessage = 'The email address contains illegal characters.';
                    result = false;
                }
                if (errorMessage) {
                    validationMessage.removeClass('hide').text(errorMessage);
                }
                return result;
            });
            jQuery('input').blur(function (e) {
                var currentElement = jQuery(e.currentTarget);
                if (currentElement.val()) {
                    currentElement.addClass('used');
                } else {
                    currentElement.removeClass('used');
                }
            });

            var ripples = jQuery('.ripples');
            ripples.on('click.Ripples', function (e) {
                jQuery(e.currentTarget).addClass('is-active');
            });

            ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function (e) {
                jQuery(e.currentTarget).removeClass('is-active');
            });
            loginFormDiv.find('#username').focus();

            var slider = jQuery('.bxslider').bxSlider({
                auto: true,
                pause: 4000,
                nextText: "",
                prevText: "",
                autoHover: true
            });
            jQuery('.bx-prev, .bx-next, .bx-pager-item').live('click', function () {
                slider.startAuto();
            });
            jQuery('.bx-wrapper .bx-viewport').css('background-color', 'transparent');
            jQuery('.bx-wrapper .bxslider li').css('text-align', 'left');
            jQuery('.bx-wrapper .bx-pager').css('bottom', '-15px');

            var params = {
                theme: 'dark-thick',
                setHeight: '100%',
                advanced: {
                    autoExpandHorizontalScroll: true,
                    setTop: 0
                }
            };
            jQuery('.scrollContainer').mCustomScrollbar(params);
        });
    </script>
    </div>
{/strip}