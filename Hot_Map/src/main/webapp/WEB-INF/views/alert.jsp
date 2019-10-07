<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<body>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/sweetalert2.js"></script>
	<script>
	$(function(){
		swal({
			type: '${type}',
  			title: '${msg}'
		}).then((result) =>  {
				window.location.href='${url}';
		});
	});
	</script>
</body>
</html>