<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A</title>
</head>
<body>
<form action="boardw" method = "post">
	Q&A 
	<hr />
	제목 : <input type="text" name="title" />
	<br />
	내용 : <textarea rows="6" name="content"></textarea>
	<br /> 
	작성자 :<input type="text" name="writer" />
	<br />
	<input type="submit" value="글쓰기" />
	</form>

</body>
</html>