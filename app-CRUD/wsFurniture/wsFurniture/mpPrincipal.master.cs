using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mpPrincipal : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (Session["Nombre"].ToString() != "" && 
            Session["Correo"].ToString() != "" && 
            Session["Rol"].ToString() != "")
        {
            Response.Write("<script languaje= 'javascript'> alert('Bienvenido') </script>");
        }
        else
        {
            Response.Write("<script languaje= 'javascript'> alert('Debe iniciar sesión') </script>");
            Response.Write("<script languaje= 'javascript'> document.location.href='Acceso.aspx' </script>");
        }*/
    }
}
