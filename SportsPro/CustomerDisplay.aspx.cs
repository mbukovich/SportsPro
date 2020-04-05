using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SportsPro
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CustomerDDL.DataBind();

            Customer selectedCustomer = this.GetSelectedCustomer();

            TextBoxAddress.Text = selectedCustomer.Address;
            LabelPhone.Text = selectedCustomer.Phone;
            LabelEmail.Text = selectedCustomer.Email;
        }

        private Customer GetSelectedCustomer()
        {
            DataView customerTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            customerTable.RowFilter = string.Format("CustomerID = '{0}'",CustomerDDL.SelectedValue);

            DataRowView row = (DataRowView)customerTable[0];

            String streetAddress = row["Address"].ToString() + Environment.NewLine + row["City"].ToString()
                                    + ", " + row["State"].ToString() + " " + row["ZipCode"].ToString();

            Customer customer = new Customer();

            customer.CustomerID = row["CustomerID"].ToString();
            customer.Name = row["Name"].ToString();
            customer.Address = streetAddress;
            customer.Phone = row["Phone"].ToString();
            customer.Email = row["Email"].ToString();

            return customer;
        }
    }
}