<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<head>
    <style>

        table, td {
            border: 1px solid #ddd;
            text-align: left;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-left: -50px;
        }

        th, td {
            padding: 15px;
        }



    </style>
</head>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/datatablesUtil.js" defer></script>
<script type="text/javascript" src="resources/js/mealDatatables.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<div class="jumbotron">
    <div class="container">
        <h3><spring:message code="meal.title"/></h3>


        <div class="row">
             <div class="col-sm-7"> <!-- Ответственный За ширину (mb) -->
               <!-- <div class="panel panel-default"> --> <!--Удаляет панельку белой полоски под заполнение-->
                   <!-- <div class="panel-body"> --> <!--Белая полоска под часть с заполнителями -->

                        <form class="form-horizontal" id="filterSetevoe">
                            <%--
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="startDate"><spring:message
                                        code="meal.startDate"/>:</label>

                                <div class="col-sm-3">
                                    <input class="form-control" name="startDate" id="startDate">
                                </div>

                                <label class="control-label col-sm-4" for="startTime"><spring:message
                                        code="meal.startTime"/>:</label>

                                <div class="col-sm-2">
                                    <input class="form-control" name="startTime" id="startTime">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="endDate"><spring:message
                                        code="meal.endDate"/>:</label>

                                <div class="col-sm-3">
                                    <input class="form-control" name="endDate" id="endDate">
                                </div>

                                <label class="control-label col-sm-4" for="endTime"><spring:message
                                        code="meal.endTime"/>:</label>

                                <div class="col-sm-2">
                                    <input class="form-control" name="endTime" id="endTime">
                                </div>
                            </div>
                            --%>
                        </form>
                   <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                    <div class="panel-footer text-right">
                        <a class="btn btn-danger" type="button" onclick="clearFilterSetevoe()">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </a>
                        <a class="btn btn-primary" type="button" onclick="updateTableSetevoe()">
                            <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                        </a>

                    </div>

                 <form class="form-horizontal" id="filterSantex">
                     <%--
                     <div class="form-group">
                         <label class="control-label col-sm-3" for="startDate"><spring:message
                                 code="meal.startDate"/>:</label>

                         <div class="col-sm-3">
                             <input class="form-control" name="startDate" id="startDate">
                         </div>

                         <label class="control-label col-sm-4" for="startTime"><spring:message
                                 code="meal.startTime"/>:</label>

                         <div class="col-sm-2">
                             <input class="form-control" name="startTime" id="startTime">
                         </div>
                     </div>
                     <div class="form-group">
                         <label class="control-label col-sm-3" for="endDate"><spring:message
                                 code="meal.endDate"/>:</label>

                         <div class="col-sm-3">
                             <input class="form-control" name="endDate" id="endDate">
                         </div>

                         <label class="control-label col-sm-4" for="endTime"><spring:message
                                 code="meal.endTime"/>:</label>

                         <div class="col-sm-2">
                             <input class="form-control" name="endTime" id="endTime">
                         </div>
                     </div>
                     --%>
                 </form>
                 <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                 <div class="panel-footer text-right">
                     <a class="btn btn-danger" type="button" onclick="clearFilterSantex()">
                         <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                     </a>
                     <a class="btn btn-primary" type="button" onclick="updateTableSantex()">
                         <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                     </a>

                 </div>
               <!-- </div> --><!--Удаляет панельку белой полоски под заполнение-->
           </div> <!-- Ответственный За ширину -->
        </div>


        <a class="btn btn-primary" onclick="add()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            <spring:message code="common.add"/>
        </a>
        <table id="datatable">
            <thead>
            <tr>

                <th>Картинка</th>
                <th>Артикул</th>
                <th>Тип1</th>
                <th>Тип2</th>
                <th>Код</th>
                <th>Наименование</th>
                <th>Производитель</th>
                <th>Ед.изм</th>
                <th>Кол-во</th>
                <th>Цена</th>
                <th>Примечание</th>


                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div class="modal fade" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title" id="modalTitle"></h2>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="detailsForm">
                    <input type="hidden" id="id" name="id">


                    <%--
                    <div class="form-group">
                        <label for="dateTime" class="control-label col-xs-3"><spring:message
                                code="meal.dateTime"/></label>

                        <div class="col-xs-9">
                            <input class="form-control" id="dateTime" name="dateTime"
                                   placeholder="<spring:message code="meal.dateTime"/>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="control-label col-xs-3"><spring:message
                                code="meal.description"/></label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="description" name="description"
                                   placeholder="<spring:message code="meal.description"/>">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="calories" class="control-label col-xs-3">calories</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="calories" name="calories"
                                   placeholder="calories">
                        </div>
                    </div>

                    --%>

                    <div class="form-group">
                        <label for="type1" class="control-label col-xs-3">Тип1</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="type1" name="type1"
                                   placeholder="type1">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="type2" class="control-label col-xs-3">Тип2</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="type2" name="type2"
                                   placeholder="type2">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cod" class="control-label col-xs-3">Код</label>

                        <div class="col-xs-9">
                            <input type="number" class="form-control" id="cod" name="cod">
                        </div>

                        <script type="text/javascript">
                            document.getElementById('cod').value = 0
                        </script>

                    </div>


                    <!-- Наименование в добавление -->
                    <div class="form-group">
                        <label for="naimenovanie" class="control-label col-xs-3">Наименование</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="naimenovanie" name="naimenovanie" placeholder="1000">
                        </div>
                    </div>
                    <!-- (K) Наименование в добавление -->
                    <!-- proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture -->
                    <div class="form-group">
                        <label for="proizvoditel" class="control-label col-xs-3">Производитель</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="proizvoditel" name="proizvoditel" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edizmereniya" class="control-label col-xs-3">Ед.Изм</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="edizmereniya" name="edizmereniya" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="kolvo" class="control-label col-xs-3">Кол-во</label>

                        <div class="col-xs-9">
                            <input type="number" class="form-control" id="kolvo" name="kolvo" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cena" class="control-label col-xs-3">Цена</label>

                        <div class="col-xs-9">
                            <input type="number" class="form-control" id="cena" name="cena" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="primechanie" class="control-label col-xs-3">Примечание</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="primechanie" name="primechanie" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="articul" class="control-label col-xs-3">Артикул</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="articul" name="articul" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                       <label for="picture" class="control-label col-xs-3">Картинко-имя(mb сделать картинку справа)</label>

                       <div class="col-xs-9">
                           <input type="text" class="form-control" id="picture" name="picture" placeholder="1000">
                       </div>
                   </div>



                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <button class="btn btn-primary" type="button" onclick="save()">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>
</body>
<jsp:include page="fragments/i18n.jsp"/>
<script type="text/javascript">
    i18n["addTitle"] = '<spring:message code="meal.add"/>';
    i18n["editTitle"] = '<spring:message code="meal.edit"/>';
</script>
</html>