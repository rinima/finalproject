<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	SRS学生选课系统
</title><link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="Style/ks.css" rel="stylesheet" type="text/css" />
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                });
            }
        }
        //更改
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>
    
    <script src="Script/changeOption.js" type="text/javascript"></script>
    <script src="Script/rl.js" type="text/javascript"></script>
</head>
<body>



    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.aspx.html">
                        
                    </a>
                </div>
                <div class="topxx">
					<br/><center><h1>欢迎使用学生选课系统  请登录！</h1></center>
                </div>

            </div>
        </div>
    </div>
    <div class="page">
<div class="box mtop">

                   
                    
                   
                            
<div class="rightbox1">
                




<div class="cztable">


        <div class="tis red">
            注：如果忘记密码请联系管理员！
        </div>

	<form method="post" action="user.do?action=login">
    <table width="50%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="center">用户名 </div></td>
            <td><input  size="40" name="ID" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="center">密码 </div></td>
            <td><input  type="password" size="40" name="PASSWORD" class="input_2"/></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                    <input type="submit" value="登录"  class="input2" />
                    
                </div>
            </td>
        </tr>
    </table>
    </form>
</div>

            </div>
        </div>

 
        <div class="footer">
            <p>
                &copy;copyright 2015 THE ONE TEAM 版权所有 </p>
        </div>
    </div>
	<div style="text-align:center;">
</div>
</body>
</html>
