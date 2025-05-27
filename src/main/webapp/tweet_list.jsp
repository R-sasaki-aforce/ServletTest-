<%@page import="jp.co.aforce.beans.Tweet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ツイート一覧</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>



	<div class="container">
		<h1>ツイート一覧</h1>
		<%-- 新規投稿 --%>
		<p>
			<a href="new_tweet.jsp">新規投稿</a>
		</p>

		<%@page import="java.util.List"%>

		<%
		List<Tweet> list = (List<Tweet>) request.getAttribute("tweets");
		%>
		
		<%String message =(String)session.getAttribute("tweet");%>
		<script>
		<%if(message != null){%>
			alert('<%=message%>')
			<%}%>
		</script>
		<%
		if (list != null) {
		%>
		<%
		for (Tweet t : list) {
		%>
		<%-- ツイート一覧の表示 --%>
		<ul class="tweet-list">
			<li>
				<div class="tweet-content">
					<p><%=t.getContent()%></p>


					<p class="tweet-info">
						投稿者:
						<%=t.getAuthor()%>
						- 投稿日時:<%=t.getPostedAt()%>

						<%
						if (t.getAuthor().length() > 255) {
						%>
						<%="ツイートに失敗しました"%>

						<%
						request.removeAttribute("tweets");
						%>
						<%
						} else {
						%>
						<%="ツイートに成功しました"%>
						<%}%>

					</p>
				</div>
			</li>
		</ul>
		<%
		}
		%>
		<%
		}
		%>
	</div>
</body>
</html>
