<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header [init] -->
	<header class="px-3">
		<nav class="navbar bg-white">
			<div class="container-fluid d-block">
				<div class="row align-items-center">

					<!-- Logo [init] -->
					<div class="col">
						<a class="navbar-brand" href="#"> <img
							src="resources/img/bitTube-black.png" alt="Logo bitTube"
							height="28" />
						</a>
					</div>
					<!-- Logo [end] -->


					<!-- Searchbar [init] -->
					<div class="col">
						<div class="input-group">
							<input type="text" id="txtSearch" class="form-control"
								placeholder="Cerca" aria-label="Cerca"
								aria-describedby="btnSearch">
							<button id="btnSearch" class="btn btn-outline-secondary"
								type="button">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</div>
					<!-- Searchbar [end] -->


					<!-- Sezione Login [init] -->
					<div class="col text-end">
						<button type="button" class="btn btn-light">
							<i class="fa fa-user" aria-hidden="true"></i> Accedi
						</button>
					</div>
					<!-- Sezione Login [end] -->

				</div>
			</div>
		</nav>
	</header>
	<!-- Header [end] -->

</body>
</html>



