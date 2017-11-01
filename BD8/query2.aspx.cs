using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;

namespace BD8
{
    public partial class query2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Создаем объект подключения
            OdbcConnection conn = new OdbcConnection();
            // Задаем параметр подключения – имя ODBC-источника
            conn.ConnectionString = "Dsn=PostgreSQL30";
            // Подключаемся к БД
            conn.Open();
            // Определяем строку с текстом запроса
            string strSQL = "Update pmib4306.s set reiting = reiting + ? \n";
            strSQL += "where n_post = (select spj1.n_post\n";
            strSQL += "from pmib4306.spj1\nwhere spj1.n_det = ?\n";
            strSQL += "order by kol desc\nlimit 1)";
            // Создаем объект запроса
            OdbcCommand cmd = new OdbcCommand(strSQL, conn);

            // Создаем первый параметр
            OdbcParameter par_value = new OdbcParameter();
            par_value.ParameterName = "@vvalue";
            par_value.OdbcType = OdbcType.Text;
            par_value.Value = TextBox1.Text;

            // Добавляем второй параметр в коллекцию.
            cmd.Parameters.Add(par_value);

            // Создаем второй параметр
            OdbcParameter par_det = new OdbcParameter();
            par_det.ParameterName = "@vn_det";
            par_det.OdbcType = OdbcType.Text;
            par_det.Value = DropDownList1.SelectedItem.Value;

            // Добавляем второй параметр в коллекцию.
            cmd.Parameters.Add(par_det);

            // Объявляем объект транзакции
            OdbcTransaction tx = null;
            try
            {
                // Начинаем транзакцию и извлекаем объект транзакции из объекта подключения.
                tx = conn.BeginTransaction();
                // Включаем объект SQL-команды в транзакцию
                cmd.Transaction = tx;

                // Выполняем SQL-команду и получаем количество обработанных записей
                int i = cmd.ExecuteNonQuery();

                // Подтверждаем транзакцию  
                tx.Commit();
                Label1.Text = "Число записей изменено: ";
                Label1.Text += i;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                // При возникновении любой ошибки 
                // Формируем сообщение об ошибке 
                Label1.Text = ex.Message;
                // выполняем откат транзакции 
                tx.Rollback();
            }

            //закрываем соединение
            conn.Close();

        }


    }
}
