<%-- 
    Document   : SubClassi
    Created on : Feb 21, 2019, 10:10:18 PM
    Author     : Mathan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.SubClassifaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MainClassifaction"%>
<%@page import="Model.MainClassifaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Sub Classifaction Panel</title>

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Bootstrap core CSS -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap-fileupload/bootstrap-fileupload.css" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap-datepicker/css/datepicker.css" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap-daterangepicker/daterangepicker.css" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap-timepicker/compiled/timepicker.css" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap-datetimepicker/datertimepicker.css" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src ="http://code.jquery.com/jquery-latest.js"></script>
        <link href="css/style-responsive.css" rel="stylesheet">
        <script src="lib/chart-master/Chart.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            function getMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfRecords = Object.keys(json.MainClassification).length;
                        //var mainClassificationId = json.MainClassification[0].MainClassificationId;
                        //var mainClassificationName = json.MainClassification[0].MainClassificationName;

                        option = '<option Selected disabled hidden>Please select Main Classification</option>';

                        for (var x = 0; x < noOfRecords; x++) {
                            option += "<option value='" + json.MainClassification[x].MainClassificationId + "'>" + json.MainClassification[x].MainClassificationName + "</option>";
                        }

                        // Remove and load the main classification record in the drop down menu
                        $('#mainClassificationDropDown')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);

                        $('#editSubClassificationMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);


                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getEditSubClassificationMainClassification(subClassificationId) {
                $.ajax({
                    url: 'GetMainClassificationController?subClassificationId=' + subClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        option = '<option>Select Main Classification</option>';
                        for (var x = 0; x < noOfList; x++) {
                            option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                        }
                        $('#editSubClassificationMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option)
                                ;
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getSubClassificationDetailsById(subClassificationId) {
                $.ajax({
                    url: 'GetSubClassificationByIdController?subClassificationId=' + subClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var subClassificationId = json.SubClassification[0].SubClassificationId;
                        var subClassificationName = json.SubClassification[0].SubClassificationName;
                        var mainClassificationId = json.SubClassification[0].MainClassificationId;
                        var mainClassificationName = json.SubClassification[0].MainClassificationName;

                        $("#editSubClassificationIdLabel").text(subClassificationId);
                        $("#editSubClassificationId").val(subClassificationId);

                        setTimeout(function () {
                            $("#editSubClassificationMainClassification").val(mainClassificationId);
                        }, 100);

                        $("#editSubClassificationName").val(subClassificationName);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            $(document).ready(function () {
                $("#btnAddSubClassification").click(function () {
                    getMainClassification();
                });

                $(document).on('click', 'i[id^="editBtn"]', function () {
                    var editSubClassificationId = $(this).attr('value');
                    getMainClassification();

                    setTimeout(function () {
                        getSubClassificationDetailsById(editSubClassificationId);
                    }, 100);
                });

            });
            $(document).on('click', 'i[id^="deleteBtn"]', function () {
                //alert($(this).attr('value'));
                var deleteSubClassificationId = $(this).attr('value');
                var deleteSubClassificationIdValue = $(this).attr('id');
                //alert(deleteBookIdValue);
                $("#deleteSubClassificationId").val(deleteSubClassificationId);
            });
            

        </script>
    </head>

    <body>
        <section id="container">
            <!-- **********************************************************************************************************************************************************
                TOP BAR CONTENT & NOTIFICATIONS
                *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="index.html" class="logo"><b>Library<span>MS::</span></b></a>
                <!--logo end-->

                <div class="top-menu">
                    <ul class="nav pull-right top-menu">

                        <li><a class="logout black-bg" href="index.jsp">REFRESH</a></li>
                        <li><a class="logout" href="#">EXIT</a></li>




                    </ul>
                </div>
            </header>
            <!--header end-->
            <!-- **********************************************************************************************************************************************************
                MAIN SIDEBAR MENU
                *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                         <p class="centered"><a href="index.jsp"><img src="img/2.png" class="img-circle" height="80" width="80"></a></p>
            <h5 class="centered">:: Mathan Jeya ::</h5>
                        <li class="mt">
                            <a href="index.jsp">
                                <i class="fa fa-dashboard"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a class="active" href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>Book Panel</span>
                            </a>
                            <ul class="sub">
                                  <li class="active"><a href="ViewBookController"><i class="fa fa-cogs"></i>COMMON PANEL</a></li>
              <li></i><a href="ViewBookController"><i class="fa fa-check-circle"></i>Add Book</a></li>
              
              <li></i><a href="ViewBookController"><i class="fa fa-check-circle"></i>Delete Book</a></li>
              <li></i><a href="ViewBookController"><i class="fa fa-check-circle"></i>Update Book</a></li>

                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>Classifaction</span>
                            </a>
                            <ul class="sub">
                                <li><a href="./ViewMainClassificationController"><i class="fa fa-check-circle"></i>Main Classifaction</a></li>
                                <li><a href="./ViewSubClassificationController"><i class="fa fa-check-circle"></i>Sub Classifaction</a></li>
                            </ul>
                        </li>



                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
            <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-9 main-chart" id="dashboard-iframe">
 <a href="#addSubClassificationModal" class="btn btn-success" data-toggle="modal">
                                <!--<i class="material-icons">&#xE147;</i>-->
                                <span>ADD SUB CLASSIFICATION</span>
               </a>
    <div class="table table-striped table-advance table-hover">
                 <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">  
        
                    <thead>
                        <tr>
                            <th style="width:auto;">ID</th>
                            <th style="width:auto;">Sub Classification Name</th>
                            <th style="width:auto;">Main Classification ID</th>
                            <th style="width:auto;">Main Classification Name</th>
                              <th style="width:auto;">Action </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("result") != null) {
                                ArrayList<SubClassifaction> result = (ArrayList) request.getAttribute("result");
                                SubClassifaction b = null;
                                for (int i = 0; i < result.size(); i++) {
                                    b = result.get(i);
                        %>
                        <tr>
                            <td style="width: auto;"><%=b.getSubClassificationId()%></td>
                            <td><%=b.getSubClassificationName()%></td>
                            <td><%=b.getMainClassificationId()%></td>
                            <td><%=b.getMainClassificationName()%></td>
                            <td>
                                <a href="#editSubClassificationModal" class="edit" data-toggle="modal">
                                 <button class="btn btn-primary btn-xs">    <i class="fa fa-pencil" id="editBtn<%=b.getSubClassificationId()%>" value="<%=b.getSubClassificationId()%>" title="Edit">&#xE254;</i></button>  
                                </a>
                                <a href="#deleteSubClassificationModal" class="delete" data-toggle="modal">
                                     <button class="btn btn-danger btn-xs"> <i class="fa fa-trash-o"  id="deleteBtn<%=b.getSubClassificationId()%>" value="<%=b.getSubClassificationId()%>" title="Delete">&#xE872;</i></button>  
                                </a>
                            </td>

                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
                     <div class="clearfix">
                    <div class="hint-text">Total
                        <b>${records}</b> record(s)</div>
                </div>
    </div>
<!-- Add Sub Classification HTML -->
        <div id="addSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="AddSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <input type="text" class="form-control" name="subClassificationId" id="subClassificationId" required>
                            </div>
                            <div class="form-group" style="margin-bottom:20px;">
                                <label>Main Classification</label>
                                <select class="form-control" name="mainClassificationDropDown" id="mainClassificationDropDown">

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" name="subClassificationName" id="subClassificationName" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Sub Classification -->
        <div id="editSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="EditSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <label class="form-control" id="editSubClassificationIdLabel" name="editSubClassificationIdLabel" readonly></label>
                                <input type="text" name="editSubClassificationId" id="editSubClassificationId" class="form-control" hidden style="display:none;">
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" style="margin-bottom:20px;" id="editSubClassificationMainClassification" name="editSubClassificationMainClassification">
                                    <option>Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" id="editSubClassificationName" name="editSubClassificationName" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Delete Sub Classification model -->
        <div id="deleteSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteSubClassificationController">
                        <input type="text" name="deleteSubClassificationId" id="deleteSubClassificationId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Do want to delete this record?</p>
                           
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
        $('.dropdown-menu a.dropdown-toggle').on('click', function (e) {
            if (!$(this).next().hasClass('show')) {
                $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            var $subMenu = $(this).next(".dropdown-menu");
            $subMenu.toggleClass('show');


            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
                $('.dropdown-submenu .show').removeClass("show");
            });


            return false;
        });

    </script>
                            <!-- /row -->
                        </div>
                        <!-- /col-lg-9 END SECTION MIDDLE -->
                        <!-- **********************************************************************************************************************************************************
                            RIGHT SIDEBAR CONTENT
                            *********************************************************************************************************************************************************** -->
                        <br>
                        <div class="col-lg-3 ">
                            <form class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                <button type="submit" name="save" class="btn btn-primary">Search</button> 
                            </form><br><br>
                            <!--COMPLETED ACTIONS DONUTS CHART-->

                            <!--NEW EARNING STATS -->

                            <!-- RECENT ACTIVITIES SECTION -->


                            <!-- USERS ONLINE SECTION -->

                            <!-- CALENDAR-->
                            <div id="calendar">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- / calendar -->
                        </div>
                        <!-- /col-lg-3 -->
                    </div>
                    <!-- /row -->
                </section>
            </section>
            <!--main content end-->
            <!--footer start-->



            <!--footer end-->
        </section>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="lib/jquery/jquery.min.js"></script>

        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
        <script src="lib/jquery.scrollTo.min.js"></script>
        <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="lib/jquery.sparkline.js"></script>
        <!--common script for all pages-->
        <script src="lib/common-scripts.js"></script>
        <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="lib/gritter-conf.js"></script>
        <!--script for this page-->
        <script src="lib/sparkline-chart.js"></script>
        <script src="lib/zabuto_calendar.js"></script>

        <!--script for this page-->
        <script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
        <script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="lib/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="lib/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script type="text/javascript" src="lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="lib/bootstrap-daterangepicker/moment.min.js"></script>
        <script type="text/javascript" src="lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
        <script src="lib/advanced-form-components.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                var unique_id = $.gritter.add({
                    // (string | mandatory) the heading of the notification
                    title: 'Welcome to LMS-2019',
                    // (string | mandatory) the text inside the notification
                    text: 'Library Management System for You',
                    // (string | optional) the image to display on the left
                    image: 'img/df.png',
                    // (bool | optional) if you want it to fade out on its own or just sit there
                    sticky: false,
                    // (int | optional) the time you want it to be alive for before fading out
                    time: 4000,
                    // (string | optional) the class name you want to apply to that specific message
                    class_name: 'my-sticky-class'
                });

                return false;
            });
        </script>
        <script type="application/javascript">
            $(document).ready(function() {
            $("#date-popover").popover({
            html: true,
            trigger: "manual"
            });
            $("#date-popover").hide();
            $("#date-popover").click(function(e) {
            $(this).hide();
            });

            $("#my-calendar").zabuto_calendar({
            action: function() {
            return myDateFunction(this.id, false);
            },
            action_nav: function() {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
            },
            {
            type: "block",
            label: "Regular event",
            }
            ]
            });
            });

            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>


    </body>


</html>

