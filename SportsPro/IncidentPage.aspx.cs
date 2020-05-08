using SportsPro.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro
{
    public partial class IncidentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var techSupportContext = new TechSupportContext();
            // If this is the first time we are loading the page, we query the data and populate the drop down lists
            if (!Page.IsPostBack)
            {
                List<SportsPro.Models.Customer> customerList = techSupportContext.getAllCustomers();
                List<SportsPro.Models.Technician> technicianList = techSupportContext.getAllTechnicians();
                List<SportsPro.Models.Product> productList = techSupportContext.getAllProducts();
                List<SportsPro.Models.Incident> openIncidents = techSupportContext.getOpenIncidents();

                if (customerList != null)
                {
                    ddl_customers.DataSource = customerList;
                    ddl_customers.DataValueField = "CustomerID";
                    ddl_customers.DataTextField = "Name";
                    ddl_customers.DataBind();
                }

                if (technicianList != null)
                {
                    ddl_technicians.DataSource = technicianList;
                    ddl_technicians.DataValueField = "TechID";
                    ddl_technicians.DataTextField = "Name";
                    ddl_technicians.DataBind();
                }

                if (productList != null)
                {
                    ddl_products.DataSource = productList;
                    ddl_products.DataValueField = "ProductCode";
                    ddl_products.DataTextField = "Name";
                    ddl_products.DataBind();
                }

                if (openIncidents != null)
                {
                    ddl_openIncidents.DataSource = openIncidents;
                    ddl_openIncidents.DataValueField = "IncidentID";
                    ddl_openIncidents.DataTextField = "IncidentID";
                    ddl_openIncidents.DataBind();
                }
            }

            // Now, whenever a PostBack happens, the Accordian Control updates it's data
            int selectedID = Convert.ToInt32(ddl_customers.SelectedValue);

            // We make sure that the selected value in the Customer ddl is a valid integer.
            if (selectedID > 0)
            {
                TechSupportContext context = new TechSupportContext();
                List<Incident> incident = context.returnIncidents(selectedID);
                Accd_Incident_View.DataSource = incident;
                Accd_Incident_View.DataBind();

                // The following line makes sure that the Accordian clears itself if a Customer without issues is selected
                if (incident == null) Accd_Incident_View.Panes.Clear();
                
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            // We check to make sure we have legitimate data inputs
            Boolean isTitleValid = (!string.IsNullOrWhiteSpace(tb_title.Text));
            Boolean isDescriptionValid = (!string.IsNullOrWhiteSpace(tb_description.Text));
            Boolean isTechnicianValid = (Convert.ToInt32(ddl_technicians.SelectedValue) > 0);
            Boolean isProductValid = (!string.IsNullOrWhiteSpace(ddl_products.SelectedValue));

            Boolean allValid = (isDescriptionValid && isProductValid && isTechnicianValid && isTitleValid);

            // If all input is valid, we create a new Incident and add it to our data model
            if (allValid)
            {
                Incident newIncident = new Incident();

                newIncident.CustomerID = Convert.ToInt32(ddl_customers.SelectedValue);
                newIncident.ProductCode = ddl_products.SelectedValue;
                newIncident.TechID = Convert.ToInt32(ddl_technicians.SelectedValue);
                newIncident.DateOpened = DateTime.Now;
                newIncident.DateClosed = null;
                newIncident.Title = tb_title.Text;
                newIncident.Description = tb_description.Text;

                TechSupportContext newContext = new TechSupportContext();

                newContext.addIncident(newIncident);

                // We make sure any error messages are no longer visible, inform the user of success, and clear the textboxes
                hideAllErrorMessages();
                lbl_submitted.ForeColor = System.Drawing.Color.Black;
                lbl_submitted.Text = "Incident \"" + tb_title.Text + "\" has been added.";
                tb_title.Text = "";
                tb_description.Text = "";

                // The following code is for making sure that the open incident drop down list
                // and the accordion refresh when the data has been altered.
                // I feel like there must be a better way to handle this, but this is what I have for now.
                List<Incident> incident = newContext.returnIncidents(Convert.ToInt32(ddl_customers.SelectedValue));
                List<SportsPro.Models.Incident> openIncidents = newContext.getOpenIncidents();
                Accd_Incident_View.DataSource = incident;
                ddl_openIncidents.DataSource = openIncidents;
                ddl_openIncidents.DataValueField = "IncidentID";
                ddl_openIncidents.DataTextField = "IncidentID";

                ddl_openIncidents.DataBind();
                Accd_Incident_View.DataBind();
            }
            else
            {
                // If there is a problem with one of the inputs, we display the appropriate error messages
                if (!isTitleValid) lbl_titleError.Visible = true;
                if (!isDescriptionValid) lbl_descError.Visible = true;
                if (!isTechnicianValid) lbl_technicianError.Visible = true;
                if (!isProductValid) lbl_productsError.Visible = true;

                lbl_submitted.ForeColor = System.Drawing.Color.Red;
                lbl_submitted.Text = "Please enter all information correctly";
            }
        }

        private void hideAllErrorMessages()
        {
            lbl_technicianError.Visible = false;
            lbl_productsError.Visible = false;
            lbl_titleError.Visible = false;
            lbl_descError.Visible = false;
        }

        protected void btn_closeIncident_Click(object sender, EventArgs e)
        {
            TechSupportContext context = new TechSupportContext();

            if (Convert.ToInt32(ddl_openIncidents.SelectedValue) > 0)
            {
                context.closeIncident(Convert.ToInt32(ddl_openIncidents.SelectedValue));

                lbl_incident_close.ForeColor = System.Drawing.Color.Black;
                lbl_incident_close.Text = "Indident " + ddl_openIncidents.SelectedValue + " closed";

                // The following code is for making sure that the open incident drop down list
                // and the accordion refresh when the data has been altered.
                // I feel like there must be a better way to handle this, but this is what I have for now.
                List<Incident> incident = context.returnIncidents(Convert.ToInt32(ddl_customers.SelectedValue));
                List<SportsPro.Models.Incident> openIncidents = context.getOpenIncidents();
                Accd_Incident_View.DataSource = incident;
                ddl_openIncidents.DataSource = openIncidents;
                ddl_openIncidents.DataValueField = "IncidentID";
                ddl_openIncidents.DataTextField = "IncidentID";

                ddl_openIncidents.DataBind();
                Accd_Incident_View.DataBind();
            }
            else
            {
                // If there is no data in the open incident drop down list, we display an error message
                lbl_incident_close.ForeColor = System.Drawing.Color.Red;
                lbl_incident_close.Text = "No Incident Selected";
            }
        }
    }
}