<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${pageTitle}</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
        <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="assets/js/ie-emulation-modes-warning.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <link href="assets/css/bootstrap-colorpicker.min.css" rel="stylesheet" media="screen">
        <script src="assets/js/bootstrap-colorpicker.min.js"></script>
        
        <script src="assets/js/bootstrap-select.min.js"></script>
        <link href="assets/css/bootstrap-select.min.css" rel="stylesheet" media="screen">
        
    </head>

    <body>


        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Alterar navegação</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo/logo.png" alt="KingNote Logo"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">

                        <li class="${pageContext.request.servletPath eq '/index.jsp' ? ' active' : ''}"><a href="index.jsp">Notas</a></li>
                        <li class="${pageContext.request.servletPath eq '/trash.jsp' ? ' active' : ''}"><a href="trash.jsp">Lixeira</a></li>
                        <li class="${pageContext.request.servletPath eq '/about.jsp' ? ' active' : ''}"><a href="about.jsp">Sobre</a></li>
                    </ul>
                </div>
            </div>
        </nav>