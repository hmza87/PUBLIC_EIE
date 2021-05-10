<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<jsp:include page="../../includes/head.jsp"/>

<style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }
        .table-title h2 {
            margin: 8px 0 0;
            font-size: 22px;
        }
        .container{
            margin-top: 10%;
        }
        .search-box {
            position: relative;
            float: right;
        }
        .search-box input {
            height: 34px;
            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }
        #search{
            border-radius: 20px;
            border-color: #ddd;
            box-shadow: none;
            margin-bottom: 15px;
        }
        .search-box input:focus {
            border-color: #3FBAE4;
        }
        .search-box i {
            color: #a0a5b1;
            position: absolute;
            font-size: 19px;
            top: 8px;
            left: 10px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
    </style>
<div class="container">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6"><h2>Transporteur Autorisé</h2></div>
                    <div class="col-sm-6">
                            <%--<div>
                                <button class="btn btn-primary float-right" onkeyup="search()" id="search" style="margin-left: 10px">Search</button>
                            </div>--%>
                            <div class="search-box">
                                <i class="material-icons">&#xE8B6;</i>
                                <input type="text" class="form-control" id="txtsearch" onkeyup="search()"  placeholder="Search&hellip;">
                            </div>

                    </div>
                </div>
            </div>
            <div id="mydata">
                <table class="table mytable table-striped table-hover table-bordered" id="example">
                    <thead>
                    <tr>
                        <th class="text-center"><spring:message code="label.typededechet"/></th>
                        <th class="text-center"><spring:message code="label.code"/></th>
                        <th class="text-center"><spring:message code="label.transporteur"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listF}" var="f">
                        <tr>
                            <td><c:forEach items="${f.code}" var="p">
                                - ${p.nom_ar}<br/>
                            </c:forEach>
                            </td>
                            <td style="width:20%"><c:forEach items="${f.code}" var="p">
                                - ${p.nom_fr}<br/>
                            </c:forEach>
                            </td>
                            <td>${f.nom}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../includes/footer1.jsp"/>
<script>
  /*  $(document).ready(function() {
        $('.table').DataTable().destroy();
    });*/
 /* $(document).ready(function (){
      $('[type=search]').css({
          'height': '34px',
          'border-radius': '20px',
          'padding-left': '15px',
          'border-color': '#ddd',
          'box-shadow': 'none'
      });
  });*/


        function search() {
            var search = $("#txtsearch").val();
            if(search.length>=3){
                $.ajax({
                    type: "GET"
                    , url: "/api/search/" + search
                    , data: {}
                    , contentType: 'application/json;'
                    , success: function (result) {
                        $("#mydata").html(result);
                    }
                });
            }
            else{
                return false;
            }
        }

</script>
