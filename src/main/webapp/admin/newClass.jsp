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
                <h3 class="card-title">新建教学班</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form action="/StudentInfo/CoursePlanHandler/doaddcouplan" method="get" name="form1">
                    <div class="card-body">
                        <div class="form-group">
                            <label>课程编号</label>
                            <input type="text" name="cid" id="cid" class="form-control" value="${cid}" maxlength="10" readonly></input>
                        </div>
                        <div class="form-group">
                            <label>新建班级名称</label>
                            <input type="text" name="courseclass" value="${cid}-" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>任课老师</label>
                            <div class="select2-danger">
                                <select name="tid" multiple="multiple" class="select2" style="width: 100%;">
                                    <c:forEach var="teacher" items="${requestScope.teacherList}">
                                        <option value="${teacher.tid}">${teacher.tname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>上课学期</label>
                            <input type="text" name="semester" id="classroom" class="form-control" maxlength="8" />
                        </div>
                    </div>
                    <!-- /.card-body -->

                    <div class="card-footer">
                        <input type="submit" class="btn btn-danger float-right" value="添加" />
                    </div>
                </form>
        </div>
    </section>
</div>
<script>
    $(function () {
        $('.select2').select2()
    })
</script>
</div>
</body>
<jsp:include page="../footer.jsp" />
