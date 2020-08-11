<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${defines.URL_ADMIN}/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${defines.URL_ADMIN}/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>AdminBT - VinaEnter</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="${defines.URL_ADMIN}/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${defines.URL_ADMIN}/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="${defines.URL_ADMIN}/assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${defines.URL_ADMIN}/assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="${defines.URL_ADMIN}/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!--trái-->

<tiles:insertAttribute name="left_bar"></tiles:insertAttribute>

<!--hết trái-->
    <div class="main-panel">
	
	<!--header-->

	<tiles:insertAttribute name="header"></tiles:insertAttribute>

	<!--end header-->
	
        <div class="content">
		<!--content-->
            
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
            
			<!--end content-->
        </div>
<!--foooter-->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
