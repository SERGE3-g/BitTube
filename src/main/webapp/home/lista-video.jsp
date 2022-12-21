<%@ page import="java.sql.*"%>
<div class="container-fluid">
	<div class="row">

		<%
	 Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/BitTube","root","" 
		);
	String Sql = "SELECT titolo, codice, durata, genere, descrizione, autore FROM yt_video";
    PreparedStatement ps = con.prepareStatement(Sql);
    ResultSet rs = ps.executeQuery();
    
    String titolo = "";
    String codice = "";
    String durata = "";
    String genere = "";
    String descrizione = "";
    String autore = "";
    
    while(rs.next()){
    	 titolo = rs.getString("titolo");
    	 codice = rs.getString("codice");
    	 durata = rs.getString("durata");
    	 genere = rs.getString(" genere");
    	 descrizione = rs.getString("descrizione");
    	  if( descrizione.length() > 55){
    		  descrizione = descrizione.substring(0,55);
    	  }
    	 autore = rs.getString("autore");
    	
%>
		<!-- singolo video [init] -->
		<div class="col-3">
			<jsp:include page="single-video.jsp">
				<jsp:param value="<%= titolo %>" name="titolo" />
				<jsp:param value="<%= codice %>" name="codice" />
				<jsp:param value="<%= durata %>" name="durata" />
				<jsp:param value="<%= genere %>" name="genere" />
				<jsp:param value="<%= descrizione %>" name="descrizione" />
				<jsp:param value="<%= autore %>" name="autore" />

			</jsp:include>
		</div>
		<!-- sigolo video [end] -->
		<% } %>

	</div>

</div>
