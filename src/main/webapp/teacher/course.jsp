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
                                    选课
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>教学班</th>
                                        <th>课程名</th>
                                        <th>已报名人数</th>
                                        <th>选课名单</th>
                                        <th>查看评教</th>
                                        <th>结课</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="exit" items="${sessionScope.sesList}"
                                               varStatus="loop">
                                        <tr>
                                            <td>${exit.courseclass }</td>
                                            <td>${exit.cname }</td>
                                            <td>${exit.stuSum }</td>
                                            <td><a class="btn btn-outline-danger" href="/StudentInfo/TeacherHandler/looksel/${exit.courseclass }/${exit.cid }/1?cname=${exit.cname}">
                                                查看名单 </a></td>
                                            <td><a class="btn btn-outline-danger" href="/StudentInfo/TeacherHandler/looksurvey/${exit.courseclass}/${tid}/1">
                                                查看评教 </a></td>
                                            <td><a class="btn btn-outline-danger" href="/StudentInfo/TeacherHandler/endcou/${exit.courseclass }/${exit.cid }/1?cname=${exit.cname}">
                                                结课 </a></td>
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
                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/sercsc/${pageInfo.pageNum-1}" aria-label="Previous">«</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="page-item" ><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/TeacherHandler/sercsc/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                                <c:if test="${pageInfo.hasNextPage }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/sercsc/${pageInfo.pageNum+1}">»</a>
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
