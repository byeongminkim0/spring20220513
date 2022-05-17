<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<title>Insert title here</title>
</head>
<body>
	<h1>${board.id }. BOARD</h1>
	
	
	<form action="${appRoot }/project/board/modify" method="post">
		<input type="hidden" name="id" value="${board.id }" />
		
		<div>
			<label class="form-label" for="input1">TITLE</label>
			<input class="form-control" type="text" name="title" value="${board.title }"/>
		</div>
		
		<div>
			<label class="form-label" for="textarea1">MAIN TEXT</label>
			<textarea class="form-control" name="body" id="textarea1"
					cols="30" rows="10" >${board.body }</textarea>
		</div>
		
		<div>
			<label for="input2" class="form-label">INSERTED</label>
			<input class="form-control" type="datetime-local" value="${board.inserted }" readonly/>
		</div> 
		
		<button class="btn btn-primary">MODIFY</button>
	</form>
	
	<c:url value="/project/board/remove" var="removeLink" />
	<form action="${removeLink }" method="post">
		<input type="hidden" name="id" value="${board.id }"/>
		<button class="btn btn-danger">REMOVE</button>
	</form>
	
	<hr />
	<hr />
	
	<h2>COMMENT</h2>
	
	<c:url value="/project2/reply/add" var="replyAddLink"></c:url>
	<form action="${replyAddLink }" method="post">
		<input type="hidden" name="boardId" value="${board.id }" />
		COMMENT : <input class="form-control" type="text" name="content" size="50" />
		
		<button class="btn btn-outline-primary">WRITE</button>
	</form>
	
	<hr />
	
	<div>
		<c:forEach items="${replyList }" var="reply">
		
			<div style="border: 1px solid black; margin-bottom: 3px;">
				${reply.inserted } : 
				
				<c:url value="/project2/reply/modify" var="replyModifyLink"></c:url>
				<form action="${replyModifyLink }" method="post">
					<input type="hidden" value="${reply.id }" name="id" />
					<input type="hidden" name="boardId" value="${board.id }" />
					<input class="form-control" type="text" value="${reply.content }" name="content" />
					<button class="btn btn-primary btn-sm">MODIFY</button>
				</form>
				
				<c:url value="/project2/reply/remove" var="replyRemoveLink"></c:url>
				<form action="${replyRemoveLink }" method="post">
					<input type="hidden" name="id" value="${reply.id }" />
					<input type="hidden" name="boardId" value="${board.id }" />
					<button class="btn btn-danger btn-sm">REMOVE</button>
				</form>
			</div>
			
		</c:forEach>
	</div>
</body>
</html>













