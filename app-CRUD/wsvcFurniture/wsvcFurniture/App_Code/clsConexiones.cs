using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;// Librería para conexión manejo de datos (.Net)
using System.Data;using System.Configuration;



/// <summary>
/// Descripción breve de clsConexiones
/// </summary>
public class clsConexiones
{
    private string cadConexion = ConfigurationManager.ConnectionStrings["mySqlCadConn"].ConnectionString;
    //private string cadConexion = "Server=localhost;database=fornitureweb;Uid=root;Pwd=TheXFactor_23;";

    public DataSet qryAcceso(string usuario, string password)
        {
            // Definición de variables y objetos
            string cadSql = "call sp_Acceso('" + usuario + "', '" + password + "')";

            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            // Objeto contenedor de datos recibidos
            DataSet ds = new DataSet();
            // Ejecución del da para recibir los datos de la BD
            da.Fill(ds, "acceso");
            // Retornar el dataset recibido
            return ds;
        }

        public DataSet insProducto(string nombre,
                                   string descripcion,
                                   string inventario,
                                   string precio)
        {
            string cadSql = "call sp_InsProducto('" + nombre + "', '" + descripcion + "', " + inventario + ", " + precio + ")";

            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "insProducto");
            return ds;
        }


        public DataSet insUsuario( string pasword,
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
        String cadSql = "call sp_InsUsuario('"+pasword+"', '"+nombre+"', '"+paterno+"','"+materno+"', '"+correo+"', '"+telefono+"', '"+pais+"', '"+estado+"','"+colonia+"', '"+calle+"',  '"+exterior+"','"+interior+"',"+rol+");";


        MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "insUsuario");
            return ds;
        }


        public DataSet updProducto(string id,                                   string nombre,                                   string descripcion,                                   string inventario,                                   string precio)
        {
            string cadSql = "call sp_UpdProducto ('" + id + "', '" + nombre + "', '" + descripcion + "', '" + inventario + "', " + precio + ");";

            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "updProducto");
            return ds;
        }


        public DataSet updUsuario( string id,
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
            string cadSql = "call sp_UpdUsuario ("+id+",'"+pasword+"','"+nombre+"', '"+paterno+"', '"+materno+"','"+correo+"', '"+telefono+"', '"+pais+"', '"+estado+"', '"+colonia+"', '"+calle+"', '"+interior+"', '"+exterior+"', "+rol+");";

            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "updUsuario");
            return ds;
        }


        public DataSet delProducto(string id)
        {
            string cadSql = "call sp_DelProducto('" + id + "');";
            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "delProducto");
            return ds;
        }


        public DataSet delUsuario(string id)
        {
            string cadSql = "call sp_DelUsuario('" + id + "');";
            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "delUsuario");
            return ds;
        }


        public DataSet vw_usuario(String filtro)
        {
           
            string cadSql = "select *from vw_usuario";
            cadSql += " where correo like '%" + filtro + "%' ";
            cadSql += " or telefono like '%" + filtro + "%' ";

            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "usuario");
            return ds;
  
        }

        public DataSet vw_Producto(String Filtro)        {            string cadSql = " select * from vw_Producto where Nombre like '%" + Filtro + "%' or Detalle like '%" + Filtro + "%';";            MySqlConnection cnn = new MySqlConnection(cadConexion);            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);            DataSet ds = new DataSet();            da.Fill(ds, "vwProducto");            return ds;        }
    

        public DataSet qryListaRol()
        {
            string cadSql = "select rol_cve_rol as Rol from rol;";
    

            // Definición de variables y objetos 
            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "listaRol");
            return ds;
        }

        public DataSet qryUsuarioABC(string clave)
        {
            string cadSql = "select * from usuario ";
            cadSql += "where usu_cve_usuario=" + clave + ";";

            // Definición de variables y objetos 
            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "usuarioABC");
            return ds;
        }

        public DataSet qryProductoABC(string clave)
        {
            string cadSql = "select * from producto ";
            cadSql += "where pro_cve_producto=" + clave + ";";

            // Definición de variables y objetos 
            MySqlConnection cnn = new MySqlConnection(cadConexion);
            MySqlDataAdapter da = new MySqlDataAdapter(cadSql, cnn);
            DataSet ds = new DataSet();
            da.Fill(ds, "productoABC");
            return ds;
        }



    public clsConexiones()
        {
        }

}

