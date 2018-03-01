using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.IO;
using System.Text;

namespace BD8
{
   
    public partial class loadpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                                    
        }

        protected void UpdateTable_Click(object sender, EventArgs e)
        {
            // Объект подключения
            OdbcConnection conn;
            Label1.Text = "";
            Label2.Text = "";
            // Создаем объект подключения
            conn = new OdbcConnection();
            // Задаем параметр подключения – имя ODBC-источника
            conn.ConnectionString = "Dsn=PostgreSQL30";
            // Подключаемся к БД
            conn.Open();
            
            // Считываем запрос на обновление информации из файла
            string deleteSQL = File.ReadAllText(@"C:\Users\Анастасия\source\repos\BD8\BD8\update.txt",Encoding.GetEncoding(1251));
                
            OdbcCommand cmd = new OdbcCommand(deleteSQL, conn);
           
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
                // Информируем пользователя об успешном выполнении запроса
                Label2.Text = "Обновление прошло успешно";
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

        protected void Query1_Click(object sender, EventArgs e)
        {

        }
    }
}