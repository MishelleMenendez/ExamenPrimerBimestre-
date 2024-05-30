package com.green.seguridad;

import java.sql.*;
import com.green.datos.conexion;
public class usuario {
	private int id_us;
	private int id_per;
    private String nombre;
    private String correo;
    private String clave;

    public usuario() {
        // Constructor vacío
    }

    public usuario(int id_per, String nombre, String correo, String clave) {
        this.id_per = id_per;
        this.nombre = nombre;
        this.correo = correo;
        this.clave = clave;
    }
    public usuario(int id_us, String clave) {
    	this.id_us = id_us;
    	this.clave = clave;
    }

	public String ingresarCliente() {
		String result = "";
		conexion con = new conexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO tb_usuario (id_per, nombre_us," 
		+ "correo_us,clave_us) "
				+ "VALUES(?,?,?,?)";
		
		try {
			pr = con.crearConexion().prepareStatement(sql);
			pr.setInt(1, 3);
			pr.setString(2, this.getNombre());
			pr.setString(3, this.getCorreo());
			pr.setString(4, this.getClave());

			if (pr.executeUpdate() == 1) {
				result = "Insercion correcta";
			} else {
				result = "Error en insercion";
			}
		} catch (Exception ex) {
			result = ex.getMessage();
			System.out.print(result);
		} finally {
			try {
				pr.close();
				con.crearConexion().close();
			} catch (Exception ex) {
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}
	public String ingresarEmpresa() {
		String result = "";
		conexion con = new conexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO tb_usuario (id_per, nombre_us," 
		+ "correo_us,clave_us) "
				+ "VALUES(?,?,?,?)";
		
		try {
			pr = con.crearConexion().prepareStatement(sql);
			pr.setInt(1, 2);
			pr.setString(2, this.getNombre());
			pr.setString(3, this.getCorreo());
			pr.setString(4, this.getClave());

			if (pr.executeUpdate() == 1) {
				result = "Insercion correcta";
			} else {
				result = "Error en insercion";
			}
		} catch (Exception ex) {
			result = ex.getMessage();
			System.out.print(result);
		} finally {
			try {
				pr.close();
				con.crearConexion().close();
			} catch (Exception ex) {
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}

	// En la clase Usuario.java
	
	public boolean verificarInicioSesion(String correo, String clave) {
	    conexion con = new conexion();
	    PreparedStatement pr = null;
	    ResultSet rs = null;
	    boolean resultado = false;

	    try {
	        String sql = "SELECT nombre_us, id_per FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
	        pr = con.crearConexion().prepareStatement(sql);
	        pr.setString(1, correo);
	        pr.setString(2, clave);
	        rs = pr.executeQuery();

	        if (rs.next()) {
	            // Si hay resultados, el inicio de sesión es exitoso
	            this.setNombre(rs.getString("nombre_us"));
	            this.setId_per(rs.getInt("id_per"));
	            resultado = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pr != null) {
	                pr.close();
	            }
	            con.crearConexion().close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return resultado;
	}

	//MODIFICAR
	public boolean ModificarClave (usuario us) {
		boolean agregado = false;
		conexion obj = new conexion();
		String sql = "UPDATE tb_usuario SET clave='" + us.getClave() + " WHERE id_us = "+us.getId_us() ;
		try {
			obj.Ejecutar (sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}

    // Getters y setters...
	public int getId_us() {
		return id_us;
	}
	public void setId_us(int id_us) {
		this.id_us=id_us;
	}

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getId_per() {
        return id_per;
    }

    public void setId_per(int id_per) {
        this.id_per = id_per;
    }
}