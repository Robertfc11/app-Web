using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

/// <summary>
/// Descripción breve de conexiones
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class conexiones : System.Web.Services.WebService
{

    public conexiones()
    {
        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hola a todos";
    }

    [WebMethod]
    public DataSet qryAcceso(string usuario, string password)
    {
        // Instanciar el objeto de la clase de encapsulamiento clsConexiones
        clsConexiones obj = new clsConexiones();
        return obj.qryAcceso(usuario, password);

    }

    [WebMethod]
    public DataSet insProducto(string nombre,
                               string descripcion,
                               string inventario,
                               string precio)
    {
        clsConexiones obj = new clsConexiones();
        return obj.insProducto(nombre, descripcion, inventario, precio);
    }

    [WebMethod]
    public DataSet updProducto(string id,                               string nombre,                               string descripcion,                               string inventario,                               string precio)
    {
        clsConexiones obj = new clsConexiones();
        return obj.updProducto(id, nombre, descripcion, inventario, precio);
    }

    [WebMethod]
    public DataSet delProducto(string id)
    {
        clsConexiones obj = new clsConexiones();
        return obj.delProducto(id);
    }

    [WebMethod]
    public DataSet insUsuario(string pasword,
                              string nombre,
                              string paterno,
                              string materno,
                              string correo,
                              string telefono,
                              string pais,
                              string estado,
                              string colonia,
                              string calle,
                              string exterior,
                              string interior,
                              string rol)
    {
        clsConexiones obj = new clsConexiones();
        return obj.insUsuario(pasword, nombre, paterno, materno, correo, telefono, pais, estado, colonia, calle, exterior, interior, rol);
    }

    [WebMethod]
    public DataSet updUsuario(string id,
                              string pasword,
                              string nombre,
                              string paterno,
                              string materno,
                              string correo,
                              string telefono,
                              string pais,
                              string estado,
                              string colonia,
                              string calle,
                              string exterior,
                              string interior,
                              string rol)
    {
        clsConexiones obj = new clsConexiones();
        return obj.updUsuario(id, pasword, nombre, paterno, materno, correo, telefono, pais, estado, colonia, calle, exterior, interior, rol);
    }

    [WebMethod]
    public DataSet delUsuario(string id)
    {
        clsConexiones obj = new clsConexiones();
        return obj.delUsuario(id);
    }

    [WebMethod]
    public DataSet vw_usuario(string filtro)
    {
        clsConexiones obj = new clsConexiones();
        return obj.vw_usuario(filtro);
    }

    [WebMethod]
    public DataSet qryListaRol()
    {
        clsConexiones obj = new clsConexiones();
        return obj.qryListaRol();
    }

    [WebMethod]    public DataSet vw_Producto(string filtro)    {        clsConexiones obj = new clsConexiones();        return obj.vw_Producto(filtro);    }

    [WebMethod]
    public DataSet qryUsuarioABC(string clave)
    {
        clsConexiones obj = new clsConexiones();
        return obj.qryUsuarioABC(clave);
    }

    [WebMethod]
    public DataSet qryProductoABC(string clave)
    {
        clsConexiones obj = new clsConexiones();
        return obj.qryProductoABC(clave);
    }



}
