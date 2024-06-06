
package modelo;

import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PersonaDAO implements Validar {
    Connection con;
    Conexion  cn= new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    @Override
    public int validar(Persona per) {
        String sql="Select * from usuarios where usuario=? and contraseña=? and rol=?";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1,per.usuario);
            ps.setString(2, per.contraseña);
            ps.setString(3, per.rol);
            rs=ps.executeQuery();
            
            while (rs.next()){
                r=r+1;
                per.setUsuario(rs.getString("usuario"));
                per.setContraseña(rs.getString("contraseña"));
                per.setRol(rs.getString("rol"));
            }
            if (r==1) {
                return 1;
            }
            else{
            return 0;
            }
            
        } catch (Exception e) {
            return 0;
        }
    }
    
}
