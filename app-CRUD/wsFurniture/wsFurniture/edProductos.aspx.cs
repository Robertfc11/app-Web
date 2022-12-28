using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 

        // Validación y llenado de datos del Complejo (Modificar/Eliminar)
        int r;
        if (TextBox1.Text != "" && int.TryParse(TextBox1.Text, out r) == true)
        {
            wsrvFurniture.conexionesSoapClient objProductoABC = new wsrvFurniture.conexionesSoapClient();
            DataSet dsProductoABC = new DataSet();
            dsProductoABC = objProductoABC.qryProductoABC(TextBox1.Text);
            // Validación de los datos recibidos
            DataTable dtProductoABC = dsProductoABC.Tables["productoABC"];
            if (dtProductoABC.Rows.Count != 0)
            {
                foreach (DataRow dr in dtProductoABC.Rows)
                {
                    // Obtención de los datos (solo si el producto EXISTE)
                   
                    TextBox6.Text = dr[1].ToString();
                    TextBox7.Text = dr[2].ToString();
                    TextBox8.Text = dr[3].ToString();
                    TextBox9.Text = dr[4].ToString();
                    
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('La clave de producto no existe, verificar ...');</script>");
                
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('Error de formato: La clave no puede estar vacía y debe ser número entero.');</script>");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Ejecución del método de inserción de Complejo
            wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
            DataSet ds = new DataSet();
            ds = obj.insProducto(TextBox6.Text, TextBox7.Text, TextBox8.Text,
                                TextBox9.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["insProducto"];
            // Validación del dato recibido
            String bandera = "";
            foreach (DataRow dr in dt.Rows)
            {
                bandera = dr[0].ToString();
            }
            // Enviar mensaje al usuario del proceso resultante
            if (bandera == "1")
                Response.Write("<script language='javascript'>alert('Registro exitoso!!');</script>");
            if (bandera == "-1")
                Response.Write("<script language='javascript'>alert('Error, ya existe el nombre...');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('[Error de formato], verifica tus datos e intenta de nuevo');</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            // Ejecución del método de modificación de Usuario
            wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
            DataSet ds = new DataSet();
            ds = obj.updProducto(TextBox1.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text,
                                TextBox9.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["updProducto"];
            // Validación del dato recibido
            String bandera = "";
            foreach (DataRow dr in dt.Rows)
            {
                bandera = dr[0].ToString();
            }
            // Enviar mensaje al usuario del proceso resultante
            if (bandera == "1")
                Response.Write("<script language='javascript'>alert('Modificación exitosa!!');</script>");
            if (bandera == "-1")
                Response.Write("<script language='javascript'>alert('No se pudo actualizar, no existe la clave del Producto');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('[Error de formato], verifica tus datos e intenta de nuevo');</script>");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            // Ejecución del método de eliminación de Producto
            wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
            DataSet ds = new DataSet();
            ds = obj.delProducto(TextBox1.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["delProducto"];
            // Validación del dato recibido
            String bandera = "";
            foreach (DataRow dr in dt.Rows)
            {
                bandera = dr[0].ToString();
            }
            // Enviar mensaje al usuario del proceso resultante
            if (bandera == "1")
                Response.Write("<script language='javascript'>alert('Se eliminó el producto de manera exitosa!!');</script>");
            if (bandera == "-1")
                Response.Write("<script language='javascript'>alert('No se pudo eliminar, no existe la clave del producto');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('[Error de formato], verifica tus datos e intenta de nuevo');</script>");
        }
    }
}