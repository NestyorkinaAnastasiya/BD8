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
    public partial class query1 : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e){        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Создаем объект подключения
            OdbcConnection conn = new OdbcConnection();
            // Задаем параметр подключения – имя ODBC-источника
            conn.ConnectionString = "Dsn=PostgreSQL30";
            // Подключаемся к БД
            conn.Open();
            // Определяем строку с текстом запроса
            string strSQL = "Select distinct s.n_post, s.name, s.reiting, s.town \nfrom pmib4306.spj1\n";
            strSQL += "join pmib4306.j on j.n_izd = spj1.n_izd\n";
            strSQL += "join pmib4306.s on s.n_post = spj1.n_post\n";
            strSQL += "where j.town = ?\norder by 1";
            // Создаем объект запроса
            OdbcCommand cmd = new OdbcCommand(strSQL, conn);
         
            // Создаем параметр
            OdbcParameter par_town = new OdbcParameter();
            par_town.ParameterName = "@vtown";
            par_town.OdbcType = OdbcType.Text;
            par_town.Value = DropDownList1.SelectedItem.Value;
            // Добавляем второй параметр в коллекцию.
            cmd.Parameters.Add(par_town);
            // Объявляем объект транзакции
            OdbcTransaction tx = null;
            try
            {
                // Начинаем транзакцию и извлекаем объект транзакции из объекта подключения.
                tx = conn.BeginTransaction();
                // Включаем объект SQL-команды в транзакцию
                cmd.Transaction = tx;
                // Выполняем SQL-команду и получаем количество обработанных записей
                OdbcDataReader cursor = cmd.ExecuteReader();
                
                // Создаём динамическую таблицу, в которой будем хранить результат "курсора"
                DataTable dt = new DataTable();
                // Формируем строки таблицы
                dt.Columns.Add("n_post", typeof(string));
                dt.Columns.Add("name", typeof(string));
                dt.Columns.Add("reiting", typeof(string));
                dt.Columns.Add("town", typeof(string));
                               
                string n_post, name, reiting, town;
                
                if (cursor.HasRows)
                {
                    while (cursor.Read())
                    {
                        // Считываем соответствующие данные с текущей строки курсора
                        n_post= cursor.GetString(0);
                        name = cursor.GetString(1);
                        reiting = cursor.GetString(2);
                        town = cursor.GetString(3);
                        // Добавляем строку в таблицу
                        dt.Rows.Add(n_post, name, reiting, town);
                    }
                }
                // Ассоциируем GridView с полученной таблицей
                GridView1.DataSource = dt;
                // Связывает источник данных с вызывающим серверным элементом управления 
                // и всеми его дочерними элементами управления
                GridView1.DataBind();
                // Подтверждаем транзакцию  
                tx.Commit();
            }
            catch (Exception ex)
            {
                // При возникновении любой ошибки 
                // Формируем сообщение об ошибке 
                Label2.Text = ex.Message;
                // выполняем откат транзакции 
                tx.Rollback();
            }
            //закрываем соединение
            conn.Close();
        }
    }
}