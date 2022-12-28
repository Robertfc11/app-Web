using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Se habilita la paginación
        GridView1.PageIndexChanging += GridView1_PageIndexChanging;

        // Se mestran los resultados sin filtro de búsqueda a menos que el textbox tenga texto ingresado
        DataSet ds = new DataSet();
        wsrvFurniture.conexionesSoapClient obj = new wsrvFurniture.conexionesSoapClient();
        String filtro = TextBox1.Text;
        ds = obj.vw_Producto(filtro);
        GridView1.DataSource = ds;
        GridView1.DataMember = "vwProducto";
        GridView1.DataBind();
    }

    private void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //Paginación y sincronización con la base de la base de datos
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        //throw new NotImplementedException();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}