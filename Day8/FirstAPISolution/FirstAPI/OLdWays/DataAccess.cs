using FirstAPI.Models;
using System.Data;
using System.Data.SqlClient;

namespace FirstAPI.OLdWays
{
    public class DataAccess
    {
        SqlDataAdapter dataAdapter;
        SqlConnection conn;
        public DataAccess()
        {
            conn = new SqlConnection("Data source=DESKTOP-1C1EU5R\\SQLSERVER2019G3;user id=sa;password=P@ssw0rd;Initial catalog=dbSample26Apr2023");
            dataAdapter = new SqlDataAdapter("select * from employees", conn);
        }

        public List<Employee> GetEmployees()
        {
            List<Employee> employees = new List<Employee>();
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            foreach (DataRow item in dataSet.Tables[0].Rows)
            {
                Employee employee = new Employee();
                employee.Id = Convert.ToInt32(item[0].ToString());
                employee.Name = item[1].ToString();
                employee.Email = item[2].ToString();
                employee.Phone = item[3].ToString();
                employee.Pic = item[4].ToString();
                employee.DateOfBirth = Convert.ToDateTime(item[5]);
                employees.Add(employee);
            }
            return employees;
        }
    }
}
