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
    <div class="content-wrapper" style="padding-top: 20px;">
        <!-- Main content -->
        <section class="content col-md-8" style="margin: 0 auto;">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">添加课程</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
<c:forEach var="course" items="${requestScope.courseList}">
                <form action="../moditystud/${course.cid}" method="get" name="form1">
                    <div class="card-body">
                        <div class="form-group">
                            <label>课程编号</label>
                            <input type="text" name="cid" id="cid" class="form-control" value="${course.cid}" maxlength="10" readonly></input>
                        </div>
                        <div class="form-group">
                            <label>课程名称</label>
                            <input type="text" name="cname" class="form-control"  value="${course.cname }" maxlength="10"></input>
                        </div>
                        <div class="form-group">
                            <label>先修课</label>
                            <select class="form-control select select-danger select-block mbl" name="cprecourse" value="${course.cprecourse}">
                                <c:if test="${course.cprecourse == ''}">
                                    <option value="" selected>无</option>
                                </c:if>
                                <c:forEach var="precourse" items="${requestScope.couList}">
                                    <c:if test="${precourse.cid == course.cprecourse}">
                                        <option value="${precourse.cid}" selected>${precourse.cname}</option>
                                    </c:if>
                                    <c:if test="${precourse.cid != course.cprecourse}">
                                        <option value="${precourse.cid}">${precourse.cname}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>学分</label>
                            <input type="number" name="cscore" class="form-control" value="${course.cscore }"></input>
                        </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <input type="submit" class="btn btn-danger float-right" value="修改" />
                    </div>
                </form>
</c:forEach>
            </div>
        </section>
        <!-- /.content -->
        <script type="text/javascript">
            $(document).ready(
                function() {
                    $("#cid").change(
                        function() {
                            $.post("/StudentInfo/AjaxHandler/existCid?cid="
                                + $("#cid").val(), function(data, status) {
                                $("#countt").html(data);
                            })

                        })

                })

        </script>
    </div>
</div>
</body>
<jsp:include page="../footer.jsp" />
