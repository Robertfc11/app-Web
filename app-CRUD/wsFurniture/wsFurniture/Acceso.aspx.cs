using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
        DataSet ds = new DataSet();
        ds = obj.qryAcceso(txtUsuario.Text, txtPassword.Text);
        //Validación de datos recibidos
        DataTable dt = ds.Tables["acceso"];
        String bandera = "";
        foreach (DataRow dr in dt.Rows)
        {
            bandera = dr[0].ToString();
            if (bandera == "1")
            {
                Session["Nombre"] = dr[1].ToString();
                Session["Usuario"] = dr[2].ToString();
                Session["Rol"] = dr[3].ToString();
            }
            else
            {
                Session["Nombre"] = "";
                Session["Usuario"] = "";
                Session["Rol"] = "";
            }

        }
        if (bandera == "1")
        {
            Response.Write("<script languaje= 'javascript'> alert('Bienvenide: " +
                Session["Nombre"].ToString() + ", " +
                Session["Usuario"].ToString() + " [" +
                Session["Rol"].ToString() + "]" + "') </script>");
            Response.Write("<script languaje= 'javascript'> document.location.href='Productos.aspx' </script>");
        }
        else
        {
            Response.Write("<script languaje= 'javascript'> alert('Usted no es un usuario válide, verifique sus datos') </script>");
            Response.Write("<script languaje= 'javascript'> document.location.href='Acceso.aspx' </script>");
        }
    }
}