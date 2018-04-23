using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace InstantEditing {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack) {
                ASPxTreeList1.DataBind();
                ASPxTreeList1.ExpandAll();
                if(ASPxTreeList1.FocusedNode == null)
                    ASPxTreeList1.Nodes[0].Focus();
                ASPxTreeList1.StartEdit(ASPxTreeList1.FocusedNode.Key);
            }
        }

        protected void ASPxTreeList1_CustomCallback(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomCallbackEventArgs e) {
            string[] param = e.Argument.Split(';');
            if(param.Length == 2 && param[0] == "UpdateAndEdit") {
                ASPxTreeList1.UpdateEdit();
                ASPxTreeList1.StartEdit(param[1]);
            }
        }
    }
}
