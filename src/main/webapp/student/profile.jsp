<%--
  Created by IntelliJ IDEA.
  User: lhj
  Date: 2021/4/7
  Time: 11:06 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="./studentLeft.jsp" />
    <div class="content-wrapper">
        <section class="content" style="margin-top: 24px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header clearfix">
                                <h2 class="card-title float-left">
                                    个人信息
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>/</th>
                                        <th>信息</th>
                                        <th>介绍</th>
                                    </tr>
                                    </thead>
                                    <tr>
                                        <td>学号</td>
                                        <td>${sid }</td>
                                        <td>学生信息唯一标示</td>
                                    </tr>

                                    <tr>
                                        <td>姓名</td>
                                        <td>${sname }</td>
                                        <td>不可修改</td>
                                    </tr>

                                    <tr>
                                        <td>身份证</td>
                                        <td>${requestScope.sidcard }</td>
                                        <td>不可修改</td>
                                    </tr>

                                    <tr>
                                        <td>性别</td>
                                        <td>${requestScope.ssex }</td>
                                        <td>不可修改</td>
                                    </tr>

                                    <tr>
                                        <td>密码</td>
                                        <td>${requestScope.spassword }</td>
                                        <td><a class="btn btn-default" href="/StudentInfo/StudentHandler/moditypwstu/${sessionScope.sid }">修改 </a></td>
                                    </tr>

                                    <tr>
                                        <td>年龄</td>
                                        <td>${requestScope.sage }</td>
                                        <td>不可修改</td>
                                    </tr>

                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
</div>
</body>
<jsp:include page="../footer.jsp" />
