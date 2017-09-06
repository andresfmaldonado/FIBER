using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class PerfilAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_usuario = Convert.ToString(Session["id_usuario"]);           
            if (id_usuario==null || id_usuario == "" || id_usuario=="0")
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                switch (Convert.ToString(Session["rol"]))
                {
                    case "SuperAdministrador":
                        usuarios.Visible = true;
                        break;
                    case "Administrador":
                        usuarios.Visible = true;
                        break;
                    case "Aprendiz":
                        usuarios.Visible = false;
                        break;
                    case "Instructor":
                        usuarios.Visible = false;
                        break;
                    default:
                        Response.Redirect("default.aspx");
                        break;
                }
                HttpContext.Current.Response.Cache.SetAllowResponseInBrowserHistory(false);
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoStore();
                // Stop Caching in IE
                Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
                // Stop Caching in Firefox
                Response.Cache.SetNoStore();
                Response.Cache.AppendCacheExtension("no-cache");
                Response.Expires = 0;
                Response.Cache.SetExpires(DateTime.Now);
                Response.Cache.SetValidUntilExpires(true);
                CancelUnexpectedRePost();
                if (!IsPostBack)
                {
                    DTOUsuario user = new DTOUsuario();
                    user.Id = Convert.ToInt32(id_usuario);
                    CADUsuario procesos = new CADUsuario();
                    procesos.CargarPerfil(user, Nombre, Apellidos, correo, NombreUsuario,Image1);
                    NombreRolUsuario.Text = Convert.ToString(Session["rol"]);
                }
            }
        }

        private void CancelUnexpectedRePost()
        {
            string clientCode = _repostcheckcode.Value;

            //Get Server Code from session (Or Empty if null)
            string serverCode = Session["_repostcheckcode"] as string ?? "";

            if (!IsPostBack || clientCode.Equals(serverCode))
            {
                //Codes are equals - The action was initiated by the user
                //Save new code (Can use simple counter instead Guid)
                string code = Guid.NewGuid().ToString();
                _repostcheckcode.Value = code;
                Session["_repostcheckcode"] = code;
            }
            else
            {
                //Unexpected action - caused by F5 (Refresh) button
                Response.Redirect("PerfilAdmin.aspx");
            }
        }

        protected void Acept_Click(object sender, EventArgs e)
        {
            int confirm = 0;
            string id_usuario = Convert.ToString(Session["id_usuario"]);
            DTOUsuario user = new DTOUsuario();
            user.Id = Convert.ToInt32(id_usuario);
            user.Contraseña = Contraseña.Text;
            CADUsuario procesos = new CADUsuario();
            if (Contraseña.Text != "")
            {
                confirm = confirm + 1;
            }
            if (Confirmacion.Text == Contraseña.Text)
            {
                confirm = confirm + 1;
            }
            if (confirm == 2)
            {
                if (procesos.ModificarPefilUsuario(user) == 0)
                {
                    Contraseña.Text = "";
                    Confirmacion.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "problem", "problema();", true);
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Upload Original Image Here
            string uploadFileName = "";
            string uploadFilePath = "";
            if (FU1.HasFile)
            {
                string ext = Path.GetExtension(FU1.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext;
                    uploadFilePath = Path.Combine(Server.MapPath("~/Fotos"), uploadFileName);
                    try
                    {
                        FU1.SaveAs(uploadFilePath);
                        imgUpload.ImageUrl = "~/Fotos/" + uploadFileName;
                        panCrop.Visible = true;
                        FU1.Visible = false;
                        Label8.Visible = false;
                        picture1.Visible = false;
                        lblMsg.Visible = false;
                        Image3.Visible = false;
                        btnUpload.Visible = false;
                        seleccionarfoto.Visible = false;
                        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "photo();", true);
                    }
                    catch (Exception ex)
                    {
                        // lblMsg.Text = "Error!" + ex + ". Please try again.";
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "problem", "problema();", true);
                    }
                }
                else
                {
                    lblMsg.Text = "Esto no es una foto!";
                }
            }
            else
            {
                lblMsg.Text = "Seleccione una foto!";
            }
            string scriptventana = @"<script type='text/javascript'>
                                    $('#popup2').fadeIn('slow');
                                    $('#popup-overlay2').fadeIn('slow');
                                    </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptventana, false);
           // ScriptManager.RegisterClientScriptBlock(this, GetType(), "ventana", scriptventana, true);
        }

        protected void btnCrop_Click(object sender, EventArgs e)
        {
            // Crop Image Here & Save
            string fileName = Path.GetFileName(imgUpload.ImageUrl);
            string filePath = Path.Combine(Server.MapPath("~/Fotos"), fileName);
            string cropFileName = "";
            string cropFilePath = "";
            if (File.Exists(filePath))
            {
                try
                {
                    System.Drawing.Image orgImg = System.Drawing.Image.FromFile(filePath);
                    Rectangle CropArea = new Rectangle(
                    Convert.ToInt32(X.Value),
                    Convert.ToInt32(Y.Value),
                    Convert.ToInt32(W.Value),
                    Convert.ToInt32(H.Value));

                    Bitmap bitMap = new Bitmap(CropArea.Width, CropArea.Height);
                    using (Graphics g = Graphics.FromImage(bitMap))
                    {
                        g.DrawImage(orgImg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), CropArea, GraphicsUnit.Pixel);
                    }
                    cropFileName = "crop_" + fileName;
                    cropFilePath = Path.Combine(Server.MapPath("~/Fotos"), cropFileName);
                    bitMap.Save(cropFilePath);
                    string id_usuario = Convert.ToString(Session["id_usuario"]);
                    DTOUsuario user = new DTOUsuario();
                    CADUsuario process = new CADUsuario();
                    user.Id = Convert.ToInt32(id_usuario);
                    user.Foto = ("Fotos/"+cropFileName);
                    if (process.ModificarFotoPerfilUsuario(user) == 0)
                    {
                       /* panCrop.Visible = false;
                        FU1.Visible =true;
                        Label8.Visible = true;
                        picture1.Visible = true;
                        lblMsg.Visible = true;
                        Image3.Visible = true;
                        btnUpload.Visible = true;
                        seleccionarfoto.Visible = true;*/
                        Response.Redirect("PerfilAdmin.aspx");
                        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacionphoto();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "problem", "problema();", true);
                    }
                   // Response.Redirect("~/Fotos/" + cropFileName, false);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "problem", "problema();", true);
                }
            }
        }
    }
}