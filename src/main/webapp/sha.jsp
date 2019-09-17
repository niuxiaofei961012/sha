<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title></title>
<link rel="stylesheet" href="/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resource/css/cms.css?v=1.1" />
<style type="text/css">
</style>
</head>
<body>
	手机号<input type="text" id="text1"/><br>
	卡号<input type="text" id="codeNo"/><br>
	<input type="button" onclick="sha1()" value="摘要">
</body>
<script type="text/javascript" src="https://cdn.bootcss.com/jsSHA/2.3.1/sha_dev.js"></script>
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function sha1(){
		var v = $("#text1").val()+$("#codeNo").val();
		sha = new jsSHA(
			"SHA-1",
			"TEXT",
			{numRounds:1}
		);
		sha.update(v);
		v = sha.getHash("HEX");
		$.post(
				"checkSha",
				{phone:phone,codeNo:codeNo,sha1:v},
				function(obj){
					alert(obj)
				}
			)
	}
</script>
</html>