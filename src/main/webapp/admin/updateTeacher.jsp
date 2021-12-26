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
                    <h3 class="card-title">添加教师</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
<c:forEach var="teacher" items="${requestScope.teacherList}">
                <form action="../modityTeac/${teacher.tid}" method="get">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="tid">教师编号</label>
                            <input type="text" name="tid" id="tid" class="form-control" maxlength="5" value="${teacher.tid }" readonly></input>
                            <span id="counttid" style="color: #ff0000;"></span>
                        </div>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" name="tname" class="form-control" value="${teacher.tname }"></input>
                        </div>
                        <div class="form-group clearfix">
                            <div class="row">
                                <div class="col-md-12" style="margin-bottom: 16px;">
                                    <strong>性别</strong>
                                </div>
                                <!-- radio -->
                                <div class="col-md-2">
                                    <div class="icheck-danger d-inline">
                                        <input type="radio" name="tsex" value="男" id="radio1" data-toggle="radio" class="custom-radio">
                                        <label for="radio1" >男</label>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="icheck-danger d-inline">
                                        <input type="radio" name="tsex" value="女" id="radio2" data-toggle="radio" class="custom-radio">
                                        <label for="radio2">女</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>职级</label>
                            <select class="form-control select select-danger select-block mbl" name="tlevel">
                                <option value="讲师">讲师</option>
                                <option value="副教授">副教授</option>
                                <option value="教授">教授</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" name="tpassword" class="form-control" value="${teacher.tpassword }" onkeyup="this.value=this.value.replace(/(^\s+)|(\s+$)/g,'');" maxlength="16"/>
                        </div>
                        <div class="form-group">
                            <label>联系方式 - 手机号</label>
                            <input type="number" name="tphone" class="form-control" maxlength="11" value="${teacher.tphone }"></input>
                        </div>
                        <div class="form-group">
                            <label>生日</label>
                            <input type="text" name="tbirthday" class="form-control" value="${teacher.tbirthday }"></input>
                        </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <input type="submit" class="btn btn-danger float-right" value="添加" />
                    </div>
                </form>
</c:forEach>
            </div>
        </section>
        <!-- /.content -->
        <script type="text/javascript">
            $(document).ready(
                function() {
                    $("#tid").change(
                        function() {
                            $.post("/StudentInfo/AjaxHandler/existTid?tid="
                                + $("#tid").val(), function(data, status) {
                                $("#counttid").html(data);
                            })

                        })

                })
        </script>
    </div>
</div>
</body>
<jsp:include page="../footer.jsp" />
