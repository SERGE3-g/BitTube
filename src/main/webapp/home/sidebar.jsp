<%@ page import = "java.sql.*" %>
<!-- Sidebar [init] -->
<div class="row">
	
	<!-- Playlist Button [init] -->
	<div class="col-12 mb-3">
		<button type="button" class="btn btn-light w-100" onclick="javascript:showAllVideos();"><i class="fa fa-home" aria-hidden="true"></i>
		 Home</button>
	</div>
	<!-- Playlist Button [end] -->
	<!--sto provando a modificare una riga-->
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/bittube1","root",""
			);
	String sql = "SELECT id, titolo, descrizione FROM yt_playlist WHERE visibilita = 1";
	PreparedStatement ps = con.prepareStatement(sql);	
	ResultSet rsPlaylist = ps.executeQuery();	
	
	int id = 0;
	String titolo = "";
	String descrizione = "";
	
	while(rsPlaylist.next()){
		id = rsPlaylist.getInt("id");
		titolo = rsPlaylist.getString("titolo");
		descrizione = rsPlaylist.getString("descrizione");
%>

	<!-- Playlist Button [init] -->
	<div class="col-12 mb-3">
		<button type="button" class="btn btn-light w-100" onClick="javascript:asyncRequestVideo('<%= id %>');" ><i class="fa fa-music" aria-hidden="true"></i>
		 <%= titolo %></button>
	</div>
	<!-- Playlist Button [end] -->
	
<% } %>	
	
</div>
<!-- Sidebar [end] -->

<script>
function asyncRequestVideo(idPlaylist){
	
	
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){	  
	   
	   var arrayContainerVideo = document.getElementsByClassName("classeContentitoreVideo"); // seleziono tutti i video sullo stage
	   var arrayCurrentVideos = this.responseText.split("|"); // seleziono gli ID della playlist	   
	   arrayCurrentVideos.pop(); //eliminiamo l'ultimo elemento dell'array	   
	   
	   for(var i=0; i<arrayContainerVideo.length; i++) // ciclo su tutti i video dello stage
	   {
		   var idVideo = arrayContainerVideo[i].id; // ID corrente del video sullo stage
		   
		   if(arrayCurrentVideos.includes(idVideo)){
			   arrayContainerVideo[i].style.display = "block";
		   }else{				
				arrayContainerVideo[i].style.display = "none";
		   }		  
	   }	   
	}
	
	xhttp.open("GET", "VideoServlet?id=" + idPlaylist);
	
	xhttp.send();
	
}
function showAllVideos(){
   var arrayContainerVideo = document.getElementsByClassName("classeContentitoreVideo");
	   
   for(var i=0; i<arrayContainerVideo.length; i++)
   {
	   arrayContainerVideo[i].style.display = "block";
   }
   
   //window.location.reload(); metodo alternativo
}
</script>




