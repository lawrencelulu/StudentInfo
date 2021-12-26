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
						<a href="/StudentInfo/TeacherHandler/sercsc/${sessionScope.tid }/1" class="nav-link">查看名单/结课</a>
					</li>
				</ul>
			</div>

			<!-- Right navbar links -->
			<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="/StudentInfo/TeacherHandler/queryvita/${sessionScope.tid }" role="button">
						<i class="fas fa-user"></i> ${sessionScope.sname} 老师
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/StudentInfo/LoginHandler/teacherlogout">
						<i class="fas fa-sign-out-alt"></i> 登出
					</a>
				</li>
			</ul>
		</div>
	</nav>
