<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notas - KingNote</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
        <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="assets/js/ie-emulation-modes-warning.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <link href="assets/css/bootstrap-colorpicker.min.css" rel="stylesheet" media="screen">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="assets/js/bootstrap-colorpicker.min.js"></script>
    </head>

    <body>


        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Alterar navegação</span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo.png" ></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Notas</a></li>
                        <li><a href="sobre.jsp">Sobre</a></li>

                    </ul>
                </div>
            </div>
        </nav>

        <!-- INICIO CONTEUDO -->
        <div class="container">
            <div class="page-header">
                <h1>C</h1>
            </div>
            <form class="form-horizontal" action="" method="POST">

                <input type="hidden" name="notaId" value="${param.id}"/>

                <div class="form-group">
                    <label for="nome" class="col-sm-2 control-label">Nome</label>
                    <div class="col-sm-6">
                        <input class="form-control" type="text" id="nome" name="nome" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="Cor" class="col-md-2 control-label">Cor</label>

                    <div class="col-md-3">
                        <div id="cp2" class="input-group colorpicker-component" data-input="#cor" >
                            <input type="hidden" id="cor" name="cor" class="form-control" />
                            <input type="text" id="corUser" class="form-control" disabled />
                            <span class="input-group-addon"><i></i></span>
                        </div>
                        <script>
                            $(function () {

                                $('#cp2').colorpicker().on('changeColor', function (e) {
                                    $('#corUser')[0].style.backgroundColor = e.color.toString('hex');
                                });
                            });
                        </script>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success btn-md">
                            <span class="glyphicon glyphicon-floppy-disk"></span>
                            Salvar
                        </button>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-md-2"></div>

                <div class="col-md-8" >

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-1">#</th>
                                <th>Nome</th>
                                <th class="col-md-3">Cor</th>
                                <th class="col-md-1">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td style="background-color: tan;"></td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="col-md-2"></div>
            </div>

        </div>


        <footer class="footer">
            <div class="container">
                <p class="text-center"></p>
            </div>
        </footer>


    </body>
</html>