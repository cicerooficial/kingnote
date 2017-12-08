<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- begin - basic -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${pageTitle}</title>
        <!-- end - basic -->

        <!-- begin - favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="assets/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="assets/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="assets/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="assets/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="assets/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="assets/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="assets/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="assets/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="assets/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="assets/img/favicon/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <!-- end - favicon -->

        <!-- begin - javascript -->
        <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/iao-alert.jquery.js"></script>
        <script src="assets/js/jquery-confirm.min.js"></script>
        <script src="assets/js/script.js"></script>
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="assets/js/ie-emulation-modes-warning.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <!-- end - javascript -->

        <!-- begin - css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <link href="assets/css/bootstrap-select.min.css" rel="stylesheet" media="screen">
        <link href="assets/css/bootstrap-colorpicker.min.css" rel="stylesheet" media="screen">
        <link href="assets/css/iao-alert.css" rel="stylesheet">
        <link href="assets/css/jquery-confirm.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
        <!-- end - css -->

        <!-- begin - font -->
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <!-- end - font -->

        <!-- begin - button openmenu click - animation toggle -->
        <script>
            $(document).ready(function () {
                $(".openNav").click(function () {
                    $("body").toggleClass("navOpen");
                    $("nav").toggleClass("open");
                    $(".wrapper").toggleClass("open");
                    $(this).toggleClass("open");
                });
            });
        </script>
        <!-- end - button openmenu click - animation toggle -->
    </head>

    <body>
        <!-- begin - menu -->
        <nav>
            <ul>
                <li class="${pageContext.request.servletPath eq '/index.jsp' ? 'active' : ''}"><a href="index.jsp">Notas</a></li>
                <li class="${pageContext.request.servletPath eq '/trash.jsp' ? 'active' : ''}"><a href="trash.jsp">Lixeira</a></li>
                <li class="${pageContext.request.servletPath eq '/about.jsp' ? 'active' : ''}"><a href="about.jsp">Sobre</a></li>
            </ul>
        </nav>
        <!-- end - menu -->

        <!-- begin - button open menu -->
        <div class="openNav">
            <div class="icon"></div>
        </div>
        <!-- end - button open menu -->

        <!-- begin - wrapper -->
        <div class="wrapper">
            <!-- begin - logo -->
            <div class="row text-center">
                <a href="index.jsp"><img class="img-rounded"   style="width: 200px;" src="assets/img/logo/logo.png" alt="KingNote Logo"></a>
            </div>
            <!-- end - logo -->
