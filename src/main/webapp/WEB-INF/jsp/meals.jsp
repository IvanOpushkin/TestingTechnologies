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
            margin-left: -60px;
        }

        th, td {
            padding: 15px;
        }

        .button1 {
            width: 10px;
            color: red;
        }


    </style>

    <script type="text/javascript"
            src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<jsp:include page="fragments/headTag.jsp"/>
<body style="background-color: white">

<!-- Выключает таблицы -->
<script type="text/javascript" src="resources/js/datatablesUtil.js" defer></script>
<script type="text/javascript" src="resources/js/mealDatatables.js" defer></script>
<!-- (K)Выключает таблицы -->
<jsp:include page="fragments/bodyHeader.jsp"/>


</br>
</br>
</br>

<div class="jumbotron" style="background-color: white">
    <div class="container">
        <div>
            <div> <!-- Ответственный За ширину (mb) -->
                <!-- <div class="panel panel-default"> --> <!--Удаляет панельку белой полоски под заполнение-->
                <!-- <div class="panel-body"> --> <!--Белая полоска под часть с заполнителями -->
                <table>
                    <tr>


                        <!--САНТЕХ (без ловер кэйса)-->
                        <!--САНТЕХ  (без ловер кэйса)-->
                        <!--САНТЕХ  (без ловер кэйса)-->

                        <td>
                            <form id="filterSantex">
                            </form>

                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->

                            <div>
                                <!--
                             <a class="btn btn-danger" type="button" onclick="clearFilterSantex()">
                                 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                             </a>
                             -->


                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableSantex()">
                                    Сантехническое оборудование <span class="glyphicon glyphicon-filter"
                                                                      aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!-- (К)САНТЕХ (без ловер кэйса)-->
                        <!--(К)САНТЕХ  (без ловер кэйса)-->
                        <!--(К)САНТЕХ  (без ловер кэйса)-->

                        <!--Защитный лоток (без ловер кэйса)-->
                        <!--Защитный лоток  (без ловер кэйса)-->
                        <!--Защитный лоток  (без ловер кэйса)-->
                        <td>
                            <form id="filterZashitLotok">
                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>
                                <!--
                                 <a class="btn btn-danger" type="button" onclick="clearFilterSantex()">
                                     <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                 </a>
                                 -->

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableZashitLotok()">
                                    Защитные лотки <span class="glyphicon glyphicon-filter"
                                                         aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Защитный лоток (без ловер кэйса)-->
                        <!--(К)Защитный лоток  (без ловер кэйса)-->
                        <!--(К)Защитный лоток  (без ловер кэйса)-->

                        <!--Электрощитовое оборудование (без ловер кэйса)-->
                        <!--Электрощитовое оборудование  (без ловер кэйса)-->
                        <!--Электрощитовое оборудование  (без ловер кэйса)-->
                        <td>
                            <form id="filterElectroShit">
                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <!--
                                                          <a class="btn btn-danger" type="button" onclick="clearFilterElectroshit()">
                                                              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                          </a>
                                    -->


                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableElectroshit()">
                                    Электрощитовое оборудование <span class="glyphicon glyphicon-filter"
                                                                      aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Электрощитовое оборудование (без ловер кэйса)-->
                        <!--(К)Электрощитовое оборудование  (без ловер кэйса)-->
                        <!--(К)Электрощитовое оборудование  (без ловер кэйса)-->

                        <!--СЕТЕВОЕ (без ловер кэйса)-->
                        <!--СЕТЕВОЕ (без ловер кэйса)-->
                        <!--СЕТЕВОЕ (без ловер кэйса)-->
                        <td>
                            <form id="filterSetevoe">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableSetevoe()">
                                    Сетевое Оборудование <span class="glyphicon glyphicon-filter"
                                                               aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(K)СЕТЕВОЕ (без ловер кэйса)-->
                        <!--(K)СЕТЕВОЕ (без ловер кэйса)-->
                        <!--(K)СЕТЕВОЕ (без ловер кэйса)-->

                        <!--Световое оборудование (без ловер кэйса)-->
                        <!--Световое оборудование (без ловер кэйса)-->
                        <!--Световое оборудование (без ловер кэйса)-->
                        <td>
                            <form id="filterSvetovoe">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableSvetovoe()">
                                    Световое Оборудование <span class="glyphicon glyphicon-filter"
                                                                aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Световое оборудование (без ловер кэйса)-->
                        <!--(К)Световое оборудование (без ловер кэйса)-->
                        <!--(К)Световое оборудование (без ловер кэйса)-->
                    </tr>

                    <tr>
                        <!--Коммуникационные шкафы (без ловер кэйса)-->
                        <!--Коммуникационные шкафы (без ловер кэйса)-->
                        <!--Коммуникационные шкафы (без ловер кэйса)-->
                        <td>
                            <form id="filterCommun">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableCommun()">
                                    Коммуникационные шкафы <span class="glyphicon glyphicon-filter"
                                                                 aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Коммуникационные шкафы (без ловер кэйса)-->
                        <!--(К)Коммуникационные шкафы (без ловер кэйса)-->
                        <!--(К)Коммуникационные шкафы (без ловер кэйса)-->

                        <!--Компьютерное оборудование (без ловер кэйса)-->
                        <!--Компьютерное оборудование (без ловер кэйса)-->
                        <!--Компьютерное оборудование (без ловер кэйса)-->
                        <td>
                            <form id="filterComp">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%" onclick="updateTableComp()">
                                    Компьютерное оборудование <span class="glyphicon glyphicon-filter"
                                                                    aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Компьютерное оборудование (без ловер кэйса)-->
                        <!--(К)Компьютерное оборудование (без ловер кэйса)-->
                        <!--(К)Компьютерное оборудование (без ловер кэйса)-->

                        <!--Телекомуникационные (без ловер кэйса)-->
                        <!--Телекомуникационные (без ловер кэйса)-->
                        <!--Телекомуникационные (без ловер кэйса)-->
                        <td>
                            <form id="filterTelecom">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableTelecom()">
                                    Телекомуникационные <span class="glyphicon glyphicon-filter"
                                                              aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Телекомуникационные (без ловер кэйса)-->
                        <!--(К)Телекомуникационные (без ловер кэйса)-->
                        <!--(К)Телекомуникационные (без ловер кэйса)-->


                        <!--Офисное оборудование (без ловер кэйса)-->
                        <!--Офисное оборудование (без ловер кэйса)-->
                        <!--Офисное оборудование (без ловер кэйса)-->
                        <td>
                            <form id="filterOffice">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableOffice()">
                                    Офисное оборудование <span class="glyphicon glyphicon-filter"
                                                               aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Офисное оборудование (без ловер кэйса)-->
                        <!--(К)Офисное оборудование (без ловер кэйса)-->
                        <!--(К)Офисное оборудование (без ловер кэйса)-->

                        <!--Пожарно-охранное оборудование (без ловер кэйса)-->
                        <!--Пожарно-охранное оборудование (без ловер кэйса)-->
                        <!--Пожарно-охранное оборудование (без ловер кэйса)-->
                        <td>
                            <form id="filterPozhar">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTablePozhar()">
                                    Пожарно-охранное оборудование <span class="glyphicon glyphicon-filter"
                                                                        aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Пожарно-охранное оборудование (без ловер кэйса)-->
                        <!--(К)Пожарно-охранное оборудование (без ловер кэйса)-->
                        <!--(К)Пожарно-охранное оборудование (без ловер кэйса)-->
                    </tr>

                    <tr>

                        <!--Цифровое (без ловер кэйса)-->
                        <!--Цифровое (без ловер кэйса)-->
                        <!--Цифровое (без ловер кэйса)-->
                        <td>
                            <form id="filterCifro">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableCifro()">
                                    Цифровое <span class="glyphicon glyphicon-filter"
                                                   aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Цифровое (без ловер кэйса)-->
                        <!--(К)Цифровое (без ловер кэйса)-->
                        <!--(К)Цифровое (без ловер кэйса)-->


                        <!--Электромонтажное (без ловер кэйса)-->
                        <!--Электромонтажное (без ловер кэйса)-->
                        <!--Электромонтажное (без ловер кэйса)-->
                        <td>
                            <form id="filterElectromont">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableElectromont()">
                                    Электромонтажное <span class="glyphicon glyphicon-filter"
                                                           aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Электромонтажное (без ловер кэйса)-->
                        <!--(К)Электромонтажное (без ловер кэйса)-->
                        <!--(К)Электромонтажное (без ловер кэйса)-->

                        <!--Монтажное оборудование (без ловер кэйса)-->
                        <!--Монтажное оборудование (без ловер кэйса)-->
                        <!--Монтажное оборудование (без ловер кэйса)-->
                        <td>
                            <form id="filterMont">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%" onclick="updateTableMont()">
                                    Монтажное оборудование <span class="glyphicon glyphicon-filter"
                                                                 aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Монтажное оборудование (без ловер кэйса)-->
                        <!--(К)Монтажное оборудование (без ловер кэйса)-->
                        <!--(К)Монтажное оборудование (без ловер кэйса)-->


                        <!--Аккумуляторы (без ловер кэйса)-->
                        <!--Аккумуляторы (без ловер кэйса)-->
                        <!--Аккумуляторы (без ловер кэйса)-->
                        <td>
                            <form id="filterAkkamul">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableAkkamul()">
                                    Аккумуляторы <span class="glyphicon glyphicon-filter"
                                                       aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Аккумуляторы (без ловер кэйса)-->
                        <!--(К)Аккумуляторы (без ловер кэйса)-->
                        <!--(К)Аккумуляторы (без ловер кэйса)-->

                        <td>

                            <div>
                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="clearFilterElectroshit()">
                                    Всё <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                </a>
                            </div>

                        </td>


                    </tr>
                    <tr>

                        <!--Без цены -->
                        <!--Без цены -->
                        <!--Без цены -->
                        <td>
                            <form id="filterBezCeni">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableBezCeni()">
                                    Без цены <span class="glyphicon glyphicon-filter"
                                                       aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Без цены -->
                        <!--(К)Без цены -->
                        <!--(К)Без цены -->

                        <!--Теплоизоляция и защитные покрытия -->
                        <!--Теплоизоляция и защитные покрытия -->
                        <!--Теплоизоляция и защитные покрытия -->
                        <td>
                            <form id="filterTeploAndDef">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableTeploAndDef()">
                                    Теплоизоляция и защитные покрытия <span class="glyphicon glyphicon-filter"
                                                       aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Теплоизоляция и защитные покрытия -->
                        <!--(К)Теплоизоляция и защитные покрытия -->
                        <!--(К)Теплоизоляция и защитные покрытия -->

                        <!--Кабельная продукция -->
                        <!--Кабельная продукция -->
                        <!--Кабельная продукция -->
                        <td>
                            <form id="filterCableProduction">

                            </form>
                            <!-- </div> --> <!--Белая полоска под часть с заполнителями -->
                            <div>

                                <a class="btn btn-default" type="button" style="width:100%"
                                   onclick="updateTableCableProduction()">
                                    Кабельная продукция <span class="glyphicon glyphicon-filter"
                                                       aria-hidden="true"></span>
                                </a>

                            </div>
                        </td>
                        <!--(К)Кабельная продукция -->
                        <!--(К)Кабельная продукция -->
                        <!--(К)Кабельная продукция -->





                        <td>
                            <div>
                                <a class="btn btn-primary" type="button" onclick="add()" style="width:150%">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    Добавить
                                </a>
                            </div>
                        </td>
                    </tr>

                </table>

                <!-- </div> --><!--Удаляет панельку белой полоски под заполнение-->
            </div> <!-- Ответственный За ширину -->
        </div>
        <br>

        <table id="datatable">
            <thead>
            <tr>

                <th>Картинка</th>
                <th>Артикул</th>
                <th>Тип1</th>
                <!--<th>Тип2</th>-->
                <th>Del</th>
                <th>*Код*</th>
                <th>Наименование</th>
                <th>Производитель</th>
                <th>Ед.изм</th>
                <th>Кол-во</th>
                <th>Цена</th>
                <th>Общая цена</th>
               <th>Цена Типа</th>

                <th>Примечание</th>
                <th>Место</th>


                <th></th>


            </tr>
            </thead>
        <tfoot>

        <tr>

            <th style="border:1px solid #ddd;">Картинка</th>
            <th style="border:1px solid #ddd;">Артикул</th>
            <th style="border:1px solid #ddd;">Тип1</th>
            <!--<th>Тип2</th>-->
            <th style="border:1px solid #ddd;">Del</th>
            <th style="border:1px solid #ddd;">*Код*</th>
            <th style="border:1px solid #ddd;">Наименование</th>
            <th style="border:1px solid #ddd;">Производитель</th>
            <th style="border:1px solid #ddd;">Ед.изм</th>
            <th style="border:1px solid #ddd;">Кол-во</th>
            <th style="border:1px solid #ddd;">Цена</th>
            <th style="border:1px solid #ddd;">Общая цена</th>
            <th style="border:1px solid #ddd;">Цена Типа</th>

            <th style="border:1px solid #ddd;">Примечание</th>
            <th style="border:1px solid #ddd;">Место</th>


            <th style="border:1px solid #ddd;"></th>


        </tr>
        </tfoot>
        </table>


<script>
        $(document).ready(function() {
        $('#example').DataTable( {
        "footerCallback": function ( row, data, start, end, display ) {
        var api = this.api(), data;

        // Remove the formatting to get integer data for summation
        var intVal = function ( i ) {
        return typeof i === 'string' ?
        i.replace(/[\$,]/g, '')*1 :
        typeof i === 'number' ?
        i : 0;
        };

        // Total over all pages
        total = api
        .column( 4 )
        .data()
        .reduce( function (a, b) {
        return intVal(a) + intVal(b);
        }, 0 );

        // Total over this page
        pageTotal = api
        .column( 4, { page: 'current'} )
        .data()
        .reduce( function (a, b) {
        return intVal(a) + intVal(b);
        }, 0 );

        // Update footer
        $( api.column( 4 ).footer() ).html(
        '$'+pageTotal +' ( $'+ total +' total)'
        );
        }
        } );
        } );
</script>
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
                        <label for="calories" class="control-label col-xs-3">Артикул</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="calories" name="calories"
                                   placeholder="calories">
                        </div>
                    </div>

                    --%>

                    <div class="form-group">
                        <label for="type1" class="control-label col-xs-3">Тип1</label>


                        <div class="col-xs-9">

                            <input type="text" class="form-control" list="type1" name="type1"
                                   placeholder="type1" />

                            <datalist id="type1">
                                <option>Сетевое оборудование</option>
                                <option>Сантехническое оборудование</option>
                                <option>Защитный лоток</option>
                                <option>Электрощитовое оборудование</option>
                                <option>Световое оборудование</option>
                                <option>Коммуникационные шкафы</option>
                                <option>Компьютерное оборудование</option>
                                <option>Телекомуникационные</option>
                                <option>Офисное оборудование</option>
                                <option>Пожарно-охранное оборудование</option>
                                <option>Цифровое</option>
                                <option>Электромонтажное</option>
                                <option>Монтажное оборудование</option>
                                <option>Аккумуляторы</option>
                                <option>Теплоизоляция и защитные покрытия</option>

                            </datalist>



                            <!-- VERSION WITHOUT TAG BOG
                            <input type="text" class="form-control" id="type1" name="type1"
                                   placeholder="type1"> -->

                            <!-- VERSION BIG BUG
                            <select class="form-control" name ="type1"  >

                                SELECTED НЕ БЫЛО ОБРАБОТАНО

                                <option selected="selected" value="type1"></option>
                                <option>Сетевое оборудование</option>
                                    <option>Сантехническое оборудование</option>
                                    <option>Защитный лоток</option>
                                    <option>Электрощитовое оборудование</option>
                                    <option>Световое оборудование</option>
                                    <option>Коммуникационные шкафы</option>
                                    <option>Компьютерное оборудование</option>
                                    <option>Телекомуникационные</option>
                                    <option>Офисное оборудование</option>
                                    <option>Пожарно-охранное оборудование</option>
                                    <option>Цифровое</option>
                                    <option>Электромонтажное</option>
                                    <option>Монтажное оборудование</option>
                                    <option>Аккумуляторы</option>
                                    <option>Теплоизоляция и защитные покрытия</option>



                            </select>-->

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
                            <input type="text" class="form-control" id="cod" name="cod">
                        </div>

                        <script type="text/javascript">
                            document.getElementById('cod').value = 0
                        </script>

                    </div>


                    <!-- Наименование в добавление -->
                    <div class="form-group">
                        <label for="naimenovanie" class="control-label col-xs-3">Наименование</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="naimenovanie" name="naimenovanie"
                                   placeholder="1000">
                        </div>
                    </div>
                    <!-- (K) Наименование в добавление -->
                    <!-- proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture -->
                    <div class="form-group">
                        <label for="proizvoditel" class="control-label col-xs-3">Производитель</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="proizvoditel" name="proizvoditel"
                                   placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edizmereniya" class="control-label col-xs-3">Ед.Изм</label>

                        <div class="col-xs-9">



                            <input type="text" class="form-control" list ="edizmereniya" name="edizmereniya"
                                   placeholder="Единицы">

                            <datalist id="edizmereniya">
                                    <option>шт</option>
                                    <option>Метры</option>
                                    <option>кг</option>
                            </datalist>


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
                            <input type="text" class="form-control" id="primechanie" name="primechanie"
                                   placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="articul" class="control-label col-xs-3">Артикул</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="articul" name="articul" placeholder="1000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="polka" class="control-label col-xs-3">Полка</label>

                        <div class="col-xs-9">
                            <input type="text" class="form-control" id="polka" name="polka" placeholder="1000">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="picture" class="control-label col-xs-3">Картинко-имя</label>

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
<%--<jsp:include page="fragments/footer.jsp"/>--%>
</body>
<jsp:include page="fragments/i18n.jsp"/>
<script type="text/javascript">
    i18n["addTitle"] = '<spring:message code="meal.add"/>';
    i18n["editTitle"] = '<spring:message code="meal.edit"/>';
</script>
</html>