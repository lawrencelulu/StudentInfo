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
                                    选课
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>教学班</th>
                                        <th>课程编号</th>
                                        <th>课程名</th>
                                        <th>先修课</th>
                                        <th>任课老师</th>
                                        <th>开学学期</th>
                                        <th>选择</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="course" items="${requestScope.coursePlanList}">
                                        <tr>
                                            <td>${course.courseclass }</td>
                                            <td>${course.cid }</td>
                                            <td>${course.cname}</td>
                                            <td>
                                                <c:forEach var="precourse" items="${course.precourseList}">
                                                    <span>${precourse.cpname}</span>
                                                </c:forEach>
                                            </td>
                                            <td>${course.tname}</td>
                                            <td>${course.semester}</td>
                                            <td><a class="btn btn-default"
                                                   href="/StudentInfo/StudentHandler/selcou/${course.courseclass}"> 选择
                                            </a></td>
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
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/StudentHandler/queryy/${pageInfo.pageNum-1}" aria-label="Previous">«</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="page-item" ><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/StudentHandler/queryy/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                                <c:if test="${pageInfo.hasNextPage }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/StudentHandler/queryy/${pageInfo.pageNum+1}">»</a>
                                                    </li>
                                                </c:if>
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
