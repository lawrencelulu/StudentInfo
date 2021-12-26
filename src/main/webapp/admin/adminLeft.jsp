<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../head.jsp" />
<body class="hold-transition layout-top-nav sidebar-mini">
<div class="wrapper">
<nav class="main-header navbar navbar-expand navbar-dark navbar-danger" style="border: none;">
	<div class="container-fluid">
		<a href="#" class="navbar-brand">
			<span class="brand-text font-weight-light">学生管理系统</span>
		</a>

		<button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse order-3" id="navbarCollapse">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="/StudentInfo/AdminHandler/managestu/1" class="nav-link">学生管理</a>
				</li>
				<li class="nav-item">
					<a href="/StudentInfo/AdminHandler/managetea/1" class="nav-link">教师管理</a>
				</li>
				<li class="nav-item">
					<a href="/StudentInfo/CourseHandler/managecou/1" class="nav-link">课程管理</a>
				</li>
				<li class="nav-item">
					<a href="/StudentInfo/AdminHandler/managecou/1" class="nav-link">管理教学班</a>
				</li>
			</ul>
		</div>

		<!-- Right navbar links -->
		<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
			<li class="nav-item">
				<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
					<i class="fas fa-user"></i> ${sessionScope.aname}
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/StudentInfo/LoginHandler/adminlogout">
					<i class="fas fa-sign-out-alt"></i> 登出
				</a>
			</li>
		</ul>
	</div>
</nav>



