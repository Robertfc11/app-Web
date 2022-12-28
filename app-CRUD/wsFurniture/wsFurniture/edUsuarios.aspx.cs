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
        if(DropDownList1.Items.Count == 0)
        {
            // Llenado de items dek DropDownList3
            wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
            // Creación del contenedeor DataSet
            DataSet ds = new DataSet();
            // Ejecución de la consulta para recibir los items en la página
            ds = obj.qryListaRol();
            // Configuración del DropDownList3
            DropDownList1.DataSource = ds;
            DropDownList1.DataMember = "listaRol";
            DropDownList1.DataValueField = "rol_cve_rol";
            DropDownList1.DataTextField = "rol_nombre";
            DropDownList1.DataBind();
        }

        // Validación y llenado de datos del Complejo (Modificar/Eliminar)
        int r;
        if (TextBox1.Text != "" && int.TryParse(TextBox1.Text, out r) == true)
        {
            wsrvFurniture.conexionesSoapClient objUsuarioABC = new wsrvFurniture.conexionesSoapClient();
            DataSet dsUsuarioABC = new DataSet();
            dsUsuarioABC = objUsuarioABC.qryUsuarioABC(TextBox1.Text);
            // Validación de los datos recibidos
            DataTable dtUsuarioABC = dsUsuarioABC.Tables["usuarioABC"];
            if (dtUsuarioABC.Rows.Count != 0)
            {
                foreach (DataRow dr in dtUsuarioABC.Rows)
                {
                    // Obtención de los datos (solo si el usuario EXISTE)
                    TextBox2.Text = dr[1].ToString();
                    TextBox6.Text = dr[2].ToString();
                    TextBox7.Text = dr[3].ToString();
                    TextBox8.Text = dr[4].ToString();
                    TextBox9.Text = dr[5].ToString();
                    TextBox10.Text = dr[6].ToString();
                    TextBox11.Text = dr[7].ToString();
                    TextBox12.Text = dr[8].ToString();
                    TextBox13.Text = dr[9].ToString();
                    TextBox14.Text = dr[10].ToString();
                    TextBox15.Text = dr[11].ToString();
                    TextBox16.Text = dr[12].ToString();
                    DropDownList1.SelectedValue = dr[13].ToString();
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('La clave de usuario no existe, verificar ...');</script>");
                TextBox2.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox14.Text = "";
                TextBox15.Text = "";
                TextBox16.Text = "";
                DropDownList1.SelectedIndex = 0;
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
            ds = obj.insUsuario(TextBox2.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text,
                                TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text,
                                TextBox13.Text, TextBox14.Text, TextBox15.Text, TextBox16.Text, DropDownList1.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["insUsuario"];
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
                Response.Write("<script language='javascript'>alert('Ya existe el correo...');</script>");
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
            ds = obj.updUsuario(TextBox1.Text, TextBox2.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text,
                                TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text,
                                TextBox13.Text, TextBox14.Text, TextBox15.Text, TextBox16.Text, DropDownList1.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["updUsuario"];
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
                Response.Write("<script language='javascript'>alert('No se pudo actualizar, no existe la clave del usuario');</script>");
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
            // Ejecución del método de eliminación de Usuario
            wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
            DataSet ds = new DataSet();
            ds = obj.delUsuario(TextBox1.Text);

            // Obtención de la bandera recibida en el dataset
            // Obtención del DataTable que tiene el dato recibido
            DataTable dt = ds.Tables["delUsuario"];
            // Validación del dato recibido
            String bandera = "";
            foreach (DataRow dr in dt.Rows)
            {
                bandera = dr[0].ToString();
            }
            // Enviar mensaje al usuario del proceso resultante
            if (bandera == "1")
                Response.Write("<script language='javascript'>alert('Se eliminó el usuario de manera exitosa!!');</script>");
            if (bandera == "-1")
                Response.Write("<script language='javascript'>alert('No se pudo eliminar, no existe la clave del usuario');</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>alert('[Error de formato], verifica tus datos e intenta de nuevo');</script>");
        }
    }
}