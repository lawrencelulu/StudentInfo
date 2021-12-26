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
<jsp:include page="./teacherLeft.jsp" />
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
                                        <td>/</td>
                                        <td>信息</td>
                                        <td>介绍</td>
                                    </tr>
                                    </thead>
                                    <tr>
                                        <td>工号</td>
                                        <td>${tid }</td>
                                        <td>教师信息唯一标示</td>
                                    </tr>

                                    <tr>
                                        <td>姓名</td>
                                        <td>${tname }</td>
                                        <td>不可修改</td>
                                    </tr>

                                    <tr>
                                        <td>密码</td>
                                        <td>${requestScope.tpassword }</td>
                                        <td><a class="btn btn-default" href="../moditypw/${sessionScope.tid }">修改 </a></td>
                                    </tr>

                                    <tr>
                                        <td>性别</td>
                                        <td>${requestScope.tsex }</td>
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
