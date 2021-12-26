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
                                    开班名 ${cname}
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>班级</th>
                                        <th>成绩</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="student" items="${sessionScope.lookList}">
                                        <tr>
                                            <td>${student.sid}</td>
                                            <td>${student.sname }</td>
                                            <td>${student.ssex}</td>
                                            <td>${student.classr}</td>
                                            <td>
                                                <c:if test="${student.grade != 0 }">
                                                    ${student.grade}
                                                </c:if>
                                                <c:if test="${student.grade == 0 }">
                                                    <form id="form-${student.sid}-${cid}">
                                                        <input type="hidden" name="sid" value="${student.sid}">
                                                        <input type="hidden" name="cid" value="${cid}">
                                                        <input type="hidden" name="courseclass" value="${student.classr}">
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <input type="text" name="grade" value="${student.grade}" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="submit"  class="btn btn-outline-danger btn-sm" value="给分" onclick="add('${cid}','${student.sid}')">
                                                            </div>
                                                        </div>
                                                    </form>
                                                </c:if>
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
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${pageInfo.pageNum-1}" aria-label="Previous">«</a>
                                                    </li>
                                                </c:if>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="page-item" ><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
                                                <c:if test="${pageInfo.hasNextPage }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${pageInfo.pageNum+1}">»</a>
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
        </section>
        <!-- /.content -->
    </div>
<script type="text/javascript">
    function add(cid,sid) {
        console.log(sid, cid, "#form-"+ sid + '-' + cid)
        $("#form-"+ sid + '-' + cid).submit(function(){
            console.log('data:',$("#form-"+ sid + '-' + cid).serialize())
            $.ajax({
                async: false,
                type: "POST",
                url: '/StudentInfo/TeacherHandler/addGrade',
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                data: $("#form-"+ sid + '-' + cid).serialize(),
                dataType: "text",
                success: function (data) {
                    alert("添加成功");
                },
                error: function (data) {
                    alert("err");
                }
            })
        })
    }
</script>
</div>
</body>
<jsp:include page="../footer.jsp" />
