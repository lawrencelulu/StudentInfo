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
                                    查看教学班：${courseclass } 的学生评教
                                </h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>学号</th>
                                        <th>评论</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="student" items="${sessionScope.lookList}">
                                        <tr>
                                            <td>${student.sid}</td>
                                            <td>${student.feedback }</td>
                                            <td>
                                                <c:if test="${student.reply != null }">
                                                    ${student.reply}
                                                </c:if>
                                                <c:if test="${student.reply == null || student.reply == '' }">
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <input type="text" name="reply" id="reply-${student.id}" value="${student.reply}" class="form-control form-control-sm">
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="submit"  class="btn btn-outline-danger btn-sm" value="回复" onclick="add('${student.id}', '${tid}')">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
<%--                            <div class="card-footer">--%>
<%--                                <div class="row">--%>
<%--                                    <!--分页文字信息  -->--%>
<%--                                    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }--%>
<%--                                        页,总 ${pageInfo.total } 条记录</div>--%>
<%--                                    <!-- 分页条信息 -->--%>
<%--                                    <div class="col-md-6">--%>
<%--                                        <nav aria-label="Page navigation">--%>
<%--                                            <ul class="pagination">--%>
<%--                                                <c:if test="${pageInfo.hasPreviousPage }">--%>
<%--                                                    <li class="page-item">--%>
<%--                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${pageInfo.pageNum-1}" aria-label="Previous">«</a>--%>
<%--                                                    </li>--%>
<%--                                                </c:if>--%>

<%--                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">--%>
<%--                                                    <c:if test="${page_Num == pageInfo.pageNum }">--%>
<%--                                                        <li class="page-item" ><a class="page-link" href="#">${page_Num }</a></li>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${page_Num != pageInfo.pageNum }">--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${page_Num }">${page_Num }</a>--%>
<%--                                                        </li>--%>
<%--                                                    </c:if>--%>

<%--                                                </c:forEach>--%>
<%--                                                <c:if test="${pageInfo.hasNextPage }">--%>
<%--                                                    <li class="page-item">--%>
<%--                                                        <a class="page-link" href="/StudentInfo/TeacherHandler/looksel/${requestScope.cid }/${requestScope.cname}/${pageInfo.pageNum+1}">»</a>--%>
<%--                                                    </li>--%>
<%--                                                </c:if>--%>
<%--                                            </ul>--%>
<%--                                        </nav>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
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
    function add(id, tid) {
        console.log('data:',$("#reply-"+ id).val())
        const data = { tid, id, reply: $("#reply-"+ id).val() }
        $.ajax({
            async: false,
            type: "POST",
            url: '/StudentInfo/AjaxHandler/updateSurvey',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            data,
            success: function (data) {
                location.reload()
            },
            error: function (data) {
                console.error(data);
            }
        })
    }
</script>
</div>
</body>
<jsp:include page="../footer.jsp" />
