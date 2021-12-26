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
<jsp:include page="./adminLeft.jsp" />
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content"  style="margin-top: 24px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header clearfix">
                                <h2 class="card-title float-left">
                                    教师管理
                                </h2>
                                <div class="float-right">
                                    <a href="/StudentInfo/AdminHandler/addtea" class="btn btn btn-outline-danger">
                                        <i class="fas fa-plus"></i>
                                        添加教师
                                    </a>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>教师工号</th>
                                        <th>教师姓名</th>
                                        <th>级别</th>
                                        <th>性别</th>
                                        <th>手机号</th>
                                        <th>生日</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="teacher" items="${requestScope.teacherList}">
                                        <tr>
                                            <td>${teacher.tid }</td>
                                            <td>${teacher.tname }</td>
                                            <td>${teacher.tlevel }</td>
                                            <td>${teacher.tsex }</td>
                                            <td>${teacher.tphone }</td>
                                            <td>${teacher.tbirthday }</td>
                                            <td>
                                                <a class="btn btn-outline-danger" href="/StudentInfo/AdminHandler/modityTea/${teacher.tid}">
                                                    <i class="fas fa-edit"></i>
                                                    修改
                                                </a>
                                                <a class="deleteCss btn btn-outline-dark" href="/StudentInfo/AdminHandler/deleteTea/${teacher.tid}">
                                                    <i class="fas fa-trash-alt"></i>
                                                    删除
                                                </a>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="row">
                                    <!--分页文字信息  -->
                                    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                                        页,总 ${pageInfo.total } 条记录</div>
                                    <!-- 分页条信息 -->
                                    <div class="col-md-6">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
                                                <c:if test="${pageInfo.hasPreviousPage }">
                                                    <li class="page-link">
                                                        <a class="page-link" href="/StudentInfo/AdminHandler/managecou/${pageInfo.pageNum-1}"
                                                           aria-label="Previous"><span aria-hidden="true">«</span>
                                                        </a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="active page-item"><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/AdminHandler/managestu/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
<%--                                                <c:if test="${pageInfo.hasNextPage }">--%>
<%--                                                    <li><a href="/StudentInfo/AdminHandler/managecou/${pageInfo.pageNum+1 }"--%>
<%--                                                           aria-label="Next"> <span aria-hidden="true">»</span>--%>
<%--                                                    </a></li>--%>
<%--                                                </c:if>--%>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
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
