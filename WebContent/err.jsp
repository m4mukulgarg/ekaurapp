<%@page import="ekapp.*"%>
<%
	session.setAttribute("referer", "err.jsp");
%>

<jsp:include page="header.jsp" />

<!DOCTYPE html>

<html lang="en" class="working-hover">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title itemprop="name">Error | Ekapp</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=yes, minimum-scale=1.0">


<link href="./err_files/css" rel="stylesheet">

<!-- favicon the rest-->
<link rel="icon" href="images/favicon_32px.png">

<link
	href="./err_files/styles.f70e6b4ccff6a9890a2dbf0ecbf001a4.css"
	rel="stylesheet">

<link rel="import"
	href="chrome-extension://melpgahbngpgnbhhccnopmlmpbmdaeoi/app/templates/feedback.html"
	id="udacity-test-widget">
</head>
<body class="">

	<div class="page-wrapper">
		<div class="page page_sidebar-animation-on">

			<div class="page__inner">
				<main class="main ">
				<div class="content">
					<div class="error">
						<h1 class="error__type">An error has occurred...</h1>
						<div class="error__code">ERR!!</div>
						<div class="error__text">
							<p>Probably that's because of a big site update, many
								materials were updated and reorganized.</p>
						</div>
						<p>Return to <a href="default.jsp">home</a> to find what you need.</p>
						<p>
							...or <a href="mailto:m4mukulgarg@live.com">contact the admin</a>
						</p>

					</div>
				</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>