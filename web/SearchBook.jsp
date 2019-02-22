<%-- 
    Document   : SearchBook
    Created on : Feb 21, 2019, 11:14:53 PM
    Author     : Mathan
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Book"%>
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
        <title>Main Book Dashboard</title>

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
        <link href="css/style-responsive.css" rel="stylesheet">
        <script src="lib/chart-master/Chart.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
          <script>
            function getAddBookMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += "<option value='" + json.MainClassification[x].MainClassificationId + "'>" + json.MainClassification[x].MainClassificationName + "</option>";
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#addBookMainClassification')
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

            function getEditBookMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            //option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                            option += "<option value='" + json.MainClassification[x].MainClassificationId + "'>" + json.MainClassification[x].MainClassificationName + "</option>";
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookMainClassification')
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

            function loadAddBookPublishYear() {
                var date = new Date();
                var endYear = 2005;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#addBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadEditBookPublishYear() {
                var date = new Date();
                var endYear = 2005;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#editBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadAllSubClassification() {
                $.ajax({
                    url: 'GetSubClassificationController',

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                              option += "<option value='" + json.SubClassification[x].SubClassificationId + "'>" + json.SubClassification[x].SubClassificationName + "</option>";
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
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

            function loadAllLastPrintYear(publishYear) {
                var date = new Date();
                option = '<option>Select Last Print Year</option>';
                for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                    option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                }

                $('#editBookLastPrintYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function getBookDetailsById(editBookId) {
                $.ajax({
                    url: 'GetBookDetailsByIdController?bookId=' + editBookId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var bookId = json.books[0].bookId;
                        var bookTitle = json.books[0].Title;
                        var bookAuthor = json.books[0].Author;
                        var bookPublishYear = json.books[0].PublishYear;
                        var bookMainClassificationId = json.books[0].MainClassificationId;
                        var bookSubClassificationId = json.books[0].SubClassificationId;
                        var bookISBN = json.books[0].ISBN;
                        


                        $("#editBookIdLabel").text(bookId);
                        $("#editBookId").val(bookId);
                        $("#editBookTitle").val(bookTitle);
                        $("#editBookAuthor").val(bookAuthor);
                        $("#editBookMainClassification").val(bookMainClassificationId);

                        getSubClassificationByMainClassificationEditBox(bookMainClassificationId);
                        setTimeout(function () {
                            $("#editBookSubClassification").val(bookSubClassificationId);
                        }, 100);

                        $("#editBookPublishYear").val(bookPublishYear);
                        $("#editISBN").val(bookISBN);
                      
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getSubClassificationByMainClassificationEditBox(mainClassificationId) {
                //var mainClassificationId = $('#editBookMainClassification :selected').val();
                $.ajax({
                    url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                              option += "<option value='" + json.SubClassification[x].SubClassificationId + "'>" + json.SubClassification[x].SubClassificationName + "</option>";
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
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

            $(document).ready(function () {
                $("#addBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                option += "<option value='" + json.SubClassification[x].SubClassificationId + "'>" + json.SubClassification[x].SubClassificationName + "</option>";
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#addBookSubClassification')
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
                });

                $("#editBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#editBookSubClassification')
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
                });

                $("#addBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#addBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $("#editBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#editBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $(document).on('click', 'i[id^="editBtn"]', function () {
                    //alert($(this).attr('value'));
                    var editBookId = $(this).attr('value');
                    getEditBookMainClassification();
                    loadAllSubClassification();
                    loadEditBookPublishYear();
                    getBookDetailsById(editBookId);
                });

                $(document).on('click', 'i[id^="deleteBtn"]', function () {
                    //alert($(this).attr('value'));
                    var deleteBookId = $(this).attr('value');
                    var deleteBookIdValue = $(this).attr('id');
                    //alert(deleteBookIdValue);
                    $("#deleteBookId").val(deleteBookId);
                });
//                $("#btnViewAll").click(function () {
//                    $("#tbodyBookDetails").empty();
//
//                    $("#totalRecordCount").empty();
//
//                    var viewAllRecords = $("#btnViewAll").attr("value");
//
//                    $.ajax({
//                        url: 'SearchBookController?viewAllRecords=' + viewAllRecords,
//
//                        complete: function (viewResponse) {
//                            var json = JSON.parse(viewResponse.responseText);
//                            var noOfList = Object.keys(json.books).length;
//                            //alert(json.MainClassification[0].mainClassificationName);
//
//                            for (var x = 0; x < noOfList; x++) {
//                                var bookId = json.books[x].bookId;
//                                var bookTitle = json.books[x].Title;
//                                var bookAuthor = json.books[x].Author;
//                                var bookPublishYear = json.books[x].PublishYear;
//                                
//                                var bookISBN = json.books[x].ISBN;
//                                
//                                var bookMainClassificationId = json.books[x].MainClassificationId;
//                                var bookMainClassificationName = json.books[x].MainClassificationName;
//                                var bookSubClassificationId = json.books[x].SubClassificationId;
//                                var bookSubClassification = json.books[x].SubClassificationName;
//
//                                //alert(json.MainClassification[x].mainClassificationName);
//                                //$('#output').html(user_profile.books[x].bookId);
//                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
//                                var tbodyViewAll = '<tr>\n\
//                                                    <td>' + bookId + '</td>\n\
//                                                    <td>' + bookTitle + '</td>\n\
//                                                    <td>' + bookAuthor + '</td>\n\
//                                                    <td>' + bookMainClassificationName + '</td>\n\
//                                                    <td>' + bookSubClassification + '</td>\n\
//                                                    <td>' + bookPublishYear + '</td>\n\
//                                                   
//                                                    <td>' + bookISBN + '</td>\n\
//                                                    
//                                                    <td>\n\
//                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
//                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
//                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
//                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
//                                                    </td>\n\
//                                                    </tr>';
//
//                                $("#tbodyBookDetails").append(tbodyViewAll);
//                            }
//                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
//                            $("#totalRecordCount").append(totalRecords);
//                        },
//
//                        error: function () {
//                            //$('#id').html('Error receiving the response from json');
//                            console.log('Error receiving the response from json');
//                        },
//                    });
//                    return false;
//                });

//                $("#btnSearchBook").click(function () {
//                    $("#tbodyBookDetails").empty();
//
//                    $("#totalRecordCount").empty();
//
//                    var firstFilterType = $("#firstFilterType").find('option:selected').attr('id');
//                    var firstFilterText = $("#firstFilterText").val();
//                    var secondFilterType = $("#secondFilterType").find('option:selected').attr('id');
//                    var secondFilterText = $("#secondFilterText").val();
//                    //var editBookId = $(this).attr('value');
//
//                    $.ajax({
//                        url: 'SearchBookController?firstFilterText=' + firstFilterText + '&firstFilterType=' + firstFilterType + '&secondFilterType=' + secondFilterType + '&secondFilterText=' + secondFilterText,
//
//                        complete: function (searchResponse) {
//                            var json = JSON.parse(searchResponse.responseText);
//                            var noOfList = Object.keys(json.books).length;
//                            //alert(json.MainClassification[0].mainClassificationName);
//
//                            for (var x = 0; x < noOfList; x++) {
//                                var bookId = json.books[x].bookId;
//                                var bookTitle = json.books[x].Title;
//                                var bookAuthor = json.books[x].Author;
//                                var bookPublishYear = json.books[x].PublishYear;
//                                
//                                var bookISBN = json.books[x].ISBN;
//                                
//                                var bookMainClassificationId = json.books[x].MainClassificationId;
//                                var bookMainClassificationName = json.books[x].MainClassificationName;
//                                var bookSubClassificationId = json.books[x].SubClassificationId;
//                                var bookSubClassification = json.books[x].SubClassificationName;
//
//                                //alert(json.MainClassification[x].mainClassificationName);
//                                //$('#output').html(user_profile.books[x].bookId);
//                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
//                                var tbodyViewAll = '<tr>\n\
//                                                    <td>' + bookId + '</td>\n\
//                                                    <td>' + bookTitle + '</td>\n\
//                                                    <td>' + bookAuthor + '</td>\n\
//                                                    <td>' + bookMainClassificationName + '</td>\n\
//                                                    <td>' + bookSubClassification + '</td>\n\
//                                                    <td>' + bookPublishYear + '</td>\n\
//                                                   
//                                                    <td>' + bookISBN + '</td>\n\
//                                                    
//                                                    <td>\n\
//                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
//                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
//                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
//                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
//                                                    </td>\n\
//                                                    </tr>';
//
//                                $("#tbodyBookDetails").append(tbodyViewAll);
//                            }
//                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
//                            $("#totalRecordCount").append(totalRecords);
//                        },
//
//                        error: function () {
//                            //$('#id').html('Error receiving the response from json');
//                            console.log('Error receiving the response from json');
//                        },
//                    });
//                    return false;
//                });
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
                            <a href="index.html">
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
                        <div class="col-lg-9 main-chart" >
                            <div class="table table-striped table-advance table-hover">

                                <a href="#addBookModal" id="btnAddBook" class="btn btn-success" data-toggle="modal" onclick="getAddBookMainClassification();
                                   loadAddBookPublishYear();">

                                    <span>Add New Book</span>
                                </a>
                                <a href="./ViewBookController" class="btn btn-primary" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">
                                    <span>View All</span>
                                </a><br>


                                <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">  
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="width: 8%;" >ID</th>
                                            <th >Title</th>
                                            <th >Author</th>
                                            <th>Main Class</th>
                                            <th>Sub Class</th>
                                            <th>P.Year</th>
                                            <th>ISBN</th>
                                            <th>Action</th>

                                        </tr>
                                    </thead> 
                                    <tbody class="table-hover">
                                        <%
                                            if (request.getAttribute("result") != null) {
                                                List<Book> result = (List) request.getAttribute("result");
                                                Book b = null;
                                                for (int i = 0; i < result.size(); i++) {
                                                    b = result.get(i);
                                        %>
                                        <tr>
                                            <td style=" width: 5%;"><%=b.getBookId()%></td>
                                            <td><%=b.getTitle()%></td>
                                            <td><%=b.getAuthor()%></td>
                                            <td><%=b.getMainClassification()%></td>
                                            <td><%=b.getSubClassification()%></td>
                                            <td><%=b.getYearOfPublishing()%></td>
                                            <td><%=b.getISBN()%></td>
                                            <td>
                                                <a href="#editBookModal" class="edit" data-toggle="modal">
                                                    <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"  id="editBtn<%=b.getBookId()%>" value="<%=b.getBookId()%>" title="Edit">&#xE254;</i></button>
                                                </a>
                                                <a href="#deleteBookModal" class="delete" data-toggle="modal">
                                                    <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o " id="deleteBtn<%=b.getBookId()%>" value="<%=b.getBookId()%>" title="Delete">&#xE872;</i></button>
                                                </a>
                                            </td>
                                        </tr>
                                        <%}
                            }%>
                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text">Total 
                                        <b>${records}</b> record(s) Found</div>
                                </div>
                            </div>
                            <!-- /row -->
                        </div>

              <!-- ADD BOOK -->
        <div id="addBookModal" class="modal fade">
            <div class="modal-dialog" style="max-width:100%;">
                <div class="modal-content">
                    <form method="get" action="BookController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                               <label>Book Id</label>
                                <input type="text" name="bookId" placeholder="Enter Book Name Here !" class="form-control" required>
                            </div>
                            <div class="form-group">
                               <label>Book Name</label>
                                <input type="text" name="bookTitle" class="form-control" placeholder="Enter Book Name Here !"required>
                            </div>
                            <div class="form-group">
                                <label>Book Author</label>
                                <input type="text" name="bookAuthor"  placeholder="Enter Author Name Here !" class="form-control" required>
                            </div>
                            <div class="form-group">
                               <label>Main Category</label>
                                <select class="form-control" id="addBookMainClassification" placeholder="Select Main Classification Here !" name="addBookMainClassification">
                                    <option>Select Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                               <label>Sub Category</label>
                                <select class="form-control" id="addBookSubClassification" name="addBookSubClassification">
                                </select>
                            </div>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Published Year</label>
                                <select class="form-control" placeholder="Publish Year Here !" id="addBookPublishYear" name="addBookPublishYear">
                                    <option>Publish Year</option>
                                </select>
                            </div>
                           
                            <div class="form-group">
                                <label>ISBN No</label>
                                <input type="text" name="isbn" placeholder="ISBN Here !"  class="form-control" required>
                            </div>
                           
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save" style="background: #54a754;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
                        <!-- edite model-->
                        <div id="editBookModal" class="modal fade">
                            <div class="modal-dialog" style="max-width:80%;">
                                <div class="modal-content">

                                    <form method="get" action="EditBookController">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit Book</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body col-md-6">
                                            <div class="form-group">
                                                <label>Book ID</label>
                                                <label class="form-control" name="editBookIdLabel" id="editBookIdLabel" readonly></label>
                                                <input type="text" name="editBookId" id="editBookId" class="form-control" hidden style="display:none;">
                                            </div>
                                            <div class="form-group">
                                                <label>Book Title</label>
                                                <input type="text" name="editBookTitle" id="editBookTitle" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Book Author</label>
                                                <input type="text" name="editBookAuthor" id="editBookAuthor" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Main Classification</label>
                                                <select class="form-control" id="editBookMainClassification" name="editBookMainClassification">
                                                    <option>Select Main Classification</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Sub Classification</label>
                                                <select class="form-control" id="editBookSubClassification" name="editBookSubClassification">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-body col-md-6">
                                            <div class="form-group">
                                                <label>Publish Year</label>
                                                <select class="form-control" id="editBookPublishYear" name="editBookPublishYear">
                                                    <option>Publish Year</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>ISBN No</label>
                                                <input type="text" name="editISBN" id="editISBN" class="form-control" required>
                                            </div>
                                            
                                        </div>

                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-info" value="Save" style="background: #54a754;">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Delete Modal HTML -->
        <div id="deleteBookModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteBookController">
                        <input type="text" name="deleteBookId" id="deleteBookId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4>Delete Record !!</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Do You Want To Delete This Record ?</p>
                            
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-primary" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
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
