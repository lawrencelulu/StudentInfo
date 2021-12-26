<%--
  Created by IntelliJ IDEA.
  User: lhj
  Date: 2021/4/6
  Time: 10:49 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp" />
<body class="hold-transition login-page">
<div class="login-box">
    <div class="card card-outline card-danger">
        <div class="card-header text-center">
            <h1 class="h3">学生信息管理系统</h1>
        </div>
        <div class="card-body">
            <p class="login-box-msg">输入角色账号密码登录</p>

            <form method="post" name="login" id="login" action=""
                  onsubmit="return submitHandler()">
                <div class="input-group mb-3">
                    <input type="text" id="userid" value=""
                           placeholder="用户名" class="form-control"
                           m="userid"
                           onkeyup="value=value.replace(/[\u4e00-\u9fa5]|(^\s+)|(\s+$)/ig,'')"
                           maxlength="12" >
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" id="password" class="form-control"
                           onkeyup="this.value=this.value.replace(/(^\s+)|(\s+$)/g,'');"
                           m="password"
                           maxlength="16"
                           placeholder="用户密码">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="margin-bottom: 16px;">
                        <strong>登录角色</strong>
                    </div>
                    <!-- radio -->
                    <div class="col-md-4">
                        <div class="icheck-danger d-inline">
                            <input type="radio"
                            name="optionsRadios1" value="student" checked="checked"
                            id="radio1">
                            <label for="radio1">学生</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="icheck-danger d-inline">
                            <input type="radio"
                                   name="optionsRadios1" value="teacher" checked="checked"
                                   id="radio2">
                            <label for="radio2">老师</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="icheck-danger d-inline">
                            <input type="radio"
                                   name="optionsRadios1" value="admin" checked="checked"
                                   id="radio3">
                            <label for="radio3">管理员</label>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 16px;">
                    <!-- /.col -->
                    <div class="col-md-12">
                        <input class="btn btn-danger btn-block" value="登录"
                               type="submit" />
                    </div>
                    <!-- /.col -->
                </div>
            </form>

        </div>
        <!-- /.card-body -->
    </div>
</div>
<script>
    var useridEle = document.getElementById("userid");
    var passwordEle = document.getElementById("password");
    var roleRadio = document.getElementsByName("optionsRadios1");

    /*
     * 点击登录执行的逻辑
     */
    function submitHandler() {

        if (!vali()) {
            return false;
        }

        var role = 'student';

        for (var i = 0; i < roleRadio.length; i++) {
            if (roleRadio[i].checked) {
                role = roleRadio[i].value;
            }
        }

        var action = null;
        if (role == 'student') {
            action = "/StudentInfo/LoginHandler/studentlogin";
            useridEle.name = "sid";
            passwordEle.name = "spassword";
        } else if (role == 'teacher') {
            action = "/StudentInfo/LoginHandler/teacherlogin";
            useridEle.name = "tid";
            passwordEle.name = "tpassword";
        } else {
            action = "/StudentInfo/LoginHandler/adminlogin";
            useridEle.name = "aname";
            passwordEle.name = "apassword";
        }
        document.getElementById("login").action = action;

        return true;
    }

    function vali() {
        var valiObjs = createInputMsgObj([ 'userid', 'password' ])

        for (var i = 0; i < valiObjs.length; i++) {
            console.log(valiObjs[i].el.val())
            if (valiObjs[i].el.val() == null || valiObjs[i].el.val() == '') {
                valiObjs[i].el.css({
                    "border-color" : "red"
                })
                console.log(valiObjs[i].el)
                var alertEl = $("<div style=\"position:fixed;top:1rem;right:1rem;\" class=\"alert alert-warning\">"
                    + valiObjs[i].msg + "没有填写！" + "</h5></div>")
                $("body").append(alertEl);
                setTimeout(function() {
                    alertEl.remove();
                }, 1000)
                return false;
            }
        }
        return true;
    }

    function createInputMsgObj(ids) {
        var objs = [];

        for (var i = 0; i < ids.length; i++) {

            var obj = {
                el : $("#" + ids[i]),
                msg : $("#" + ids[i]).attr('m')
            }
            objs.push(obj);
        }

        return objs;
    }
</script>
<jsp:include page="footer.jsp" />