<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shortcut icon" href="/StudentInfo/utils/image/favicon.ico"
          type="image/x-icon" />
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>

    <script type="text/javascript" src="/StudentInfo/utils/js/jquery-3.3.1.min.js"></script>
    <!-- Loading Bootstrap -->
    <link href="/StudentInfo/utils/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!-- Loading Flat UI Pro -->
    <link href="/StudentInfo/utils/css/flat-ui.css" rel="stylesheet">
    <!-- Loading Flat UI JS -->
    <script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.min.js"></script>

    <script type="text/javascript">
        // $(document).ready(
        //     function() {
        //         $("#classroom").change(
        //             function() {
        //                 $.post("/StudentInfo/AjaxHandler/existTime?coursetime="
        //                     + $("#coursetime").val() + "&courseweek="
        //                     + $("#courseweek").val() + "&classroom="
        //                     + $("#classroom").val(), function(data,
        //                                                       status) {
        //                     $("#couplan").html(data);
        //                 })
        //
        //             })
        //
        //     })
    </script>

    <script type='text/javascript' src='/StudentInfo/utils/scripts/particles.js'></script><link href="/StudentInfo/utils/css/animate.css" rel="stylesheet"></head>




<body><div id="particles-js"><canvas class="particles-js-canvas-el" width="1322" height="774" style="width: 100%; height: 100%;"></canvas></div>
<jsp:include page="adminLeft.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5>新建教学班</h5>
            <form action="/StudentInfo/CoursePlanHandler/doaddcouplan"
                  method="get">
                <div class="row">
                    <div class="col-md-6">
                        <h6>课程编号</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" name="cid" value="${cid}"
                                       class="form-control" readonly />
                            </div>
                        </div>
                        <h6>任课老师</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <select name="tid" multiple="multiple" class="form-control multiselect multiselect-info">
                                    <c:forEach var="teacher" items="${requestScope.teacherList}">
                                        <option value="${teacher.tid}">${teacher.tname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <br />
                        <h6>新建班级名称</h6>

                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" name="courseclass" value="${cid}-" class="form-control"/>
                            </div>
                        </div>

                        <h6>上课学期</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" name="semester" id="classroom"
                                       class="form-control" maxlength="8" />
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <span id="couplan" style="color: #ff0000;"></span>
                    </div>

                    <div class="col-md-12" style="margin-top: 1rem;">
                        <input type="submit" value="添加"
                               class="btn btn-primary btn-wide login-btn" />
                    </div>

                </div>
            </form>
        </div>


    </div>

</div>
<script type="text/javascript" src="/StudentInfo/utils/scripts/flat-ui.js"></script>
<script src="/StudentInfo/utils/scripts/bganimation.js"></script></body>
<script>
    $("select").select2({dropdownCssClass: 'dropdown-inverse'});
</script>
</html>