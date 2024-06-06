package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modelo.PersonaDAO;


/**
 *
 * @author AsusVivoBook
 */
public class Controlador extends HttpServlet {

    PersonaDAO dao = new PersonaDAO();
    Persona p = new Persona();
    int r;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
        String accion=request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String usuario=request.getParameter("txtnom");
            String contraseña=request.getParameter("txtpassword");
            String rol=request.getParameter("txtrol");
            p.setUsuario(usuario);
            p.setContraseña(contraseña);
            p.setRol(rol);
            if (rol.equals("ADMINISTRADOR")) {
                r=dao.validar(p);
            
            if (r==1) {
               request.getRequestDispatcher("Principal.jsp").forward(request, response);
            }
            else{
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Para HTTP 1.1.
                response.setHeader("Pragma", "no-cache"); // Para HTTP 1.0.
                response.setHeader("Expires", "0"); // Para proxies.

               request.getRequestDispatcher("Contraseña_Incorrecta.jsp").forward(request, response);
            }      
            }
            
            else if (rol.equals("SECRETARIA")) {
                                r=dao.validar(p);
            
            if (r==1) {
               request.getRequestDispatcher("PrincipalSecretaria.jsp").forward(request, response);
            }
            else{
                                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Para HTTP 1.1.
                response.setHeader("Pragma", "no-cache"); // Para HTTP 1.0.
                response.setHeader("Expires", "0"); // Para proxies.
            request.getRequestDispatcher("Contraseña_Incorrecta.jsp").forward(request, response);
            } 
            }
            else if (rol.equals("PACIENTE")) {
                                r=dao.validar(p);
            
            if (r==1) {
               request.getRequestDispatcher("PrincipalPaciente.jsp").forward(request, response);
            }
            else{
                                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Para HTTP 1.1.
                response.setHeader("Pragma", "no-cache"); // Para HTTP 1.0.
                response.setHeader("Expires", "0"); // Para proxies.
            request.getRequestDispatcher("Contraseña_Incorrecta.jsp").forward(request, response);
            } 
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
