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
                    <h3 class="card-title">更新学生信息</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <c:forEach var="student" items="${requestScope.studentList}">
                <form action="../moditystud/${student.sid}" method="get" name="form1">
                    <div class="card-body">
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" name="sname" value="${student.sname }" class="form-control"  maxlength="10"></input>
                        </div>
                        <div class="form-group">
                            <label>身份证号</label>
                            <input type="text" name="sidcard" value="${student.sidcard }" class="form-control" maxlength="16"></input>
                        </div>
                        <div class="form-group">
                            <label>年龄</label>
                            <input type="number" name="sage" value="${student.sage }" class="form-control"></input>
                        </div>
                        <div class="form-group clearfix">
                            <div class="row">
                                <div class="col-md-12" style="margin-bottom: 16px;">
                                    <strong>性别</strong>
                                </div>
                                <!-- radio -->
                                <div class="col-md-2">
                                    <div class="icheck-danger d-inline">
                                        <input type="radio" name="ssex" value="男" id="radio1" data-toggle="radio" class="custom-radio">
                                        <label for="radio1" >男</label>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="icheck-danger d-inline">
                                        <input type="radio" name="ssex" value="女" id="radio2" data-toggle="radio" class="custom-radio">
                                        <label for="radio2">女</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" name="spassword" value="${student.spassword }" class="form-control" onkeyup="this.value=this.value.replace(/(^\s+)|(\s+$)/g,'');" maxlength="16"/>
                        </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <input type="submit" class="btn btn-danger float-right" value="更新" />
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
