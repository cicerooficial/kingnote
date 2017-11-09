<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="pageTitle" scope="request" value="Sobre - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<!-- INICIO CONTEUDO -->
<div class="container">
    <div class="page-header">
        <h1>Sobre</h1>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <img src="assets/img/logo/logo.png" alt="KingNote Logo" width="380" height="250"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            KingNote é uma agenda virtual que anota os compromissos e reuniões importantes igual a uma agenda comum porém com uso de recursos tecnologicos. Além de ajudar o meio ambiente a consumir menos papel, é prático, rápido pode ser usado em qualquer plataforma de dispositvos móveis como celular, tablet, computador e notebook.
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp"  />
