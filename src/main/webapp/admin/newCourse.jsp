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
                <form action="/StudentInfo/CourseHandler/addCourse" method="post" name="form1">
                    <div class="card-body">
                        <div class="form-group">
                            <label>课程编号</label>
                            <input type="text" name="cid" id="cid" class="form-control" maxlength="10"></input>
                            <span id="countt" style="color: #ff0000;"></span>
                        </div>
                        <div class="form-group">
                            <label>课程名称</label>
                            <input type="text" name="cname" class="form-control" maxlength="10"></input>
                        </div>
                        <div class="form-group">
                            <label>先修课</label>
                            <select class="form-control select select-danger select-block mbl" name="cprecourse">
                                <option value="" selected>无</option>
                                <c:forEach var="course" items="${requestScope.couList}">
                                    <option value="${course.cid}">${course.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>学分</label>
                            <input type="number" name="cscore" class="form-control"></input>
                        </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <input type="submit" class="btn btn-danger float-right" value="添加" />
                    </div>
                </form>
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
