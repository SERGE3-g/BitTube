package it.BitTube;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/VideoServlet")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idPlaylist = request.getParameter("id");
		
		//Recupero i video della playlist corrente idPlaylist
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bittube1", "root","");
			
			String sql = "SELECT id_video FROM yt_playlist_manager WHERE id_playlist = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);						
			ps.setInt(1, Integer.parseInt(idPlaylist));								
			ResultSet rs = ps.executeQuery();
			
			int idVideo = 0;
			String risposta = "";
			while(rs.next()) {
				idVideo = rs.getInt("id_video");
				risposta = risposta + "container_video_" + idVideo + "|";
			}
								
			response.setContentType("text/plain");
			
			response.getWriter().write(risposta);
			
			
			
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}