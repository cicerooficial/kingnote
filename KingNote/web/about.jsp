<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="pageTitle" scope="request" value="Sobre - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<!-- begin - content page about -->
<div class="container">
    <div class="page-header">
        <h1>Sobre</h1>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <blockquote>
                <p>KingNote é uma agenda virtual que anota os compromissos e reuniões importantes igual a uma agenda comum porém com uso de recursos tecnológicos. Além de ajudar o meio ambiente com a economia de papel, é prático, rápido pode ser usado em qualquer plataforma de dispositvos como celular, tablet, computador e notebook.</p>
                <footer>Equipe <cite title="KingNote">KingNote</cite></footer>
            </blockquote>
        </div>
    </div>
</div>
<!-- end - content page about -->
<jsp:include page="includes/footer.jsp"  />