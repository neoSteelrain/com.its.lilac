<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../../resources/js/jQuery-3-6-1.js"></script>
    <title>Title</title>
</head>
<body>
    <input type="button" onclick="gerYoutubeList()" value="가랏 유튜브">
    <div id="resultDiv"></div>
</body>
<script>
    const gerYoutubeList = () => {
        $.ajax({
            type:"get",
            url:"/search/youtube/keyword-search",
            //dataType:"json",
            data:{
                keyword:"정보처리기사",
                offset:"0",
                videoCount:"10"
            }
            ,success:(result)=>{
                console.log(result);
                $('#resultDiv').text(result);
            },
            error:()=>{
                alert("에러당");
            }
        });
    }
</script>
</html>
