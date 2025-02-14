using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Data.Linq;
using System.Reflection;
using System.Collections.Generic;
using System.Collections.Specialized;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
	public partial class MultipleSelect_Edit : System.Web.DynamicData.FieldTemplateUserControl
	{
		List<string> selectedValues = new List<string>();
		protected void Page_Load( object sender, EventArgs e )
		{
			
		}

		protected override void OnDataBinding( EventArgs e )
		{
			base.OnDataBinding(e);

			//find the foreignkeycolumn not pointing to the current table so the foreignforeign table			
			MetaForeignKeyColumn mfk = (MetaForeignKeyColumn)ChildrenColumn.ChildTable.Columns.Single<MetaColumn>(c => c is MetaForeignKeyColumn && c.Name != this.Column.Table.EntityType.Name);
			if (mfk != null)
			{
				//fill the listbox with the items of the foreignforeign table
				LinqDataSource lds = new LinqDataSource();
				lds.ContextTypeName = ChildrenColumn.ChildTable.DataContextType.FullName;
				lds.TableName = mfk.ParentTable.Name;

				_ddlItems.DataSource = lds;
				_ddlItems.DataTextField = mfk.ParentTable.DisplayColumn.Name;
				_ddlItems.DataValueField = mfk.ParentTable.PrimaryKeyColumns[0].Name;
				_ddlItems.DataBind();

				//when we set the ListItem.Selected to true here it doesn't work, so it is deferred to the 
				//prerender and temporarily stored in a string list
				selectedValues.Clear();
				if (!IsPostBack)
				{
					IList a = FieldValue as IList;
					foreach (var b in a)
					{
						object val = ( (PropertyInfo)b.GetType().GetProperty(mfk.ForeignKeyNames[0]) ).GetValue(b, null);
						selectedValues.Add(val.ToString());
					}
				}
			}
		}
		protected override void ExtractValues( IOrderedDictionary dictionary )
		{
			if (IsPostBack)
			{
				//find the foreignkey pointing to this table
				MetaForeignKeyColumn mfkThis = (MetaForeignKeyColumn)ChildrenColumn.ChildTable.Columns.Single<MetaColumn>(c => c is MetaForeignKeyColumn && c.Name == this.Column.Table.EntityType.Name);
				//find the foreignkey pointing to the other table
				MetaForeignKeyColumn mfk = (MetaForeignKeyColumn)ChildrenColumn.ChildTable.Columns.Single<MetaColumn>(c => c is MetaForeignKeyColumn && c.Name != this.Column.Table.EntityType.Name);
				if (mfk != null)
				{
					//get a new context for the updates of the many to many table
					Type t = Type.GetType(Table.DataContextType.FullName);
					System.Data.Linq.DataContext c = Activator.CreateInstance(t) as System.Data.Linq.DataContext;

					//get the manytomany table object
					ITable o = c.GetType().GetProperty(ChildrenColumn.ChildTable.Name).GetValue(c, null) as ITable;
					if (o != null)
					{
						//first delete all items
						foreach (ListItem li in _ddlItems.Items)
						{
							object entity = Activator.CreateInstance(o.ElementType);
							o.ElementType.GetProperty(mfkThis.ForeignKeyNames[0]).SetValue(entity, Convert.ToInt32(Request.QueryString[Table.PrimaryKeyColumns[0].Name]), null);
							o.ElementType.GetProperty(mfk.ForeignKeyNames[0]).SetValue(entity, Convert.ToInt32(li.Value), null);
							//has to be attached to be deleted
							o.Attach(entity);
							o.DeleteOnSubmit(entity);						
						}
						c.SubmitChanges();
						//then add selected items
						foreach(ListItem li in _ddlItems.Items)
						{
							if (li.Selected)
							{
								object entity = Activator.CreateInstance(o.ElementType);
								o.ElementType.GetProperty(mfkThis.ForeignKeyNames[0]).SetValue(entity, Convert.ToInt32(Request.QueryString[Table.PrimaryKeyColumns[0].Name]), null);
								o.ElementType.GetProperty(mfk.ForeignKeyNames[0]).SetValue(entity, Convert.ToInt32(li.Value), null);
								o.InsertOnSubmit(entity);
							}
						}
						c.SubmitChanges();
					}
					
				}
			}

		}
		
		protected override void OnPreRender( EventArgs e )
		{
			//select the correct items in the listbox
			foreach (string s in selectedValues)
			{
				if (_ddlItems.Items.FindByValue(s) != null)
				{
					_ddlItems.Items.FindByValue(s).Selected = true;
				}
			}
				base.OnPreRender(e);
		}

	}
}