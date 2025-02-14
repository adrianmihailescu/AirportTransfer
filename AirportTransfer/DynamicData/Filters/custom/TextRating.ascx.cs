using System;
using System.Configuration;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Linq;
using System.Linq.Expressions;

namespace AirportTransfer.DynamicData.FieldTemplates.custom
{
    public partial class TextRating_Field : System.Web.DynamicData.QueryableFilterUserControl
    {
        //////////////////
        private const string NullValueString = "[null]";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_OnTextChanged(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

        public override IQueryable GetQueryable(IQueryable source)
        {
            if (string.IsNullOrEmpty(this.TextBox1.Text))
            {
                return source;
            }

            string date = this.TextBox1.Text;
            ConstantExpression value = Expression.Constant(date);

            ParameterExpression parameter = Expression.Parameter(source.ElementType);
            MemberExpression property = Expression.Property(parameter, this.Column.Name);
            if (Nullable.GetUnderlyingType(property.Type) != null)
            {
                property = Expression.Property(property, "Text");
            }

            Expression comparison;

            comparison = Expression.Call(property, typeof(string).GetMethod("Contains", new Type[] { typeof(string) }), value);


            LambdaExpression lambda = Expression.Lambda(comparison, parameter);

            MethodCallExpression where = Expression.Call(
              typeof(Queryable)
              , "Where"
              , new Type[] { source.ElementType }
              , new Expression[] { source.Expression, Expression.Quote(lambda) });

            return source.Provider.CreateQuery(where);
        }

        protected void lnkClearRating_Click(object sender, EventArgs e)
        {
            TextBox1.Text = null;
        }

    }
}
