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
                                    我的选课
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>教学班</th>
                                        <th>课程名</th>
                                        <th>授课老师</th>
                                        <th>学期</th>
                                        <th>退选/评教/成绩</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="exit" items="${requestScope.sesList}"
                                               varStatus="loop">
                                        <tr>
                                            <td>${exit.courseclass }</td>
                                            <td>${exit.cname }</td>
                                            <td>${exit.tname }</td>
                                            <td>${exit.semester }</td>
                                            <c:if test="${exit.grade != 0 && exit.isFeedback != 0 }">
                                                <td>${exit.grade }分</td>
                                            </c:if>
                                            <c:if test="${exit.grade == 0 && exit.isFeedback != 0 }">
                                                <td>教师暂未给分</td>
                                            </c:if>
                                            <c:if test="${exit.grade == 0 && exit.isComment == 0 }">
                                                <td><a class="btn btn-default"
                                                       href="/StudentInfo/StudentHandler/exitsel/${exit.courseclass}/${exit.sid}">
                                                    退选课程 </a></td>
                                            </c:if>
                                            <c:if test="${exit.isFeedback == 0 && exit.isComment != 0}">
                                                <td><a class="btn btn-danger"
                                                       href="/StudentInfo/StudentHandler/newSurvey/${exit.courseclass}?cname=${exit.cname}&tname=${exit.tname}">课程评教</a></td>
                                            </c:if>
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
                                                        <a class="page-link" href="/StudentInfo/StudentHandler/exitchoose/${pageInfo.pageNum-1}" aria-label="Previous">«</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="page-item" ><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/StudentHandler/exitchoose/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                                <c:if test="${pageInfo.hasNextPage }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/StudentHandler/exitchoose/${pageInfo.pageNum+1}">»</a>
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
