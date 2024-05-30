package com.green.negocio;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.green.datos.conexion;

public class articulo {
	private int id_art;
	private int id_cat;
	private String descripcion_art;

	public articulo (int  id_art, int id_cat, String descripcion_art) {
		super();
		this.id_art =  id_art;
		this.id_cat = id_cat;
		this.descripcion_art = descripcion_art;
	}

	public articulo (int id_cat, String descripcion_art) {
		this.id_cat = id_cat;
		this.descripcion_art = descripcion_art;
	}

	public articulo () {

	}

	public String publicarArticulo() {
		String sentencia = "SELECT descripcion_art, id_art, id_cat FROM tb_articulo WHERE estado=0";
		conexion con = new conexion();
		ResultSet rs = null;
		String categoria = "";
		String resultado = "<table><th>ID</th><th>Articulos</th>";
		try {
			rs = con.Consulta(sentencia);

			while (rs.next()) {
				if(rs.getInt(3)==1){
					categoria = "Exito";
				} else if (rs.getInt(3)==2){
					categoria = "Inversion";
				}
				resultado += "<tr><td>" + categoria + "</td>"
						+ "<td>" + rs.getString(1) + "</td>"
						+ "<td> <a href= publicar.jsp?cod=" + rs.getInt(2)
						+ "><pre style=\"text-align: center\">publicar</pre></a></td>"
						+ "<td> <a href= eliminar.jsp?cod=" + rs.getInt(2)
						+ " \"><pre style=\"textalign: center\">Eliminar</pre></a></td></tr>"
						;
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	public String ingresarArticulo(int cat,String desc)
	{
		String result="";
		conexion con=new conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_articulo (id_cat,"
				+ "descripcion_art, estado)"
				+ "VALUES(?,?,?)";
		try{
			pr=con.getCon().prepareStatement(sql);
			pr.setInt(1,cat);
			pr.setString(2,desc);
			pr.setInt(3,0);
			if(pr.executeUpdate()==1)
			{
				result="Se ingreso correctamente.";
			}
			else
			{
				result="No se ingreso a la base de datos.";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
		}
		finally
		{
			try
			{
				pr.close();
				con.getCon().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}
	public String mostrarExito() {
		String sentencia = "SELECT descripcion_art FROM tb_articulo WHERE id_cat=1";
		conexion con = new conexion();
		ResultSet rs = null;
		int cont=0;
		String resultado = "<table><th>Nº</th><th>Casos de exito</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				cont++;
				resultado += "<tr><td>" + cont+ "</td>"
						+ "<td>" + rs.getString(1) + "</td>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}

	public String mostrarInversion() {
		String sentencia = "SELECT descripcion_art FROM tb_articulo WHERE id_cat=2";
		conexion con = new conexion();
		ResultSet rs = null;
		int cont=0;
		String resultado = "<table><th>Nº</th><th>Informacion de inversiones</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				cont++;
				resultado += "<tr><td>" + cont+ "</td>"
						+ "<td>" + rs.getString(1) + "</td>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	public boolean aprobarArticulo (int id_art) {
		boolean agregado = false;
		conexion obj = new conexion();
		String sql = "UPDATE tb_articulo SET estado=1"
				+ " WHERE id_art = "+id_art ;
		try {
			obj.Ejecutar (sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	public boolean eliminarArticulo(int cod) {
		boolean f=false;
		conexion con = new conexion();
		String sql = "delete from tb_articulo where id_art = '"+cod+"'";
		try {
			con.Ejecutar(sql);
			f = true;
		} catch(Exception e) {
			f = false;
		}
		return f;
	}
	public String buscarArticuloCat(int cat) {
		String sentencia = "SELECT descripcion_art FROM tb_articulo WHERE id_cat=" + cat;
		conexion con = new conexion();
		int c=0;
		ResultSet rs = null;
		String resultado = "<table><th>Nº</th><th>Articulo</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				c++;
				resultado += "<tr><td>" + c + "</td>"
						+ "<td>" + rs.getString(1) + "</td>"
						+ "</tr>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	public int getId_art() {
		return  id_art;
	}
	public void setId_art(int id_art) {
		this. id_art =  id_art;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getDescripcion_art() {
		return descripcion_art;
	}
	public void setDescripcion_art(String descripcion_art) {
		this.descripcion_art = descripcion_art;
	}


}